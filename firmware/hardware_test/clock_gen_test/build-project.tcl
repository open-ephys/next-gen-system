#Open-Ephys script for generation of Vivado project

#Manually set here the properties of the project
set proj_name clock_gen_test
set thepart "xc7k325tffg900-2"
set top_file "clockgen_top"

#set pcie_vivado pcie_k7_vivado

#Set folder structure
set base_dir [file dirname [info script]]
set proj_dir "$base_dir/$proj_name"
set temp_dir "$base_dir/Temp"
set sources_dir "$base_dir/Sources"
set code_dir "$sources_dir/Verilog"
set ip_dir "$sources_dir/IP"
set constraints_dir "$sources_dir/Constraints"
set other_dir "$base_dir/Other"

#Delete olf project
file delete -force $proj_dir
#Create project
create_project $proj_name "$proj_dir/"

# Set project properties
set obj [get_projects $proj_name]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" $thepart $obj
set_property "simulator_language" "Mixed" $obj
set_property "source_mgmt_mode" "DisplayOnly" $obj
set_property target_language Verilog $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "edif_extra_search_paths" "[file normalize "$other_dir"]" $obj
set_property "top" $top_file $obj

#add IP
set files [glob -nocomplain -directory [file normalize $ip_dir] *.xci]
if !{[string equal $files ""]} {
import_ip -srcset $obj $files
upgrade_ip [get_ips]
}



#This is specific for xillybus. It uses a file from the pcie IP example. Instead of copying it, which can generate errors between versions, we just generate the example
#generate_target example [get_ips $pcie_vivado]
#file copy -force "[file normalize "$proj_dir/${proj_name}.srcs/sources_1/ip/$pcie_vivado/example_design/support/${pcie_vivado}_pipe_clock.v"]" "[file normalize "$code_dir"]"

add_files -fileset $obj $sources_dir

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Add files to 'constrs_1' fileset
set obj [get_filesets constrs_1]
add_files -fileset $obj $constraints_dir

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets sim_1] ""]} {
  create_fileset -simset sim_1
}

# Add files to 'sim_1' fileset
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "runtime" "1000 ns" $obj
set_property "top" "unknown" $obj
set_property "unit_under_test" "UUT" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs synth_1] ""]} {
  create_run -name synth_1 -part $thepart -flow {Vivado Synthesis 2014} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
}
set obj [get_runs synth_1]
set_property "part" $thepart $obj

# Create 'impl_1' run (if not found)
if {[string equal [get_runs impl_1] ""]} {
  create_run -name impl_1 -part $thepart -flow {Vivado Implementation 2014} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
}
set obj [get_runs impl_1]
set_property "part" $thepart $obj
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true $obj
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true $obj
#set_property STEPS.WRITE_BITSTREAM.TCL.PRE "$other_dir/showstopper.tcl" $obj

puts "INFO: Project created: $proj_name"