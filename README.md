##  Next generation electrophysiology acquisition core
This repository is a work in progress repository for next generation open
source acquisition and closed-loop feedback system for multichannel
electrophysiology.

This project will hopefully end up being more than just an [open
ephys](http://www.open-ephys.org/) associated standard and will possibly be
moved to a different host org. Ideally we could end up with a set of open, and
evolving interface standards, code blocks and APIs that many different projects
can adapt parts of.

See the [working draft of the
specification](https://open-ephys.atlassian.net/wiki/display/OEW/PCIe+acquisition+board)
for details on the projects goals and desired features.

For now, we are aiming to build a working proof-of-principle prototype that we
can use as starting point to develop proper standards.

## License

### Hardware
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img
alt="Creative Commons License" style="border-width:0"
src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
<br/>
<span
    xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Open Ephys FMC Intan IO module
</span> 
by 
<a xmlns:cc="http://creativecommons.org/ns#"
href="https://github.com/open-ephys/next-gen-system/" property="cc:attributionName"
rel="cc:attributionURL">Jonathan P. Newman, Jakob Voigts</a> 
is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative
Commons Attribution-ShareAlike 4.0 International
License</a>.
<br/>
Based on a work at <a xmlns:dct="http://purl.org/dc/terms/"
href="https://github.com/open-ephys/next-gen-system"
rel="dct:source">https://github.com/open-ephys/next-gen-system </a>


### Software
To be decided. Will likely be different licences for different layers of the
system (e.g. the firmware and devices drivers versus APIs and language bindings
versus plugins for various applications).
