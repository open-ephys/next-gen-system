# headstage-isolation-board
isolation board for RHD headstge, electrically decouples headstage from aq. board.
This could be useful for mitigating recording noise in some scenarious, or simplify proper grounding practive, especially if multiple recording rigs share the same acquisition board. Eventually, this device could be used to provide safety for human EEG or intracortical applications, but this would require extensive testing and approval procedures.

*This device has not been tested and is not considered safe for any use case. Only use this if you are approved to do so independently.*

# operating principle
This isolation board translates the LVDS signals to a single ended CMOS signal, isolates this signal and translates it back to LVDS. Power isolation is accomplished through a separate 5V isolation transformer.


Based on Analog Devices ADUM3440 isolators 9 http://www.analog.com/media/en/technical-documentation/data-sheets/ADuM3440_3441_3442.pdf )
UL recognition: 2500 V rms for 1 minute per UL 1577,  CSA Component Acceptance Notice #5A, VDE certificate of conformity, DIN V VDE V 0884-10 (VDE V 0884-10):2006-12 
V_IORM = 560 V peak

LVDS<-> CMOS trsnalation is done via on Analog Devices ADN4664 Dual, 3 V, CMOS, LVDS Differential Line Receivers ( http://www.analog.com/media/en/technical-documentation/data-sheets/ADN4664.pdf ) and ADN4663 Dual, 3 V, CMOS, LVDS High Speed Differential Drivers ( http://www.analog.com/media/en/technical-documentation/data-sheets/ADN4663.pdf )

Power isolation is done with a Murata NMV0505 3kVDC Isolated 5V DC/DC Converters ( http://power.murata.com/data/power/ncl/kdc_nmv.pdf )
