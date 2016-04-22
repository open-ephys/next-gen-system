proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.cache/wt [current_project]
  set_property parent.project_path /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.xpr [current_project]
  set_property ip_repo_paths /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.cache/ip [current_project]
  set_property ip_output_repo /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.cache/ip [current_project]
  add_files -quiet /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/synth_1/xillydemo.dcp
  set_property edif_extra_search_paths /home/oe/Downloads/xillybus-eval-kintex7-1.2d/core [current_fileset]
  add_files -quiet /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/fifo_8x2048_synth_1/fifo_8x2048.dcp
  set_property netlist_only true [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/fifo_8x2048_synth_1/fifo_8x2048.dcp]
  add_files -quiet /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/fifo_32x512_synth_1/fifo_32x512.dcp
  set_property netlist_only true [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/fifo_32x512_synth_1/fifo_32x512.dcp]
  add_files -quiet /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/pcie_k7_vivado_synth_1/pcie_k7_vivado.dcp
  set_property netlist_only true [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/pcie_k7_vivado_synth_1/pcie_k7_vivado.dcp]
  read_xdc -mode out_of_context -ref fifo_8x2048 -cells U0 /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_8x2048/ip/fifo_8x2048/fifo_8x2048_ooc.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_8x2048/ip/fifo_8x2048/fifo_8x2048_ooc.xdc]
  read_xdc -ref fifo_8x2048 -cells U0 /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_8x2048/ip/fifo_8x2048/fifo_8x2048/fifo_8x2048.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_8x2048/ip/fifo_8x2048/fifo_8x2048/fifo_8x2048.xdc]
  read_xdc -mode out_of_context -ref fifo_32x512 -cells U0 /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_32x512/ip/fifo_32x512/fifo_32x512_ooc.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_32x512/ip/fifo_32x512/fifo_32x512_ooc.xdc]
  read_xdc -ref fifo_32x512 -cells U0 /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_32x512/ip/fifo_32x512/fifo_32x512/fifo_32x512.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/fifo_32x512/ip/fifo_32x512/fifo_32x512/fifo_32x512.xdc]
  read_xdc -mode out_of_context -ref pcie_k7_vivado -cells inst /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/pcie_k7_vivado/ip/pcie_k7_vivado/synth/pcie_k7_vivado_ooc.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/pcie_k7_vivado/ip/pcie_k7_vivado/synth/pcie_k7_vivado_ooc.xdc]
  read_xdc -ref pcie_k7_vivado -cells inst /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/pcie_k7_vivado/ip/pcie_k7_vivado/source/pcie_k7_vivado-PCIE_X0Y0.xdc
  set_property processing_order EARLY [get_files /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/pcie_k7_vivado/ip/pcie_k7_vivado/source/pcie_k7_vivado-PCIE_X0Y0.xdc]
  read_xdc /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.srcs/constrs_1/imports/vivado-essentials/xillydemo.xdc
  link_design -top xillydemo -part xc7k325tffg900-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force xillydemo_opt.dcp
  catch {report_drc -file xillydemo_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force xillydemo_placed.dcp
  catch { report_io -file xillydemo_io_placed.rpt }
  catch { report_clock_utilization -file xillydemo_clock_utilization_placed.rpt }
  catch { report_utilization -file xillydemo_utilization_placed.rpt -pb xillydemo_utilization_placed.pb }
  catch { report_control_sets -verbose -file xillydemo_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design 
  write_checkpoint -force xillydemo_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
}

  set_msg_config -id {Route 35-39} -severity "critical warning" -new_severity warning
start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force xillydemo_routed.dcp
  catch { report_drc -file xillydemo_drc_routed.rpt -pb xillydemo_drc_routed.pb }
  catch { report_timing_summary -max_paths 10 -file xillydemo_timing_summary_routed.rpt -rpx xillydemo_timing_summary_routed.rpx }
  catch { report_power -file xillydemo_power_routed.rpt -pb xillydemo_power_summary_routed.pb }
  catch { report_route_status -file xillydemo_route_status.rpt -pb xillydemo_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step post_route_phys_opt_design
set rc [catch {
  create_msg_db post_route_phys_opt_design.pb
  phys_opt_design 
  write_checkpoint -force xillydemo_postroute_physopt.dcp
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file xillydemo_timing_summary_postroute_physopted.rpt -rpx xillydemo_timing_summary_postroute_physopted.rpx }
  close_msg_db -file post_route_phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed post_route_phys_opt_design
  return -code error $RESULT
} else {
  end_step post_route_phys_opt_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set src_rc [catch { 
    puts "source /home/oe/Downloads/xillybus-eval-kintex7-1.2d/vivado-essentials/showstopper.tcl"
    source /home/oe/Downloads/xillybus-eval-kintex7-1.2d/vivado-essentials/showstopper.tcl
  } _RESULT] 
  if {$src_rc} { 
    send_msg_id runtcl-1 error "$_RESULT"
    send_msg_id runtcl-2 error "sourcing script /home/oe/Downloads/xillybus-eval-kintex7-1.2d/vivado-essentials/showstopper.tcl failed"
    return -code error
  }
  write_bitstream -force xillydemo.bit 
  if { [file exists /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/synth_1/xillydemo.hwdef] } {
    catch { write_sysdef -hwdef /home/oe/Desktop/oe_xillybus_test_firmware_01/oe_xillybus_test_firmware_01.runs/synth_1/xillydemo.hwdef -bitfile xillydemo.bit -meminfo xillydemo.mmi -file xillydemo.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

