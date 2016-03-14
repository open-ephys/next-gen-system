# FMC Daughter Board

Will eventually connect the PCIE FPGA board to the probes and other
peripherals. In its current stage, it is a rough proof of concept.

FMC LPC pinout diagram at:
https://docs.google.com/spreadsheets/d/1bgnBP1xqPFtFIQYF-BCybK1KkekfmRYwm2GDAU4D9lo/edit?usp=sharing

## Features

- 1x FMC connector (use LPC side, seems marginally easier to solder and we don't
  need the high pin count right now)
  https://forums.xilinx.com/t5/Xilinx-Boards-and-Kits/FMC-Where-to-buy/td-p/44218
  https://www.samtec.com/standards/fmc#asicdevelopment
- 1 isolated Omnmetics connector for Intan SPI cables to headstages.
- 2 non-isolated Omnmetics connectors for Intan SPI cables to headstages as a temporary failsafe.
- Testpoints & SMA connectors for probing things
- At least ~4 (protected?) SMA or BNC inputs and outputs to/from the FPGA for
  closed-loop tests.

## TODO

- [ ] The PDS1-S12-S5-S DC-DC converter's operating frequency (100-300 kHz)
  resides right in the minimum range of the TPS993\*'s PSRR spectrum. Bummer.
  Consider using LDO regulator with better rejection in this range  or choosing
  isolated DC-DC converter with a different switching frequency since this can
  absolutely affect the effective resolution of the RHD chips if there is a
  short cable used for data transmission. Longer cables series inductance and
  parallel capacitance will probably filter this ripple and noise.
    - EDIT: I tried to optimize the caps on the converter to reduce ripple and
    added a series ferrite chip which will introduce loss in the high freq
    portion of the noise.
- [ ] TI's ISO7641 has better electrical characteristics in almost every
  single way compared to the ADUM3440 and is cheaper. Has the same pinout,
  footprint, and package, so we can just switch it.
- [ ] Does the FPGA provide on-board termination for LVDS? Seems likely
  that it does and we don't need external 100 Ohm resistors next to the FMC connector
  which is pretty far from the FPGA anyway.
- [x] The power jacks seem unnecessary since we will have 12V (and maybe 5V?)
  from the dev board. I guess we can keep them as backup (jumper selectable),
  but our main power should be coming from the dev board.
    - ~~EDIT: Keep them for now as a failsafe. In the future, the non-isolated
      regulators, are likely to go away anyway so that will get rid of the one
      jack and once the isolated power supply proves functional, that will get
      rid of the other~~
    - EDIT: During movement to FMC standard compliance, they were replaced with
      0.1" headers along with reverse polarity protection circuit.
- [ ] Do we want to add level shifters or anything that can drive more current
  than the bare FPGA pins?
- [ ] For the SMA connectors, add a simple series 10 ohm resistor into back to
  back Schottky diodes with the anode of the 'top' tied to the appropriate VCC.
  This will provide a fast input protection cicuit that will activate before
  the PN diodes on the FPGA itself.
