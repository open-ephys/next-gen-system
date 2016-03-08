# Next generation system
Work in progress repository for next generation acquisition and closed-loop
feedback system.

This should eventually not just an open ephys associated standard and will
possibly be moved to a different host org. Ideally we could end up with a set
of open, and evolving interface standards, code blocks and APIs that many
different projects can adapt parts of.

See here for a working draft of the specifications:

https://open-ephys.atlassian.net/wiki/display/OEW/PCIe+acquisition+board

For now, we should try to build a working proof-of-principle prototype that we
can use as starting point to develop proper standards.

## FMC Daughter Card TODOs

- [ ] The PDS1-S12-S5-S DC-DC converter's operating frequency (100-300 kHz)
  resides right in the minimum range of the TPS993\*'s PSRR spectrum. Bummer.
  Consider using LDO regulator with better rejection in this range  or choosing
  isolated DC-DC converter with a different switching frequency since this can
  absolutely affect the effective resolution of the RHD chips.
- [ ] The two LVDS to single-ended receivers (ADN4664) attached to the FMC
  interface are probably not necessary because those lines might be able to be
  natively single ended. Not sure.
- [ ] A couple of the LVDS --> Single converters on the FPGA side have inverted
  inputs on the LVDS side
- [ ] TI's ISO7641 has better electrical characteristics in almost every 
  single way compared to the ADUM3440 and is cheaper. Has the same pinout, 
  footprint, and package, so we can just switch it.
- [ ] Does the FPGA provide on-board termination for LVDS. Seems likely 
  that it does and we don't need external 100 Ohm resistors next to the FMC connector 
  which is pretty far from the FPGA anyway.
