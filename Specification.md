# Open Instruments Specification

This specification defines interfaces for instrumentation systems for
neuroscience (and other fields) that makes full use of existing technologies
and industry standards to deliver the highest possible performance levels and
modular design. The system can be used as a platform for existing and future
data sources, reducing development overhead, while providing increases in
system performance and interoperability. The standard will also result in
extendability to future interface technology generations without the need for
device specific re-engineering.

For a brief overview, see the whitepaper at https://github.com/open-ephys/next-gen-system/tree/master/doc/whitepaper_extended

## Overview

An Open Instruments compatible system consists of one or more data sources or
effectors, termed 'daughter devices', that interact with software on a PC via
a series of standardized interfaces. The Open Instruments standard does not
specify or constrain the design of either the daughter devices, nor the software
used for data acquisition, but specifies a flexible interconnect between the
two.


![Example hardware configuration of a Open Instruments system with threesd
connected daughter devices / breakout boards. In addition to the DIO board that provides the
electrical connections between the FPGA and the breakout boards, a 3rd party FMC
board is shown, connected to the FPGA through the second FMC
connector.](doc/whitepaper_extended/imgs/system_overview.png)

_Example hardware configuration of a Open Instruments system with three
connected daughter devices / breakout boards. In addition to the DIO board that provides the
electrical connections between the FPGA and the breakout boards, a 3rd party FMC
board is shown, connected to the FPGA through the second FMC connector._

Examples of hardware modules / daughter devices  are:

  - A simple Analog/Digital front-end with ADCs DACs and line receivers and
drivers for digital input/output. This would also be the only piece of hardware
needed to use the system in a dynamic clamp whole-cell experiment. 

- A mostly passive interface to Intan headstages, with LVDS line interfaces,
- power supplies and galvanic isolators.

- A digital interface connecting to high density CMOS probes.


To add a new type of probe to an existing open instruments system, only two or three components
need to be designed:

  1. A hardware interface that connects directly to FPGA pins through a
  standardized high-speed digital interconnect via generic 68-pin VHDCI
  connectors and cables (which are connected to the FPGA boards via 
  FMC connectors and an intermediate DIO board as mechanical interconnect). 

  1. A firmware module / IP core for the FPGA that drives this hardware, but
  does not need to be able to communicate with the host PC, or be developed
  for specific drivers.

  1. (Optional) Software that communicates with this hardware through the open
  instruments AI that provides a generic interface to the hardware via data
  transfers and device registers, and can be used with no knowledge of the
  underlying interconnect (PCIe, USB, Ethernet).

By removing and standardizing the intermediate components of hardware-software
interfaces, the development effort required for this is vastly reduced. As an
added benefit, different data sources can be operated together seamlessly in
one system.


![Overview of the components and interfaces of the system. Only the interconnect
infrastructure between the data source and the software are defined by the open
instruments
standard.](doc/whitepaper_extended/imgs/hardware_architecture_sketch.png)

_Overview of the components and interfaces of the system. Only the interconnect
infrastructure between the data source and the software are defined by the open
instruments standard._



#### Definitions

_Daughter device_ - Physical device / breakout bard that acts as a data source, or effector.

_Device type_ - unique id (enum specified in the API) that identifies daughter device types
and specifies the IP core, and device specific API that is used.

_Port_ - A VHDCI connector that connects a daughter device to the DIO board.

_DIO board_ - A PCIe format card that provides an electrical interconnect between
the FPGA and the daughter devices.

_FPGA board_ - A PCIe board that hosts the FPGA, as well as FMC connectors.

_FMC connector_ - A high pin count standardized connector for attaching devices to
FPGAs specified in the Vita 57 standard.

_IP core_ - A piece of firmware code that can be loaded to the FPGA.

_Open Instruments API_ - an API used by other software to communicate to
daughter devices via the FPGA.

_Device specific API_ - an API that uses the Open Instruments API to interact with a daughter device.


## Daughter device - FPGA interface

Daughter devices connect to the FPGA (which either controls the daughter device,
or simply provides an interface to the host PC) by a flexible interface that does
not constrain what devices can be used, but ensures future interoperability.

### Physical and signal type specification

Daughter devices connect to the FPGA via a very simple DIO card that directly
connects pins on the FPGA to connnectors on the back of the host PC via a FMC
connector on the FPGA carrier board.

The main role of this card is to provide direct electrical access to the pins of
the FPGA. The FPGA pins on the FMC connector are broken out into 4 VHDCI
connectors.

See https://docs.google.com/spreadsheets/d/18WfmbLGt8bGUUdksKp6AKA_wMX2SJ3Tndin-nnEgUCs/edit?usp=sharing 
for the full pin assignment.

Most pins on the cable are connected directly to the FPGA, arranged in the
following manner

  - 21 LVDS pairs that can be used in any way (including as 42 non-LVDS signals,
depending on the device-specific firmware).    

- 2 pins are dedicated to an I2C
bus to obtain daughter board IO IDs and metadata,   

- 4 undefined pins 
that can be used in any way   

- 20 Power supply pins (12 ground pins, 4 +5V
pins, and 4 +12V pins) ground and VCC.

VHDCI cables are very widely available at low cost or in very high quality
variants, and are very robust and rated for many mating cycles.

In addition to the VHDCI connectors, the DIO card also provides a few SMA connectors that can be used as clock IO to synchronize multiple systems.

_Possible later extension:_ The kc705 boards provide 4 GTX tranceivers (12Gbps
each) on the HPC FMC connector. Many other FPGA eval boards provide similar
high-speed pins. For a further expansion of the system, these pins could be
routed to external SPF or esata connector on the DIO board, providing a
significantly higher throughput option for device specific or generic digital interfaces.

### Protocol layer

The Open Instruments standard does not enforce any protocol - a daughter device
can communicate with the FPGA via the signal lines on the VHDCI connector
defined in the physical layer in any way. This includes the use of LVDS pins for
single ended signals.

The only specification, apart from the pin out, is the presence of an i2c EEPROM
(either as IC or emulated on a microcontroller or FPGA) on the daughter device
that identifies the device to the FPGA and determines what IP cores are
conencted to the device's port. This identifier is also available to software
via the API.

#### Canconical SPI protocol

If desired, a daughter device can choose to adhere to a simple standardized
protocol to stream data to and from the system via the VHDCI connector. To do
this, the device simply needs to identify (via the eeprom) as a 'canonical SPI
device'. From the point of view of the open instruments standard, this canonical
SPI protocol and the associated IP core are treated like any other daughter
device and device- specific IP core.


In this case, the canonical SPI IP core is connected to a subset of pins on the
VHDCI port.

2do: define this more.


## FPGA - host interface 

The Open Instruments standard opaquely encapsulates the FPGA/host interface so
that neither hardware, firmware nor software need to be modified significantly in
order to switch between interfaces. On the software side, the interface is
encapsulated by the Open Instruments API, and on the firmware side by the Host
interface IP core.


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

[PCIe](https://en.wikipedia.org/wiki/PCI_Express), which is used as the basic
for almost all other interfaces can currently achieve throughputs of around ~100
Gbts, which far exceeds the bandwidth required for any current or mid-term
electrophysiology applications, but could be useful eventually. The most common
type of FPGA evaluation board that is recommended for open einstruments systems,
the Xilinx Kintex kc705 achieves around 12Gbps, which is sufficient for almost
all current applications.

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

Individual IP cores on the FPGA communicate via a standardized interconnect
based on the wishbone specification.

2do: specify this more - ideally the wishbone specifications should very closely
mirror the API, similarly to how xillybus and opalkelly have equivalent API
calls for register writes/reads/wires to registers, and pipes/streams to fifos.


### I2C EEPROM interface

Each daughter device must contain an EEPROM on the i2c bus of the VHDCI port
that identifies the daughter device to the system. The device is identified by a
simple device id that is specified by an enum (oiDeviceType) in the open
instruments API. New device types will be appended to this enum later.

The device type fullfils two roles:

1. Specify the type of daughter device specific IP core that is connected to the port that the device is connected to. In some cases, if the required IP core is not present on the FPGA, this could require a reconfiguration of the FPGA.

1. Allow the  API to enumerate the connected devices and their types, so that an appropriate device specific API/library can be loaded.

2do: specify details


### Interconnect matrix

Each daughter device connected to one of the ports needs to be routed to an
appropriate IP core.  This is accomplished by an interconnect matrix that pairs
the pins on the port (VHDCI connector, connected to the FPGA via the FMC
connector) to nets of the appropriate IP core.

This interconnect matrix is fullly transparent to both the daughter device and
the device specific IP core, and connects all pins on the VHDCI port to
corresponding nets on the device specific IP core.

2do: when is this done? on oiOpenPort()?

### Daughter device specific IP cores

Each daughter device specific IP core is specific to one device type, defined by
the device type id enum (oiDeviceType).

In some cases, multiple instances of these cores will be implemented on the
FPGA.  For instance multiple generic SPI interfaces will likely be used
simultaneously.

The presence of a matching IP core is checked by oiGetDeviceType, and the VHDCI
pins on the port are associated with the ip core in oiOpenPort. 

2do: is oiOpenPort the correct call to do this?
2do: do we want that device specific IP cores can be enumerated by the API via
an oiGetCoreType call? 

_One possible way this could work is that we loop over the oiGetNumPorts ports,
and call oiGetDeviceType, and run oiOpenPort immediately. The return code then
signals whether an ip core is present, or present and already associated with a
port etc. Now the software could try uploading a different firmware that
includes the required IP cores?_


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

All communication to the API and to device specific and user-facing software is
encapsulated on the firmware side into host interface IP cores that adhere to
the same wishbone interface as daughter device specific IP cores.

There are two types of interfaces by which the host  interface IP core
communicates with device specific IP cores: Registers, and streams.

Registers are accessed on the API via oiReadConfig and oiWriteConfig by simple
key/value (int) pairs. On the IP core, the configuration corresponds directly to
a register bank.

Ports can contain multiple streams, and each streams is accessed by oiReadStream
or oiWriteStream. On the IP core, these streams correspond to FIFOs.

2do: wrap this in a wishbone compatible interface.

Examples of host interface IP cores are:

- Ethernet

- PCIe via xillybus

## Software

The software comonents of a Open Instruments system can be divided into four
layers: Interface specific drivers, the Open Instruments API, the daughter device specific
libraries/APIs, and the user-facing software. Only the Open Instruments API is
specified by this standard and ensures interoperability between system
components. However, in almost all practical implementations, a driver (for
example for Ethernet, or PCIe) will already be present, so developers aiming to
integrate a new device only have to implement the device specific API and
possiby user-facing software.

Conversely, switching out the host PC interface should not require changes to the device specific code.


### Drivers

Drivers for the hardware-software interconnect are opaquely wrapped into the
open instruments API on one end, and the (wishbone bus compatible)
specification of the host- pc interface IP core on the other. This means that
developers can either develop for daughter devices without having to spend
time on the interconnect specifics, or swap interconnects without requiring
re-enginering of other system components.

Examples of interconnect drivers are:

- Ethernet driver, 

- xillybus.

2do: _possible exception to the independence of drivre/interconnect implementation_: 
it seems likely that we want to be able to (optionally)
configure the interconnect - for instance selecting block transfer sizes for a
speed thourghput tradeoff. We could specify that this is optional and of course
not driver independent, but that all API implementations should come with
default values so that no specific configuration is strictly required. Maybe
oiSetStreamAttributes already covers this? Or could there be other configuration
options that are needed in special cases?

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

On top of the Open Instruments API, there will be daugher-device specific functions that should not be implemented by the user-facing software
Examples of these are cable lenght calculation for the SPI bus on Intan chips, Impedance measurements, unpacking of data formats to interpretable values and timestamps, etc.

For this, a user facing software can use oiGetDeviceType to determine the correct device specific API to interact (via the Open Instruments API) with the hardware/firmware of that device.

### User-facing software

The User-facing software can either interact with the duagher device firmware directly trough the Open Instruments API, and/or an intermediate layer of a daughter device specific API.

Examples of user-facing software packages are:

- Minimalistic Open instruments data stream interface

- The Open Ephys GUI 

- Bonsai

