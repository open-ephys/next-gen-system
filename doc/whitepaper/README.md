# Open Instruments Whitepaper

This whitepaper outlines an instrumentation system for neuroscience (and other fields) that makes full use of existing technologies and industry standards (PCIe and FMC connectors) to deliver the highest possible performance and modularity. The system can be used as a platform for any existing and future data sources, reducing development overhead, without imposing any performance or usability drawbacks. This also result in extendability to future interface technology generations without the need for device specific re-engineering.

![Example hardware configuration of a Open Instruments system with three connected data source 'breakout boards'. In addition to the DIO board that provides direct electrical connections between the FPGA and the breakout boards, a 3rd party FMC board is shown, connected directly to the FPGA trhough the seconds FMC connector.](imgs/system_overview.png)

We have built a prototype of the system that delivers full use of the PCIe bus (12Gbps throughput currently, up to 100Gbps with other FPGA boards) for >10.000 channels sampled at 30kHz, and low latency of  <100μs round trip to and from the host PC, so that high level languages and libraries can be used for closed-loop experiments. The same system could also be used for dynamic clamp applications using a real-time OS, adding <10μs closed loop capability to existing and novel amplifier systems.

The open instruments standard does not specify or constrain the design of either the data sources, nor the software used for data acquisition, but specifies a flexible interconnect between the two. 

To implement a system based on a new type of data source, only two or three components need to be designed: 

(__1__) A hardware interface that connects to the data source and to FPGA pins on the open instruments board directly through a standardized high-speed digital interconnect via generic VHDCI connectors and via the ubiquitous FMC connectors and an intermediate DIO board as mechanical interconnect.

(__2__) A firmware module for the FPGA that drives the hardware (via any interface standard directly trough FPGA pins), but does not need to be able to interface with the host PC, or be developed with specific drivers in mind.

(__3__, optional) Data-source specific software that communicates with the hardware through the open instruments API which provides a generic interface to the hardware via data transfers and device registers, and can be used with no knowledge of the underlying interconnect (PCIe, USB, or Ethernet).

 By removing and standardizing the intermediate components of hardware-software interfaces, the development effort required for this is vastly reduced, and different data sources can be operated together in one system.








