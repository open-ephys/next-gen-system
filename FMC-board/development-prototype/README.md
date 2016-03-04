# FMC daughter board development prototype

FMC LPC pinout diagram at:
https://docs.google.com/spreadsheets/d/1bgnBP1xqPFtFIQYF-BCybK1KkekfmRYwm2GDAU4D9lo/edit?usp=sharing



Features:

1x FMC connector (use LPC side, seems marginally easier to solder and we dont need the high pin count right now)
https://forums.xilinx.com/t5/Xilinx-Boards-and-Kits/FMC-Where-to-buy/td-p/44218
https://www.samtec.com/standards/fmc#asicdevelopment

~2-4 Omnmetics connectors for intan SPI cables to headstages
Maybe implement 1-2 SPI port with proper electrical decoupling (based on existing headstage decoupling board, but omit DC-DC transformer), but add at least an equal number of non-decoupled ones just in case there's an iissue with the circuit.

Testpoints & SMA connectors for probing things

At least ~4 (protected?) SMA or BNC in- and outputs to/from the FPGA for closed-loop tests.
Do we want to add level shifters or anything that can drive more current than the bare fpga pins?
