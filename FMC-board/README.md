# FMC Daughter Board

### Documentation

This board roughly conforms to the VITA 57 standard for LPC (low pin count) FMCs (FPGA Mezzanine Card).

It contains:
- 3x direct SMA connectors to the fpga, with overvoltage diode protection.
- 2x intan compatible 12pin omnetics connectors (A & B) for the intan headstage SPI standard, wired directly to the fpga, with a power supply.
- 1x isolated intan compatible connector (C) isolated through LVDS to CMOS converters and galvanic isolators. This headstage has its own power supply that is fed through am isolated DC-DC converter.
- 3x directional SMA connectors (on the card front edge) that are routed through the same isolation circuit as headstage connector C


The overall proposed architecture of the system is outlined [here](https://open-ephys.atlassian.net/wiki/display/OEW/PCIe+acquisition+board)

### Pinout
FMC LPC pinout can be found [here](https://docs.google.com/spreadsheets/d/18WfmbLGt8bGUUdksKp6AKA_wMX2SJ3Tndin-nnEgUCs/edit#gid=584734392)

### BOM
The bill of materials for this device can be found
[here](https://docs.google.com/spreadsheets/d/18WfmbLGt8bGUUdksKp6AKA_wMX2SJ3Tndin-nnEgUCs/edit?usp=sharing).

## Manufacturing requirements
- 4 layers
- 8mil trace width & spacing
- 12mil min. drill

There is one 0.05" pitch BGA connector (the samtech FMC connector) and a few omnetics connectors with inacessible pins on the board, so a stencil and reflow soldering need to be used.

The samtech FMC connector might need to be clamped or held down during reflow soldering. The samtec docs state that they should settle on their own during reflow though, so trying that first seems like a good idea (  http://suddendocs.samtec.com/processing/searay_soldering1.pdf ).

There is a round pad of kapton tape on the connector to provide a clamping surface for this purpose. We have had good success with using a steel paperclip that we modified to exert less force by cutting two slots into the spring. The original paper clips push down too hard and can warp the conenctor. Possibly just weighting it down with a suitable object could also work. Finally, the size of the connector means that it heats up pretty slowly, so expect it to reflow after everything else on the board, and if possible use proper pre-heating.

In order to meet approximately correct trace impedances, the design further is assuming:
 - 1oz copper
 - ~1.2mm total board height, ~0.25mm per layer, dielectric ER = 4.5

## TODO (Rev 1.0)
- [ ] Instead of conforming to VITA 57, PCB footprint should be made to fit in
  a PC expansion slot and be connected to the KC705 using a flex [FMC
  cable](http://suddendocs.samtec.com/prints/hdr-169472-xx-mkt.pdf). This will
  modularize the IO modules, potentially creating an ecosystem of different
  modules for different applications. It will also use extremely standardized
  interface (rear PC expansion slots) which also have excellent
  electrical/mechanical characteristics.
    - A couple interesting IO Module ideas
        - Analog module (e.g. NI DAQ replacement with some beefy multiplex SAR
          ADC and DAC on it)
        - Isolated Intan module (Similar to existing design, featuring galvanic
          isolation)
        - Adjustable logic level digital IO module
        - SPI compression module
        - Etc...
- [ ] As per [page 24 of the KC705 user
  guide](http://www.xilinx.com/support/documentation/boards_and_kits/kc705/ug810_KC705_Eval_Bd.pdf)
  we need to jumper the TDI and TDO pins of our FMC connectors to allow pass
  through of JTAG signals so the FPGA can be programmed when the FMC module is
  connected.
- [ ] For galvanically isolated IO module, we should conform to human use
  standards. Jakob has some info on what is required for this.
