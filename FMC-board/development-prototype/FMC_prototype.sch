<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="SA_BB">
<packages>
<package name="FMC_LPC_FEMALE_WITH_SP601_SILK">
<wire x1="24.765" y1="5.715" x2="-24.765" y2="5.715" width="0.254" layer="48"/>
<wire x1="-24.765" y1="5.715" x2="-24.765" y2="-5.715" width="0.254" layer="48"/>
<wire x1="-24.765" y1="-5.715" x2="24.765" y2="-5.715" width="0.254" layer="48"/>
<wire x1="24.765" y1="-5.715" x2="24.765" y2="5.715" width="0.254" layer="48"/>
<wire x1="27.94" y1="-6.35" x2="27.94" y2="6.35" width="0.254" layer="21"/>
<wire x1="-27.94" y1="-6.35" x2="-27.94" y2="6.35" width="0.254" layer="21"/>
<wire x1="27.94" y1="6.35" x2="-27.94" y2="6.35" width="0.254" layer="21"/>
<wire x1="27.94" y1="-6.35" x2="-27.94" y2="-6.35" width="0.254" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.254" layer="48"/>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.254" layer="48"/>
<wire x1="34.036" y1="6.477" x2="-34.036" y2="6.477" width="0.254" layer="21"/>
<wire x1="34.036" y1="-16.383" x2="-34.036" y2="-16.383" width="0.254" layer="21"/>
<wire x1="-34.036" y1="6.477" x2="-34.036" y2="-16.383" width="0.254" layer="21"/>
<wire x1="34.036" y1="6.477" x2="34.036" y2="-16.383" width="0.254" layer="21"/>
<wire x1="29.21" y1="0.762" x2="29.21" y2="-0.762" width="0.254" layer="21"/>
<wire x1="29.21" y1="0.762" x2="27.94" y2="0.762" width="0.254" layer="21"/>
<wire x1="29.21" y1="-0.762" x2="27.94" y2="-0.762" width="0.254" layer="21"/>
<circle x="27.1907" y="-3.048" radius="0.6604" width="0.254" layer="48"/>
<circle x="-27.1653" y="0" radius="0.6604" width="0.254" layer="48"/>
<pad name="GNDB" x="31.496" y="2.032" drill="2.6924"/>
<pad name="GNDA" x="-31.496" y="2.032" drill="2.6924"/>
<smd name="P$1" x="24.765" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$2" x="23.495" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$3" x="22.225" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$4" x="20.955" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$5" x="19.685" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$6" x="18.415" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$7" x="17.145" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$8" x="15.875" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$9" x="14.605" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$10" x="13.335" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$11" x="12.065" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$12" x="10.795" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$13" x="9.525" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$14" x="8.255" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$15" x="6.985" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$16" x="5.715" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$17" x="4.445" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$18" x="3.175" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$19" x="1.905" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$20" x="0.635" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$21" x="-0.635" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$22" x="-1.905" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$23" x="-3.175" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$24" x="-4.445" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$25" x="-5.715" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$26" x="-6.985" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$27" x="-8.255" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$28" x="-9.525" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$29" x="-10.795" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$30" x="-12.065" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$31" x="-13.335" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$32" x="-14.605" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$33" x="-15.875" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$34" x="-17.145" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$35" x="-18.415" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$36" x="-19.685" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$37" x="-20.955" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$38" x="-22.225" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$39" x="-23.495" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$40" x="-24.765" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$41" x="24.765" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$42" x="23.495" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$43" x="22.225" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$44" x="20.955" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$45" x="19.685" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$46" x="18.415" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$47" x="17.145" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$48" x="15.875" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$49" x="14.605" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$50" x="13.335" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$51" x="12.065" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$52" x="10.795" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$53" x="9.525" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$54" x="8.255" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$55" x="6.985" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$56" x="5.715" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$57" x="4.445" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$58" x="3.175" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$59" x="1.905" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$60" x="0.635" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$61" x="-0.635" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$62" x="-1.905" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$63" x="-3.175" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$64" x="-4.445" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$65" x="-5.715" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$66" x="-6.985" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$67" x="-8.255" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$68" x="-9.525" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$69" x="-10.795" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$70" x="-12.065" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$71" x="-13.335" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$72" x="-14.605" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$73" x="-15.875" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$74" x="-17.145" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$75" x="-18.415" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$76" x="-19.685" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$77" x="-20.955" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$78" x="-22.225" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$79" x="-23.495" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$80" x="-24.765" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$81" x="24.765" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$82" x="23.495" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$83" x="22.225" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$84" x="20.955" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$85" x="19.685" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$86" x="18.415" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$87" x="17.145" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$88" x="15.875" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$89" x="14.605" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$90" x="13.335" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$91" x="12.065" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$92" x="10.795" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$93" x="9.525" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$94" x="8.255" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$95" x="6.985" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$96" x="5.715" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$97" x="4.445" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$98" x="3.175" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$99" x="1.905" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$100" x="0.635" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$101" x="-0.635" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$102" x="-1.905" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$103" x="-3.175" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$104" x="-4.445" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$105" x="-5.715" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$106" x="-6.985" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$107" x="-8.255" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$108" x="-9.525" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$109" x="-10.795" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$110" x="-12.065" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$111" x="-13.335" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$112" x="-14.605" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$113" x="-15.875" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$114" x="-17.145" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$115" x="-18.415" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$116" x="-19.685" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$117" x="-20.955" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$118" x="-22.225" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$119" x="-23.495" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$120" x="-24.765" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$121" x="24.765" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$122" x="23.495" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$123" x="22.225" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$124" x="20.955" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$125" x="19.685" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$126" x="18.415" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$127" x="17.145" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$128" x="15.875" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$129" x="14.605" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$130" x="13.335" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$131" x="12.065" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$132" x="10.795" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$133" x="9.525" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$134" x="8.255" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$135" x="6.985" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$136" x="5.715" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$137" x="4.445" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$138" x="3.175" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$139" x="1.905" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$140" x="0.635" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$141" x="-0.635" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$142" x="-1.905" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$143" x="-3.175" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$144" x="-4.445" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$145" x="-5.715" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$146" x="-6.985" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$147" x="-8.255" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$148" x="-9.525" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$149" x="-10.795" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$150" x="-12.065" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$151" x="-13.335" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$152" x="-14.605" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$153" x="-15.875" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$154" x="-17.145" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$155" x="-18.415" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$156" x="-19.685" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$157" x="-20.955" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$158" x="-22.225" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$159" x="-23.495" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="P$160" x="-24.765" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<text x="-8.89" y="-8.89" size="1.27" layer="48">FMC LPC FEMALE 10MM</text>
<text x="25.4" y="4.445" size="0.508" layer="48">1</text>
<text x="-26.035" y="4.445" size="0.508" layer="48">40</text>
<text x="-26.035" y="-5.715" size="0.508" layer="48">160</text>
<text x="25.4" y="-5.715" size="0.508" layer="48">121</text>
<text x="-8.89" y="-11.43" size="1.27" layer="48">ASP-134603-01</text>
<text x="26.67" y="3.175" size="0.508" layer="48">H</text>
<text x="26.67" y="1.905" size="0.508" layer="48">G</text>
<text x="29.21" y="-1.905" size="0.508" layer="48">D</text>
<text x="29.21" y="-3.175" size="0.508" layer="48">C</text>
<text x="-31.75" y="-13.97" size="0.635" layer="48">Checked with SP601 Pins</text>
<hole x="-27.1907" y="0" drill="1.3208"/>
<hole x="27.1653" y="-3.048" drill="1.3208"/>
</package>
<package name="FMC_LPC_MALE_WITH_SP601_BSILK">
<wire x1="-27.94" y1="-6.35" x2="-27.94" y2="6.35" width="0.254" layer="22"/>
<wire x1="27.94" y1="-6.35" x2="27.94" y2="-0.762" width="0.254" layer="22"/>
<wire x1="27.94" y1="-0.762" x2="27.94" y2="0.762" width="0.254" layer="22"/>
<wire x1="27.94" y1="0.762" x2="27.94" y2="6.35" width="0.254" layer="22"/>
<wire x1="-27.94" y1="6.35" x2="27.94" y2="6.35" width="0.254" layer="22"/>
<wire x1="-27.94" y1="-6.35" x2="27.94" y2="-6.35" width="0.254" layer="22"/>
<wire x1="-34.036" y1="6.477" x2="34.036" y2="6.477" width="0.254" layer="22"/>
<wire x1="-34.036" y1="-16.383" x2="34.036" y2="-16.383" width="0.254" layer="22"/>
<wire x1="34.036" y1="6.477" x2="34.036" y2="-16.383" width="0.254" layer="22"/>
<wire x1="-34.036" y1="6.477" x2="-34.036" y2="-16.383" width="0.254" layer="22"/>
<wire x1="29.21" y1="0.762" x2="29.21" y2="-0.762" width="0.254" layer="22"/>
<wire x1="29.21" y1="0.762" x2="27.94" y2="0.762" width="0.254" layer="22"/>
<wire x1="29.21" y1="-0.762" x2="27.94" y2="-0.762" width="0.254" layer="22"/>
<pad name="GNDB" x="31.496" y="2.032" drill="2.6924"/>
<pad name="GNDA" x="-31.496" y="2.032" drill="2.6924"/>
<smd name="P$1" x="24.765" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$2" x="23.495" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$3" x="22.225" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$4" x="20.955" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$5" x="19.685" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$6" x="18.415" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$7" x="17.145" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$8" x="15.875" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$9" x="14.605" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$10" x="13.335" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$11" x="12.065" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$12" x="10.795" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$13" x="9.525" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$14" x="8.255" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$15" x="6.985" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$16" x="5.715" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$17" x="4.445" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$18" x="3.175" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$19" x="1.905" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$20" x="0.635" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$21" x="-0.635" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$22" x="-1.905" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$23" x="-3.175" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$24" x="-4.445" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$25" x="-5.715" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$26" x="-6.985" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$27" x="-8.255" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$28" x="-9.525" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$29" x="-10.795" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$30" x="-12.065" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$31" x="-13.335" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$32" x="-14.605" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$33" x="-15.875" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$34" x="-17.145" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$35" x="-18.415" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$36" x="-19.685" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$37" x="-20.955" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$38" x="-22.225" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$39" x="-23.495" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$40" x="-24.765" y="3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$41" x="24.765" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$42" x="23.495" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$43" x="22.225" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$44" x="20.955" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$45" x="19.685" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$46" x="18.415" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$47" x="17.145" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$48" x="15.875" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$49" x="14.605" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$50" x="13.335" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$51" x="12.065" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$52" x="10.795" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$53" x="9.525" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$54" x="8.255" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$55" x="6.985" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$56" x="5.715" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$57" x="4.445" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$58" x="3.175" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$59" x="1.905" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$60" x="0.635" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$61" x="-0.635" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$62" x="-1.905" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$63" x="-3.175" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$64" x="-4.445" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$65" x="-5.715" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$66" x="-6.985" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$67" x="-8.255" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$68" x="-9.525" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$69" x="-10.795" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$70" x="-12.065" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$71" x="-13.335" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$72" x="-14.605" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$73" x="-15.875" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$74" x="-17.145" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$75" x="-18.415" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$76" x="-19.685" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$77" x="-20.955" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$78" x="-22.225" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$79" x="-23.495" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$80" x="-24.765" y="1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$81" x="24.765" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$82" x="23.495" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$83" x="22.225" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$84" x="20.955" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$85" x="19.685" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$86" x="18.415" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$87" x="17.145" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$88" x="15.875" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$89" x="14.605" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$90" x="13.335" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$91" x="12.065" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$92" x="10.795" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$93" x="9.525" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$94" x="8.255" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$95" x="6.985" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$96" x="5.715" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$97" x="4.445" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$98" x="3.175" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$99" x="1.905" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$100" x="0.635" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$101" x="-0.635" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$102" x="-1.905" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$103" x="-3.175" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$104" x="-4.445" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$105" x="-5.715" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$106" x="-6.985" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$107" x="-8.255" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$108" x="-9.525" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$109" x="-10.795" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$110" x="-12.065" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$111" x="-13.335" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$112" x="-14.605" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$113" x="-15.875" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$114" x="-17.145" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$115" x="-18.415" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$116" x="-19.685" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$117" x="-20.955" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$118" x="-22.225" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$119" x="-23.495" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$120" x="-24.765" y="-1.905" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$121" x="24.765" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$122" x="23.495" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$123" x="22.225" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$124" x="20.955" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$125" x="19.685" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$126" x="18.415" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$127" x="17.145" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$128" x="15.875" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$129" x="14.605" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$130" x="13.335" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$131" x="12.065" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$132" x="10.795" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$133" x="9.525" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$134" x="8.255" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$135" x="6.985" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$136" x="5.715" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$137" x="4.445" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$138" x="3.175" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$139" x="1.905" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$140" x="0.635" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$141" x="-0.635" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$142" x="-1.905" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$143" x="-3.175" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$144" x="-4.445" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$145" x="-5.715" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$146" x="-6.985" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$147" x="-8.255" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$148" x="-9.525" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$149" x="-10.795" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$150" x="-12.065" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$151" x="-13.335" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$152" x="-14.605" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$153" x="-15.875" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$154" x="-17.145" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$155" x="-18.415" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$156" x="-19.685" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$157" x="-20.955" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$158" x="-22.225" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$159" x="-23.495" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<smd name="P$160" x="-24.765" y="-3.175" dx="0.635" dy="0.635" layer="16" roundness="100" rot="R180"/>
<text x="7.62" y="-9.525" size="1.27" layer="48" rot="MR0">FMC LPC MALE 10MM</text>
<text x="25.4" y="4.445" size="0.508" layer="48">1</text>
<text x="-26.035" y="4.445" size="0.508" layer="48">40</text>
<text x="-26.035" y="-5.08" size="0.508" layer="48">160</text>
<text x="25.4" y="-5.08" size="0.508" layer="48">121</text>
<text x="7.62" y="-12.065" size="1.27" layer="48" rot="MR0">ASP-134604-01</text>
<text x="26.035" y="-3.175" size="0.508" layer="48">C</text>
<text x="26.035" y="-1.905" size="0.508" layer="48">D</text>
<text x="26.035" y="1.905" size="0.508" layer="48">G</text>
<text x="26.035" y="3.175" size="0.508" layer="48">H</text>
<hole x="27.1653" y="0" drill="1.3208"/>
<hole x="-27.1907" y="3.048" drill="1.3208"/>
</package>
<package name="SMA_JACK_142-0701-201">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="5.08" width="0.127" layer="21"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.127" layer="21"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.127" layer="21"/>
<pad name="CLK" x="0" y="0" drill="1.5748"/>
<pad name="GND$1" x="-2.54" y="2.54" drill="1.7018"/>
<pad name="GND$2" x="2.54" y="2.54" drill="1.7018"/>
<pad name="GND$3" x="-2.54" y="-2.54" drill="1.7018"/>
<pad name="GND$4" x="2.54" y="-2.54" drill="1.7018"/>
<text x="-5.08" y="-7.62" size="0.762" layer="48">SMA JACK 142-0701-201</text>
</package>
</packages>
<symbols>
<symbol name="GND">
<pin name="GND" x="0" y="0" length="middle" direction="pwr"/>
</symbol>
<symbol name="ARRAY_160_PIN">
<pin name="P$1" x="50.8" y="22.86" length="middle" rot="R90"/>
<pin name="P$2" x="48.26" y="22.86" length="middle" rot="R90"/>
<pin name="P$3" x="45.72" y="22.86" length="middle" rot="R90"/>
<pin name="P$4" x="43.18" y="22.86" length="middle" rot="R90"/>
<pin name="P$5" x="40.64" y="22.86" length="middle" rot="R90"/>
<pin name="P$6" x="38.1" y="22.86" length="middle" rot="R90"/>
<pin name="P$7" x="35.56" y="22.86" length="middle" rot="R90"/>
<pin name="P$8" x="33.02" y="22.86" length="middle" rot="R90"/>
<pin name="P$9" x="30.48" y="22.86" length="middle" rot="R90"/>
<pin name="P$10" x="27.94" y="22.86" length="middle" rot="R90"/>
<pin name="P$11" x="25.4" y="22.86" length="middle" rot="R90"/>
<pin name="P$12" x="22.86" y="22.86" length="middle" rot="R90"/>
<pin name="P$13" x="20.32" y="22.86" length="middle" rot="R90"/>
<pin name="P$14" x="17.78" y="22.86" length="middle" rot="R90"/>
<pin name="P$15" x="15.24" y="22.86" length="middle" rot="R90"/>
<pin name="P$16" x="12.7" y="22.86" length="middle" rot="R90"/>
<pin name="P$17" x="10.16" y="22.86" length="middle" rot="R90"/>
<pin name="P$18" x="7.62" y="22.86" length="middle" rot="R90"/>
<pin name="P$19" x="5.08" y="22.86" length="middle" rot="R90"/>
<pin name="P$20" x="2.54" y="22.86" length="middle" rot="R90"/>
<pin name="P$21" x="0" y="22.86" length="middle" rot="R90"/>
<pin name="P$22" x="-2.54" y="22.86" length="middle" rot="R90"/>
<pin name="P$23" x="-5.08" y="22.86" length="middle" rot="R90"/>
<pin name="P$24" x="-7.62" y="22.86" length="middle" rot="R90"/>
<pin name="P$25" x="-10.16" y="22.86" length="middle" rot="R90"/>
<pin name="P$26" x="-12.7" y="22.86" length="middle" rot="R90"/>
<pin name="P$27" x="-15.24" y="22.86" length="middle" rot="R90"/>
<pin name="P$28" x="-17.78" y="22.86" length="middle" rot="R90"/>
<pin name="P$29" x="-20.32" y="22.86" length="middle" rot="R90"/>
<pin name="P$30" x="-22.86" y="22.86" length="middle" rot="R90"/>
<pin name="P$31" x="-25.4" y="22.86" length="middle" rot="R90"/>
<pin name="P$32" x="-27.94" y="22.86" length="middle" rot="R90"/>
<pin name="P$33" x="-30.48" y="22.86" length="middle" rot="R90"/>
<pin name="P$34" x="-33.02" y="22.86" length="middle" rot="R90"/>
<pin name="P$35" x="-35.56" y="22.86" length="middle" rot="R90"/>
<pin name="P$36" x="-38.1" y="22.86" length="middle" rot="R90"/>
<pin name="P$37" x="-40.64" y="22.86" length="middle" rot="R90"/>
<pin name="P$38" x="-43.18" y="22.86" length="middle" rot="R90"/>
<pin name="P$39" x="-45.72" y="22.86" length="middle" rot="R90"/>
<pin name="P$40" x="-48.26" y="22.86" length="middle" rot="R90"/>
<pin name="P$41" x="50.8" y="5.08" length="middle" rot="R90"/>
<pin name="P$42" x="48.26" y="5.08" length="middle" rot="R90"/>
<pin name="P$43" x="45.72" y="5.08" length="middle" rot="R90"/>
<pin name="P$44" x="43.18" y="5.08" length="middle" rot="R90"/>
<pin name="P$45" x="40.64" y="5.08" length="middle" rot="R90"/>
<pin name="P$46" x="38.1" y="5.08" length="middle" rot="R90"/>
<pin name="P$47" x="35.56" y="5.08" length="middle" rot="R90"/>
<pin name="P$48" x="33.02" y="5.08" length="middle" rot="R90"/>
<pin name="P$49" x="30.48" y="5.08" length="middle" rot="R90"/>
<pin name="P$50" x="27.94" y="5.08" length="middle" rot="R90"/>
<pin name="P$51" x="25.4" y="5.08" length="middle" rot="R90"/>
<pin name="P$52" x="22.86" y="5.08" length="middle" rot="R90"/>
<pin name="P$53" x="20.32" y="5.08" length="middle" rot="R90"/>
<pin name="P$54" x="17.78" y="5.08" length="middle" rot="R90"/>
<pin name="P$55" x="15.24" y="5.08" length="middle" rot="R90"/>
<pin name="P$56" x="12.7" y="5.08" length="middle" rot="R90"/>
<pin name="P$57" x="10.16" y="5.08" length="middle" rot="R90"/>
<pin name="P$58" x="7.62" y="5.08" length="middle" rot="R90"/>
<pin name="P$59" x="5.08" y="5.08" length="middle" rot="R90"/>
<pin name="P$60" x="2.54" y="5.08" length="middle" rot="R90"/>
<pin name="P$61" x="0" y="5.08" length="middle" rot="R90"/>
<pin name="P$62" x="-2.54" y="5.08" length="middle" rot="R90"/>
<pin name="P$63" x="-5.08" y="5.08" length="middle" rot="R90"/>
<pin name="P$64" x="-7.62" y="5.08" length="middle" rot="R90"/>
<pin name="P$65" x="-10.16" y="5.08" length="middle" rot="R90"/>
<pin name="P$66" x="-12.7" y="5.08" length="middle" rot="R90"/>
<pin name="P$67" x="-15.24" y="5.08" length="middle" rot="R90"/>
<pin name="P$68" x="-17.78" y="5.08" length="middle" rot="R90"/>
<pin name="P$69" x="-20.32" y="5.08" length="middle" rot="R90"/>
<pin name="P$70" x="-22.86" y="5.08" length="middle" rot="R90"/>
<pin name="P$71" x="-25.4" y="5.08" length="middle" rot="R90"/>
<pin name="P$72" x="-27.94" y="5.08" length="middle" rot="R90"/>
<pin name="P$73" x="-30.48" y="5.08" length="middle" rot="R90"/>
<pin name="P$74" x="-33.02" y="5.08" length="middle" rot="R90"/>
<pin name="P$75" x="-35.56" y="5.08" length="middle" rot="R90"/>
<pin name="P$76" x="-38.1" y="5.08" length="middle" rot="R90"/>
<pin name="P$77" x="-40.64" y="5.08" length="middle" rot="R90"/>
<pin name="P$78" x="-43.18" y="5.08" length="middle" rot="R90"/>
<pin name="P$79" x="-45.72" y="5.08" length="middle" rot="R90"/>
<pin name="P$80" x="-48.26" y="5.08" length="middle" rot="R90"/>
<pin name="P$81" x="50.8" y="-12.7" length="middle" rot="R90"/>
<pin name="P$82" x="48.26" y="-12.7" length="middle" rot="R90"/>
<pin name="P$83" x="45.72" y="-12.7" length="middle" rot="R90"/>
<pin name="P$84" x="43.18" y="-12.7" length="middle" rot="R90"/>
<pin name="P$85" x="40.64" y="-12.7" length="middle" rot="R90"/>
<pin name="P$86" x="38.1" y="-12.7" length="middle" rot="R90"/>
<pin name="P$87" x="35.56" y="-12.7" length="middle" rot="R90"/>
<pin name="P$88" x="33.02" y="-12.7" length="middle" rot="R90"/>
<pin name="P$89" x="30.48" y="-12.7" length="middle" rot="R90"/>
<pin name="P$90" x="27.94" y="-12.7" length="middle" rot="R90"/>
<pin name="P$91" x="25.4" y="-12.7" length="middle" rot="R90"/>
<pin name="P$92" x="22.86" y="-12.7" length="middle" rot="R90"/>
<pin name="P$93" x="20.32" y="-12.7" length="middle" rot="R90"/>
<pin name="P$94" x="17.78" y="-12.7" length="middle" rot="R90"/>
<pin name="P$95" x="15.24" y="-12.7" length="middle" rot="R90"/>
<pin name="P$96" x="12.7" y="-12.7" length="middle" rot="R90"/>
<pin name="P$97" x="10.16" y="-12.7" length="middle" rot="R90"/>
<pin name="P$98" x="7.62" y="-12.7" length="middle" rot="R90"/>
<pin name="P$99" x="5.08" y="-12.7" length="middle" rot="R90"/>
<pin name="P$100" x="2.54" y="-12.7" length="middle" rot="R90"/>
<pin name="P$101" x="0" y="-12.7" length="middle" rot="R90"/>
<pin name="P$102" x="-2.54" y="-12.7" length="middle" rot="R90"/>
<pin name="P$103" x="-5.08" y="-12.7" length="middle" rot="R90"/>
<pin name="P$104" x="-7.62" y="-12.7" length="middle" rot="R90"/>
<pin name="P$105" x="-10.16" y="-12.7" length="middle" rot="R90"/>
<pin name="P$106" x="-12.7" y="-12.7" length="middle" rot="R90"/>
<pin name="P$107" x="-15.24" y="-12.7" length="middle" rot="R90"/>
<pin name="P$108" x="-17.78" y="-12.7" length="middle" rot="R90"/>
<pin name="P$109" x="-20.32" y="-12.7" length="middle" rot="R90"/>
<pin name="P$110" x="-22.86" y="-12.7" length="middle" rot="R90"/>
<pin name="P$111" x="-25.4" y="-12.7" length="middle" rot="R90"/>
<pin name="P$112" x="-27.94" y="-12.7" length="middle" rot="R90"/>
<pin name="P$113" x="-30.48" y="-12.7" length="middle" rot="R90"/>
<pin name="P$114" x="-33.02" y="-12.7" length="middle" rot="R90"/>
<pin name="P$115" x="-35.56" y="-12.7" length="middle" rot="R90"/>
<pin name="P$116" x="-38.1" y="-12.7" length="middle" rot="R90"/>
<pin name="P$117" x="-40.64" y="-12.7" length="middle" rot="R90"/>
<pin name="P$118" x="-43.18" y="-12.7" length="middle" rot="R90"/>
<pin name="P$119" x="-45.72" y="-12.7" length="middle" rot="R90"/>
<pin name="P$120" x="-48.26" y="-12.7" length="middle" rot="R90"/>
<pin name="P$121" x="50.8" y="-30.48" length="middle" rot="R90"/>
<pin name="P$122" x="48.26" y="-30.48" length="middle" rot="R90"/>
<pin name="P$123" x="45.72" y="-30.48" length="middle" rot="R90"/>
<pin name="P$124" x="43.18" y="-30.48" length="middle" rot="R90"/>
<pin name="P$125" x="40.64" y="-30.48" length="middle" rot="R90"/>
<pin name="P$126" x="38.1" y="-30.48" length="middle" rot="R90"/>
<pin name="P$127" x="35.56" y="-30.48" length="middle" rot="R90"/>
<pin name="P$128" x="33.02" y="-30.48" length="middle" rot="R90"/>
<pin name="P$129" x="30.48" y="-30.48" length="middle" rot="R90"/>
<pin name="P$130" x="27.94" y="-30.48" length="middle" rot="R90"/>
<pin name="P$131" x="25.4" y="-30.48" length="middle" rot="R90"/>
<pin name="P$132" x="22.86" y="-30.48" length="middle" rot="R90"/>
<pin name="P$133" x="20.32" y="-30.48" length="middle" rot="R90"/>
<pin name="P$134" x="17.78" y="-30.48" length="middle" rot="R90"/>
<pin name="P$135" x="15.24" y="-30.48" length="middle" rot="R90"/>
<pin name="P$136" x="12.7" y="-30.48" length="middle" rot="R90"/>
<pin name="P$137" x="10.16" y="-30.48" length="middle" rot="R90"/>
<pin name="P$138" x="7.62" y="-30.48" length="middle" rot="R90"/>
<pin name="P$139" x="5.08" y="-30.48" length="middle" rot="R90"/>
<pin name="P$140" x="2.54" y="-30.48" length="middle" rot="R90"/>
<pin name="P$141" x="0" y="-30.48" length="middle" rot="R90"/>
<pin name="P$142" x="-2.54" y="-30.48" length="middle" rot="R90"/>
<pin name="P$143" x="-5.08" y="-30.48" length="middle" rot="R90"/>
<pin name="P$144" x="-7.62" y="-30.48" length="middle" rot="R90"/>
<pin name="P$145" x="-10.16" y="-30.48" length="middle" rot="R90"/>
<pin name="P$146" x="-12.7" y="-30.48" length="middle" rot="R90"/>
<pin name="P$147" x="-15.24" y="-30.48" length="middle" rot="R90"/>
<pin name="P$148" x="-17.78" y="-30.48" length="middle" rot="R90"/>
<pin name="P$149" x="-20.32" y="-30.48" length="middle" rot="R90"/>
<pin name="P$150" x="-22.86" y="-30.48" length="middle" rot="R90"/>
<pin name="P$151" x="-25.4" y="-30.48" length="middle" rot="R90"/>
<pin name="P$152" x="-27.94" y="-30.48" length="middle" rot="R90"/>
<pin name="P$153" x="-30.48" y="-30.48" length="middle" rot="R90"/>
<pin name="P$154" x="-33.02" y="-30.48" length="middle" rot="R90"/>
<pin name="P$155" x="-35.56" y="-30.48" length="middle" rot="R90"/>
<pin name="P$156" x="-38.1" y="-30.48" length="middle" rot="R90"/>
<pin name="P$157" x="-40.64" y="-30.48" length="middle" rot="R90"/>
<pin name="P$158" x="-43.18" y="-30.48" length="middle" rot="R90"/>
<pin name="P$159" x="-45.72" y="-30.48" length="middle" rot="R90"/>
<pin name="P$160" x="-48.26" y="-30.48" length="middle" rot="R90"/>
</symbol>
<symbol name="SMA_JACK">
<pin name="CLK" x="-33.02" y="17.78" length="point"/>
<pin name="GND$1" x="-33.02" y="12.7" length="point"/>
<pin name="GND$2" x="-33.02" y="10.16" length="point"/>
<pin name="GND$3" x="-33.02" y="7.62" length="point"/>
<pin name="GND$4" x="-33.02" y="5.08" length="point"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FMC_LPC_160_PIN">
<gates>
<gate name="G$1" symbol="ARRAY_160_PIN" x="-2.54" y="7.62"/>
<gate name="GND$1" symbol="GND" x="-48.26" y="-35.56"/>
<gate name="GND$2" symbol="GND" x="-48.26" y="-40.64"/>
</gates>
<devices>
<device name="FMC-LPC-FEMALE-SILK" package="FMC_LPC_FEMALE_WITH_SP601_SILK">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$10" pad="P$10"/>
<connect gate="G$1" pin="P$100" pad="P$100"/>
<connect gate="G$1" pin="P$101" pad="P$101"/>
<connect gate="G$1" pin="P$102" pad="P$102"/>
<connect gate="G$1" pin="P$103" pad="P$103"/>
<connect gate="G$1" pin="P$104" pad="P$104"/>
<connect gate="G$1" pin="P$105" pad="P$105"/>
<connect gate="G$1" pin="P$106" pad="P$106"/>
<connect gate="G$1" pin="P$107" pad="P$107"/>
<connect gate="G$1" pin="P$108" pad="P$108"/>
<connect gate="G$1" pin="P$109" pad="P$109"/>
<connect gate="G$1" pin="P$11" pad="P$11"/>
<connect gate="G$1" pin="P$110" pad="P$110"/>
<connect gate="G$1" pin="P$111" pad="P$111"/>
<connect gate="G$1" pin="P$112" pad="P$112"/>
<connect gate="G$1" pin="P$113" pad="P$113"/>
<connect gate="G$1" pin="P$114" pad="P$114"/>
<connect gate="G$1" pin="P$115" pad="P$115"/>
<connect gate="G$1" pin="P$116" pad="P$116"/>
<connect gate="G$1" pin="P$117" pad="P$117"/>
<connect gate="G$1" pin="P$118" pad="P$118"/>
<connect gate="G$1" pin="P$119" pad="P$119"/>
<connect gate="G$1" pin="P$12" pad="P$12"/>
<connect gate="G$1" pin="P$120" pad="P$120"/>
<connect gate="G$1" pin="P$121" pad="P$121"/>
<connect gate="G$1" pin="P$122" pad="P$122"/>
<connect gate="G$1" pin="P$123" pad="P$123"/>
<connect gate="G$1" pin="P$124" pad="P$124"/>
<connect gate="G$1" pin="P$125" pad="P$125"/>
<connect gate="G$1" pin="P$126" pad="P$126"/>
<connect gate="G$1" pin="P$127" pad="P$127"/>
<connect gate="G$1" pin="P$128" pad="P$128"/>
<connect gate="G$1" pin="P$129" pad="P$129"/>
<connect gate="G$1" pin="P$13" pad="P$13"/>
<connect gate="G$1" pin="P$130" pad="P$130"/>
<connect gate="G$1" pin="P$131" pad="P$131"/>
<connect gate="G$1" pin="P$132" pad="P$132"/>
<connect gate="G$1" pin="P$133" pad="P$133"/>
<connect gate="G$1" pin="P$134" pad="P$134"/>
<connect gate="G$1" pin="P$135" pad="P$135"/>
<connect gate="G$1" pin="P$136" pad="P$136"/>
<connect gate="G$1" pin="P$137" pad="P$137"/>
<connect gate="G$1" pin="P$138" pad="P$138"/>
<connect gate="G$1" pin="P$139" pad="P$139"/>
<connect gate="G$1" pin="P$14" pad="P$14"/>
<connect gate="G$1" pin="P$140" pad="P$140"/>
<connect gate="G$1" pin="P$141" pad="P$141"/>
<connect gate="G$1" pin="P$142" pad="P$142"/>
<connect gate="G$1" pin="P$143" pad="P$143"/>
<connect gate="G$1" pin="P$144" pad="P$144"/>
<connect gate="G$1" pin="P$145" pad="P$145"/>
<connect gate="G$1" pin="P$146" pad="P$146"/>
<connect gate="G$1" pin="P$147" pad="P$147"/>
<connect gate="G$1" pin="P$148" pad="P$148"/>
<connect gate="G$1" pin="P$149" pad="P$149"/>
<connect gate="G$1" pin="P$15" pad="P$15"/>
<connect gate="G$1" pin="P$150" pad="P$150"/>
<connect gate="G$1" pin="P$151" pad="P$151"/>
<connect gate="G$1" pin="P$152" pad="P$152"/>
<connect gate="G$1" pin="P$153" pad="P$153"/>
<connect gate="G$1" pin="P$154" pad="P$154"/>
<connect gate="G$1" pin="P$155" pad="P$155"/>
<connect gate="G$1" pin="P$156" pad="P$156"/>
<connect gate="G$1" pin="P$157" pad="P$157"/>
<connect gate="G$1" pin="P$158" pad="P$158"/>
<connect gate="G$1" pin="P$159" pad="P$159"/>
<connect gate="G$1" pin="P$16" pad="P$16"/>
<connect gate="G$1" pin="P$160" pad="P$160"/>
<connect gate="G$1" pin="P$17" pad="P$17"/>
<connect gate="G$1" pin="P$18" pad="P$18"/>
<connect gate="G$1" pin="P$19" pad="P$19"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$20" pad="P$20"/>
<connect gate="G$1" pin="P$21" pad="P$21"/>
<connect gate="G$1" pin="P$22" pad="P$22"/>
<connect gate="G$1" pin="P$23" pad="P$23"/>
<connect gate="G$1" pin="P$24" pad="P$24"/>
<connect gate="G$1" pin="P$25" pad="P$25"/>
<connect gate="G$1" pin="P$26" pad="P$26"/>
<connect gate="G$1" pin="P$27" pad="P$27"/>
<connect gate="G$1" pin="P$28" pad="P$28"/>
<connect gate="G$1" pin="P$29" pad="P$29"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$30" pad="P$30"/>
<connect gate="G$1" pin="P$31" pad="P$31"/>
<connect gate="G$1" pin="P$32" pad="P$32"/>
<connect gate="G$1" pin="P$33" pad="P$33"/>
<connect gate="G$1" pin="P$34" pad="P$34"/>
<connect gate="G$1" pin="P$35" pad="P$35"/>
<connect gate="G$1" pin="P$36" pad="P$36"/>
<connect gate="G$1" pin="P$37" pad="P$37"/>
<connect gate="G$1" pin="P$38" pad="P$38"/>
<connect gate="G$1" pin="P$39" pad="P$39"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$40" pad="P$40"/>
<connect gate="G$1" pin="P$41" pad="P$41"/>
<connect gate="G$1" pin="P$42" pad="P$42"/>
<connect gate="G$1" pin="P$43" pad="P$43"/>
<connect gate="G$1" pin="P$44" pad="P$44"/>
<connect gate="G$1" pin="P$45" pad="P$45"/>
<connect gate="G$1" pin="P$46" pad="P$46"/>
<connect gate="G$1" pin="P$47" pad="P$47"/>
<connect gate="G$1" pin="P$48" pad="P$48"/>
<connect gate="G$1" pin="P$49" pad="P$49"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
<connect gate="G$1" pin="P$50" pad="P$50"/>
<connect gate="G$1" pin="P$51" pad="P$51"/>
<connect gate="G$1" pin="P$52" pad="P$52"/>
<connect gate="G$1" pin="P$53" pad="P$53"/>
<connect gate="G$1" pin="P$54" pad="P$54"/>
<connect gate="G$1" pin="P$55" pad="P$55"/>
<connect gate="G$1" pin="P$56" pad="P$56"/>
<connect gate="G$1" pin="P$57" pad="P$57"/>
<connect gate="G$1" pin="P$58" pad="P$58"/>
<connect gate="G$1" pin="P$59" pad="P$59"/>
<connect gate="G$1" pin="P$6" pad="P$6"/>
<connect gate="G$1" pin="P$60" pad="P$60"/>
<connect gate="G$1" pin="P$61" pad="P$61"/>
<connect gate="G$1" pin="P$62" pad="P$62"/>
<connect gate="G$1" pin="P$63" pad="P$63"/>
<connect gate="G$1" pin="P$64" pad="P$64"/>
<connect gate="G$1" pin="P$65" pad="P$65"/>
<connect gate="G$1" pin="P$66" pad="P$66"/>
<connect gate="G$1" pin="P$67" pad="P$67"/>
<connect gate="G$1" pin="P$68" pad="P$68"/>
<connect gate="G$1" pin="P$69" pad="P$69"/>
<connect gate="G$1" pin="P$7" pad="P$7"/>
<connect gate="G$1" pin="P$70" pad="P$70"/>
<connect gate="G$1" pin="P$71" pad="P$71"/>
<connect gate="G$1" pin="P$72" pad="P$72"/>
<connect gate="G$1" pin="P$73" pad="P$73"/>
<connect gate="G$1" pin="P$74" pad="P$74"/>
<connect gate="G$1" pin="P$75" pad="P$75"/>
<connect gate="G$1" pin="P$76" pad="P$76"/>
<connect gate="G$1" pin="P$77" pad="P$77"/>
<connect gate="G$1" pin="P$78" pad="P$78"/>
<connect gate="G$1" pin="P$79" pad="P$79"/>
<connect gate="G$1" pin="P$8" pad="P$8"/>
<connect gate="G$1" pin="P$80" pad="P$80"/>
<connect gate="G$1" pin="P$81" pad="P$81"/>
<connect gate="G$1" pin="P$82" pad="P$82"/>
<connect gate="G$1" pin="P$83" pad="P$83"/>
<connect gate="G$1" pin="P$84" pad="P$84"/>
<connect gate="G$1" pin="P$85" pad="P$85"/>
<connect gate="G$1" pin="P$86" pad="P$86"/>
<connect gate="G$1" pin="P$87" pad="P$87"/>
<connect gate="G$1" pin="P$88" pad="P$88"/>
<connect gate="G$1" pin="P$89" pad="P$89"/>
<connect gate="G$1" pin="P$9" pad="P$9"/>
<connect gate="G$1" pin="P$90" pad="P$90"/>
<connect gate="G$1" pin="P$91" pad="P$91"/>
<connect gate="G$1" pin="P$92" pad="P$92"/>
<connect gate="G$1" pin="P$93" pad="P$93"/>
<connect gate="G$1" pin="P$94" pad="P$94"/>
<connect gate="G$1" pin="P$95" pad="P$95"/>
<connect gate="G$1" pin="P$96" pad="P$96"/>
<connect gate="G$1" pin="P$97" pad="P$97"/>
<connect gate="G$1" pin="P$98" pad="P$98"/>
<connect gate="G$1" pin="P$99" pad="P$99"/>
<connect gate="GND$1" pin="GND" pad="GNDA"/>
<connect gate="GND$2" pin="GND" pad="GNDB"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="FMC_LPC_MALE_WITH_SP601_BSILK">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$10" pad="P$10"/>
<connect gate="G$1" pin="P$100" pad="P$100"/>
<connect gate="G$1" pin="P$101" pad="P$101"/>
<connect gate="G$1" pin="P$102" pad="P$102"/>
<connect gate="G$1" pin="P$103" pad="P$103"/>
<connect gate="G$1" pin="P$104" pad="P$104"/>
<connect gate="G$1" pin="P$105" pad="P$105"/>
<connect gate="G$1" pin="P$106" pad="P$106"/>
<connect gate="G$1" pin="P$107" pad="P$107"/>
<connect gate="G$1" pin="P$108" pad="P$108"/>
<connect gate="G$1" pin="P$109" pad="P$109"/>
<connect gate="G$1" pin="P$11" pad="P$11"/>
<connect gate="G$1" pin="P$110" pad="P$110"/>
<connect gate="G$1" pin="P$111" pad="P$111"/>
<connect gate="G$1" pin="P$112" pad="P$112"/>
<connect gate="G$1" pin="P$113" pad="P$113"/>
<connect gate="G$1" pin="P$114" pad="P$114"/>
<connect gate="G$1" pin="P$115" pad="P$115"/>
<connect gate="G$1" pin="P$116" pad="P$116"/>
<connect gate="G$1" pin="P$117" pad="P$117"/>
<connect gate="G$1" pin="P$118" pad="P$118"/>
<connect gate="G$1" pin="P$119" pad="P$119"/>
<connect gate="G$1" pin="P$12" pad="P$12"/>
<connect gate="G$1" pin="P$120" pad="P$120"/>
<connect gate="G$1" pin="P$121" pad="P$121"/>
<connect gate="G$1" pin="P$122" pad="P$122"/>
<connect gate="G$1" pin="P$123" pad="P$123"/>
<connect gate="G$1" pin="P$124" pad="P$124"/>
<connect gate="G$1" pin="P$125" pad="P$125"/>
<connect gate="G$1" pin="P$126" pad="P$126"/>
<connect gate="G$1" pin="P$127" pad="P$127"/>
<connect gate="G$1" pin="P$128" pad="P$128"/>
<connect gate="G$1" pin="P$129" pad="P$129"/>
<connect gate="G$1" pin="P$13" pad="P$13"/>
<connect gate="G$1" pin="P$130" pad="P$130"/>
<connect gate="G$1" pin="P$131" pad="P$131"/>
<connect gate="G$1" pin="P$132" pad="P$132"/>
<connect gate="G$1" pin="P$133" pad="P$133"/>
<connect gate="G$1" pin="P$134" pad="P$134"/>
<connect gate="G$1" pin="P$135" pad="P$135"/>
<connect gate="G$1" pin="P$136" pad="P$136"/>
<connect gate="G$1" pin="P$137" pad="P$137"/>
<connect gate="G$1" pin="P$138" pad="P$138"/>
<connect gate="G$1" pin="P$139" pad="P$139"/>
<connect gate="G$1" pin="P$14" pad="P$14"/>
<connect gate="G$1" pin="P$140" pad="P$140"/>
<connect gate="G$1" pin="P$141" pad="P$141"/>
<connect gate="G$1" pin="P$142" pad="P$142"/>
<connect gate="G$1" pin="P$143" pad="P$143"/>
<connect gate="G$1" pin="P$144" pad="P$144"/>
<connect gate="G$1" pin="P$145" pad="P$145"/>
<connect gate="G$1" pin="P$146" pad="P$146"/>
<connect gate="G$1" pin="P$147" pad="P$147"/>
<connect gate="G$1" pin="P$148" pad="P$148"/>
<connect gate="G$1" pin="P$149" pad="P$149"/>
<connect gate="G$1" pin="P$15" pad="P$15"/>
<connect gate="G$1" pin="P$150" pad="P$150"/>
<connect gate="G$1" pin="P$151" pad="P$151"/>
<connect gate="G$1" pin="P$152" pad="P$152"/>
<connect gate="G$1" pin="P$153" pad="P$153"/>
<connect gate="G$1" pin="P$154" pad="P$154"/>
<connect gate="G$1" pin="P$155" pad="P$155"/>
<connect gate="G$1" pin="P$156" pad="P$156"/>
<connect gate="G$1" pin="P$157" pad="P$157"/>
<connect gate="G$1" pin="P$158" pad="P$158"/>
<connect gate="G$1" pin="P$159" pad="P$159"/>
<connect gate="G$1" pin="P$16" pad="P$16"/>
<connect gate="G$1" pin="P$160" pad="P$160"/>
<connect gate="G$1" pin="P$17" pad="P$17"/>
<connect gate="G$1" pin="P$18" pad="P$18"/>
<connect gate="G$1" pin="P$19" pad="P$19"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$20" pad="P$20"/>
<connect gate="G$1" pin="P$21" pad="P$21"/>
<connect gate="G$1" pin="P$22" pad="P$22"/>
<connect gate="G$1" pin="P$23" pad="P$23"/>
<connect gate="G$1" pin="P$24" pad="P$24"/>
<connect gate="G$1" pin="P$25" pad="P$25"/>
<connect gate="G$1" pin="P$26" pad="P$26"/>
<connect gate="G$1" pin="P$27" pad="P$27"/>
<connect gate="G$1" pin="P$28" pad="P$28"/>
<connect gate="G$1" pin="P$29" pad="P$29"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$30" pad="P$30"/>
<connect gate="G$1" pin="P$31" pad="P$31"/>
<connect gate="G$1" pin="P$32" pad="P$32"/>
<connect gate="G$1" pin="P$33" pad="P$33"/>
<connect gate="G$1" pin="P$34" pad="P$34"/>
<connect gate="G$1" pin="P$35" pad="P$35"/>
<connect gate="G$1" pin="P$36" pad="P$36"/>
<connect gate="G$1" pin="P$37" pad="P$37"/>
<connect gate="G$1" pin="P$38" pad="P$38"/>
<connect gate="G$1" pin="P$39" pad="P$39"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$40" pad="P$40"/>
<connect gate="G$1" pin="P$41" pad="P$41"/>
<connect gate="G$1" pin="P$42" pad="P$42"/>
<connect gate="G$1" pin="P$43" pad="P$43"/>
<connect gate="G$1" pin="P$44" pad="P$44"/>
<connect gate="G$1" pin="P$45" pad="P$45"/>
<connect gate="G$1" pin="P$46" pad="P$46"/>
<connect gate="G$1" pin="P$47" pad="P$47"/>
<connect gate="G$1" pin="P$48" pad="P$48"/>
<connect gate="G$1" pin="P$49" pad="P$49"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
<connect gate="G$1" pin="P$50" pad="P$50"/>
<connect gate="G$1" pin="P$51" pad="P$51"/>
<connect gate="G$1" pin="P$52" pad="P$52"/>
<connect gate="G$1" pin="P$53" pad="P$53"/>
<connect gate="G$1" pin="P$54" pad="P$54"/>
<connect gate="G$1" pin="P$55" pad="P$55"/>
<connect gate="G$1" pin="P$56" pad="P$56"/>
<connect gate="G$1" pin="P$57" pad="P$57"/>
<connect gate="G$1" pin="P$58" pad="P$58"/>
<connect gate="G$1" pin="P$59" pad="P$59"/>
<connect gate="G$1" pin="P$6" pad="P$6"/>
<connect gate="G$1" pin="P$60" pad="P$60"/>
<connect gate="G$1" pin="P$61" pad="P$61"/>
<connect gate="G$1" pin="P$62" pad="P$62"/>
<connect gate="G$1" pin="P$63" pad="P$63"/>
<connect gate="G$1" pin="P$64" pad="P$64"/>
<connect gate="G$1" pin="P$65" pad="P$65"/>
<connect gate="G$1" pin="P$66" pad="P$66"/>
<connect gate="G$1" pin="P$67" pad="P$67"/>
<connect gate="G$1" pin="P$68" pad="P$68"/>
<connect gate="G$1" pin="P$69" pad="P$69"/>
<connect gate="G$1" pin="P$7" pad="P$7"/>
<connect gate="G$1" pin="P$70" pad="P$70"/>
<connect gate="G$1" pin="P$71" pad="P$71"/>
<connect gate="G$1" pin="P$72" pad="P$72"/>
<connect gate="G$1" pin="P$73" pad="P$73"/>
<connect gate="G$1" pin="P$74" pad="P$74"/>
<connect gate="G$1" pin="P$75" pad="P$75"/>
<connect gate="G$1" pin="P$76" pad="P$76"/>
<connect gate="G$1" pin="P$77" pad="P$77"/>
<connect gate="G$1" pin="P$78" pad="P$78"/>
<connect gate="G$1" pin="P$79" pad="P$79"/>
<connect gate="G$1" pin="P$8" pad="P$8"/>
<connect gate="G$1" pin="P$80" pad="P$80"/>
<connect gate="G$1" pin="P$81" pad="P$81"/>
<connect gate="G$1" pin="P$82" pad="P$82"/>
<connect gate="G$1" pin="P$83" pad="P$83"/>
<connect gate="G$1" pin="P$84" pad="P$84"/>
<connect gate="G$1" pin="P$85" pad="P$85"/>
<connect gate="G$1" pin="P$86" pad="P$86"/>
<connect gate="G$1" pin="P$87" pad="P$87"/>
<connect gate="G$1" pin="P$88" pad="P$88"/>
<connect gate="G$1" pin="P$89" pad="P$89"/>
<connect gate="G$1" pin="P$9" pad="P$9"/>
<connect gate="G$1" pin="P$90" pad="P$90"/>
<connect gate="G$1" pin="P$91" pad="P$91"/>
<connect gate="G$1" pin="P$92" pad="P$92"/>
<connect gate="G$1" pin="P$93" pad="P$93"/>
<connect gate="G$1" pin="P$94" pad="P$94"/>
<connect gate="G$1" pin="P$95" pad="P$95"/>
<connect gate="G$1" pin="P$96" pad="P$96"/>
<connect gate="G$1" pin="P$97" pad="P$97"/>
<connect gate="G$1" pin="P$98" pad="P$98"/>
<connect gate="G$1" pin="P$99" pad="P$99"/>
<connect gate="GND$1" pin="GND" pad="GNDA"/>
<connect gate="GND$2" pin="GND" pad="GNDB"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SMA_JACK_142-0701-201_DEV">
<gates>
<gate name="G$1" symbol="SMA_JACK" x="33.02" y="-10.16"/>
</gates>
<devices>
<device name="" package="SMA_JACK_142-0701-201">
<connects>
<connect gate="G$1" pin="CLK" pad="CLK"/>
<connect gate="G$1" pin="GND$1" pad="GND$1"/>
<connect gate="G$1" pin="GND$2" pad="GND$2"/>
<connect gate="G$1" pin="GND$3" pad="GND$3"/>
<connect gate="G$1" pin="GND$4" pad="GND$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$4" library="SA_BB" deviceset="FMC_LPC_160_PIN" device=""/>
<part name="U$2" library="SA_BB" deviceset="SMA_JACK_142-0701-201_DEV" device=""/>
<part name="U$5" library="SA_BB" deviceset="SMA_JACK_142-0701-201_DEV" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="203.2" y="96.52" size="1.778" layer="97">H</text>
<text x="203.2" y="78.74" size="1.778" layer="97">G</text>
<text x="203.2" y="60.96" size="1.778" layer="97">D</text>
<text x="203.2" y="43.18" size="1.778" layer="97">C</text>
</plain>
<instances>
<instance part="U$4" gate="G$1" x="147.32" y="73.66"/>
<instance part="U$2" gate="G$1" x="248.92" y="99.06"/>
<instance part="U$5" gate="G$1" x="264.16" y="111.76"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$92" class="0">
<segment>
<wire x1="243.84" y1="-72.39" x2="243.84" y2="-73.66" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
