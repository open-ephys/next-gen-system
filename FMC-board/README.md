# FMC Daughter Board

### Pinout
FMC LPC pinout can be found [here](
https://docs.google.com/spreadsheets/d/1bgnBP1xqPFtFIQYF-BCybK1KkekfmRYwm2GDAU4D9lo/edit?usp=sharing)

### BOM
The bill of materials for this device can be found
[here](https://docs.google.com/spreadsheets/d/18WfmbLGt8bGUUdksKp6AKA_wMX2SJ3Tndin-nnEgUCs/edit?usp=sharing).

## Manufacturing requirements
- 4 layers
- 8mil trace width & spacing
- 12mil min. drill

There is one 0.05" pitch BGA connector and a few omnetics connectors with inacessible pins on the board, so a stencil and reflow soldering need to be used.

In order to meet approximately correct trace impedances, the design further is assuming:
 - 1oz copper
 - ~1.2mm total board height, ~0.25mm per layer, dielectric ER = 4.5

## TODO
- [X] Fully galvanically isolated IO.
- [x] The PDS1-S12-S5-S DC-DC converter's operating frequency (100-300 kHz)
  resides right in the minimum range of the TPS993\*'s PSRR spectrum. Bummer.
  Consider using LDO regulator with better rejection in this range  or choosing
  isolated DC-DC converter with a different switching frequency since this can
  absolutely affect the effective resolution of the RHD chips if there is a
  short cable used for data transmission. Longer cables series inductance and
  parallel capacitance will probably filter this ripple and noise.
    - EDIT: I tried to optimize the caps on the converter to reduce ripple and
    added a series ferrite chip which will introduce loss in the high freq
    portion of the noise.
    - EDIT: For RHD power, I switched to a TPS4001 which is extremely capable
      in this freqency range and has has intended use as post DC-DC converter
      regulator
- [x] TI's ISO7641 has better electrical characteristics in almost every
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
- [X] Do we want to add level shifters or anything that can drive more current
  than the bare FPGA pins?
    - Or, selectable 50 Ohm termination (e.g. for those using function gens)
    - NOTE: This issue will go away a bit when we get rid of non-isolated
      connections to FPGA. Still may want to consider buffering those singal
      with a clock driver though.
    - EDIT: not for now - we have the SMAs and can just use separate driver circuits / level shifters if needed.
- [x] For the SMA connectors, add a simple series 10 ohm resistor into back to
  back Schottky diodes with the anode of the 'top' tied to the appropriate VCC.
  This will provide a fast input protection circuit that will activate before
  the PN diodes on the FPGA itself.
    - NOTE: This is a good idea even for the isolated section, but we should
      wait until we get rid of non-isolated pins to implement.
