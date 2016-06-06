# Open Instruments Specification

This specification defines interfaces for  instrumentation systems for
neuroscience (and other fields) that makes full use of existing technologies and
industry standards to deliver the highest possible performance levels and
modular design. The system can be used as a platform for existing and future
data sources, reducing development overhead, while providing increases in system
performance performance and interoperability. This will also result in
extendability to future interface technology generations without the need for
device specific re-engineering.

For a brief overview, see the whitepaper at https://github.com/open-ephys/next-gen-system/tree/master/doc/whitepaper_extended

## Overview

A Open Instruments compatible system consists of one or more data sources or
effectors that interact with  software on a PC via a series of standardized
interfaces. The Open Instruments standard does not specify or constrain the
design of either the data sources, nor the software used for data acquisition,
but specifies a flexible interconnect between the two.


![Example hardware configuration of a Open Instruments system with threesd
connected breakout boards. In addition to the DIO board that provides the
electrical connections between the FPGA and the breakout boards, a 3rd party FMC
board is shown, connected to the FPGA through the second FMC
connector.](doc/whitepaper_extended/imgs/system_overview.png)

_Example hardware configuration of a Open Instruments system with three
connected breakout boards. In addition to the DIO board that provides the
electrical connections between the FPGA and the breakout boards, a 3rd party FMC
board is shown, connected to the FPGA through the second FMC connector._

Examples of hardware modules / daughter devices  are:

  - A simple Analog/Digital front-end with ADCs DACs and line receivers and
drivers for digital input/output. This would also be the only piece of hardware
needed to use the system in a dynamic clamp whole-cell experiment. 

- An interface to Intan headstages.   

- A digital interface connecting to high density CMOS probes.


To implement a system based on new type of probe, only two or three components
need to be designed:

  1. A hardware interface that connects directly to FPGA pins trough a
  standardized high-speed digital interconnect via generic 68-pin VHDCI
  connectors and cables that are connected to the FPGA boards via the ubiquitous
  FMC connectors and an intermediate DIO board as mechanical interconnect. 

  1. A firmware module for the FPGA that drives this hardware, but does notneed to be
  able to communicate with the host PC, or be developed withdrivers in mind. 

  1.(Optional) A software that communicates with this hardware through theopen
  instruments AI that provides a generic interface to the hardware viadata
  transfers and device registers, and can be used with no knowledge ofthe
  underlying interconnect (PCIe, USB, Ethernet).

By removing and standardizing the intermediate components of hardware-software
interfaces, the development effort required for this is vastly reduced, and
different data sources can be operated together in one system.


![Overview of the components and interfaces of the system. Only the interconnect
infrastructure between the data source and the software are defined by the open
instruments
standard.](doc/whitepaper_extended/imgs/hardware_architecture_sketch.png)

_Overview of the components and interfaces of the system. Only the interconnect
infrastructure between the data source and the software are defined by the open
instruments standard._



#### Definitions

Daughter device - Physical device that acts as a data source, or effector.

Port - A VHDCI connector that connects a daughter device to the DIO board.

DIO board - A PCI format card that provides an electrical interconnect between
the FPGA and the duaghter devices.

FPGA board - A PCIe board that hosts the FPGA, as well as FMC connectors.

FMC connector - A high pin count standardized connector for attaching devices to
FPGAs specified in the Vita 57 standard.

IP core - A piece of firmware code that can be loaded to the FPGA.

API - a set of functions cthat can be used by otehr software to communicate to
daughter devices via the FPGA.



## Daughter device - FPGA interface

Daughter devices connect to the FPGa that either controls the daughter device,
or sinpy provides an interface to the host PC by a flexible interface that does
not constrain what devices can be used, but ensures future interoperability.

### Physical and signal type specification

Daughter devices connect to the FPGA via a very simple DIO card that directly
connects pins on the FPGA to connnectors on the back of the host PC via a FMC
connector on the FPGA carrier board.

The main role of this card is to provide direct electrical access to the pins of
the FPGA. The FPGA pins on the FMC connector are broken out into 4 VHDCI
connectors.

See https://docs.google.com/spreadsheets/d/18WfmbLGt8bGUUdksKp6AKA_wMX2SJ3Tndin- nnEgUCs/edit?usp=sharing 
for the full pin assignment.

Most pins on the cable are connected directly to the FPGA, arranged in the
following manner

  - 21 LVDS pairs that can be used in any way (including as 42 non-LVDS signals,
depending on the device-specific firmware).    

- 2 pins are dedicated to an I2C
bus to obtain daughter board IO IDs and     metadata,   

- 4 undefined pins for
that can be used in any way   

- 20 Power supply pins (12 ground pins, 4 +5V
pins, and 4 +12V pins) ground     and VCC.

VHDCI cables are very widely available in low cost or very high quality
variants, and are very robust and rated for many cycles.

### Protocol layer

The Open Instruments standard does not enforce any protocol - a daughter device
can communicate with the FPGA via the signal lines on the VHDCI connector
defined in the physical layer in any way. This inlcudes the use of LVDS pins for
single ended signals.

The only specification, apart from the pin out, is the presence of an i2c EEPROM
(either as IC or emulated on a microcontroller or FPGA) on the daughter device
that identifies the device to the FPGA and determines what IP cores are
conencted to the device's port. This identifier is also available to software
via the API.

#### Canconical SPI protocol

If desired, a daughter device can chose to adhere to a simple standardized
protocol to stream data to and from the system via the VHDCI connector. To do
this, the device simply needs to identify (via the eeprom) as a 'canonical SPI
device'.

In this case, the canonical SPI IP core is connected to a subset of pins on the
VHDCI port.


2do: define this more.


## FPGA - host interface 

The Open Instruments standard encapsulates the FPGA -
host interface so that neither hardware, firmware or software need to be
modified significantly in order to switch between interfaces.


![Overview of latencies across hardware interfaces. Histograms reflect measured
latencies, bar plots reflect estimates.](doc/whitepaper_extended/imgs/latencies_log_scale.png)

_Overview of latencies across hardware interfaces. Histograms reflect measured
latencies, bar plots reflect estimates._


### Ethernet 

Ethernet interfaces combine low latency of ~1-5ms with high
troughput of around 10Gbps on common ethernet cards, which is sufficient for
almost all current applications.

The kc705 FPGA board includes a 10gig Ethernet connector, so implementing the
interconnect via ethernet will just require an appropriate IP core.

### PCIe

[PCIe](https://en.wikipedia.org/wiki/PCI_Express), which is used as the
basic for almost all other interfaces can currently achieve throughputs of
around ~100 Gbs, which far exceeds the bandwidth required for any current or
mid-term electrophysiology applications, but could be useful eventually. The
most common type of FPGA evaluation board that is recommended for open
einstruments systems, the Xilinx Kintex kc705 achieves around 12Gbps, which is
sufficient for almost all current applications.

PCIe can achieve far shorter closed-loop delays than any other mainstream
interface for commodity PCs. PCIe can achieve < 100 μs closed-loop latencies on
common operating systems, and around 1 μs on real-time operating systems (for
example, in the RTXI project).



## IP core /firmware module interfaces

The open instruments standard does not specify the firmware / IP cores used to
interact with specific data sources. It does however provide a standardized
interface to a piece of firmware / IP core on the FPGA that provides a flexible,
bidirectional interconnect to the software. This minimizes development efforts
for new data sources by eliminating the redundant task of driver and API
development.

### Wishbone bus

Individual IP cores on the FPGA communicate via a standardized interconnect based on the wishbone specification.

2do: specify this more


mirrors the API

### I2C EEProm interface

Each daughter device must contain an EEprom on the i2c bus of the VHDCI port that identifies the daughter device to the system.
The device is identified by a simple device id that is specified by an enum in the open instruments API. New device types will be appended to this enum later.

The device type fullfils two roles:

1. Specify the type of daughter device specific IP core that is connected to the port that the device is connected to. In some cases, if the required IP core is not present on the FPGA, this could require a reconfiguration of the FPGA.

1. Allow the  API to enumerate the connected devices and their types, so that an appropriate device specific API/library can be loaded.

2do: specify details


### Interconnect matrix

Each daughter device connected to one of the ports needs to be routed to an appropriate IP core. 
This is accomplished by an interconnect matrix that pairs the pins on the port (VHDCI connector, connected to the FPGA via the FMC connector) to nets of the appropriate IP core.

this interconnect matrix is transparent to both the daughter device and the device specific IP core.



### Daughter device specific IP cores

Each daughter device specific IP core is specific to one device type.


In some cases, multiple instances of these cores will be implemented on the FPGA. For instance multiple generic SPI interfaces will likely be used simultaneously. 
Device specific IP cores can be enumerated by the API via the oiGetNumCores and oiGetCoreType.

2do: add this to the API and specify how this is done.

Examples of daughter device specific IP cores are:

  - An Analog/Digital IO driver that connects to a Analog/Digital front-end,
handling the ADCs etc. 

- An Intan firmware IP core that replicates the existing
Intan Rhythm     firmware.    

- A generic SPI interface module that can connect
to data sources that already include an FPGA that can implement an SPI
interconnect. This could for instance allow electrophysiology systems to be
extended with very low latency capability.

### Host interface IP core

ethernet,

PCIe, xillybus?

## Software

The software has Roughly four layers: Drivers, the Open Instruments API, Daughter device specific libraries/APIs, and the user-facing software

### Drivers

Wrapped into the API on one end, and the wishbone bus on the other.

Ethernet driver, 
xillybus.

### API

This specification does not impose any limitations on the software used to
operate the hardware modules, but specifies a very flexible interface by which
the software communicates with the hardware. This means that both the IP cores
and the software can be independent of the actual interconnect implementation.

The full API specification is found at https://github.com/open-ephys/next-gen-system/tree/master/API

Every communication between the software and the hardware can be cast as either
_(i)_ a read or write from/to a register (of arbitrary size) on the hardware,
for example for configurations, state read-outs etc. or _(ii)_ a read or write
from/to one of possibly many streams, for example for neural data or control
signal streaming.

The API also specifies how devices connected to the FPGA can be discovered and
identified by software, and keeps track of connection status.

### Daughter device specific APIs

obvoius

### User-facing software

