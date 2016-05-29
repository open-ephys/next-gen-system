# Open Instruments Whitepaper

This whitepaper outlines an instrumentation system for neuroscience (and other fields) that makes full use of existing technologies and industry standards to deliver the highest possible performance and modularity. The system can be used as a platform for any existing and future probe technology, reducing development overhead, without inposing any performance or usability drawbacks. This also result in extendability to future technology generations without the need for device specific re-engineering.

![Example hardware configuration of a Open Instruments system with three connected breakout boards. In addition to the DIO board that provides passive electrical connections between the FPGA and the breakout boards, a 3rd party FMC board is shown, connected to the FPGA trhough the seconds FMC connector.](imgs/system_overview.png)

We have already built a prototype system based on these specifications that delivers full use of the PCIe bus (12Gbps troughput currently, up to 100Gbps with other FPGA boards) for >10.000 channels sampled at 30kHz, and low latency of  <100μs round trip to and from host PC, so that high level languages and libraries can be used for closed-loop experiments. The same system could also be used for dynamic clamp applications using a real-time OS, delivering <10μs loop capability. 

The open instruments standard does not specify or constrain the design of either the data sources, nor the software used for data acquisition, but specifies a flexible interconnect between the two. 

To implement a system based on new type of probe, only two or three components need to be designed: 

(__1__) A hardware interface that connects directly to FPGA pins trough a standardized high-speed digital interconnect via generic 68-pin VHDCI connectors and cables that are connected to the FPGA boards via the ubiquitous FMC connectors and an intermediate DIO board as mechanical interconnect.

(__2__) A firmware module for the FPGA that drives this hardware, but does not need to be able to communicate with the host PC, or be developed with drivers in mind.

(__3__, optional) A software that communicates with this hardware through the open instruments AI that provides a generic interface to the hardware via data transfers and device registers, and can be used with no knowledge of the underlying interconnect (PCIe, USB, Ethernet).

 By removing and standardizing the intermediate components of hardware-software interfaces, the development effort required for this is vastly reduced, and different data sources can be operated together in one system.








