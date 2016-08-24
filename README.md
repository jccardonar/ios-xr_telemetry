# ios-xr_telemetry
sample configurations and telemetry export files for ios-xr 6.0

### router-telemetry folder
folder contains sample json-based telemetry export files to be placed on the router under `/telemetry/policies/`
to find the telemetry path, prepend the command through `schema-describe` on the router cli or through the use of `m2mcon` https://github.com/cisco/xr-telemetry-m2m-web/blob/master/m2m.md

### router-configuration folder
folder contains sample configuration file for xr6-based router.  files will need to be edited to reflect policy name as uploaded to router

### netem_scripts folder
this folder contains two scripts `delay_randomization.sh` and `window_delay.sh`.  these two files interact with the tc-netem package that can be installed in linux.  using this package, delay, jitter, and traffic loss can be set (amongst other things).  `delay_randomization.sh` uses the a modulus of the `$RANDOM` function within linux and sets a shell variable.  this variable is then called to change the running value of the delay on an interface, as well as write the value to `/etc/init.d/netem` for persistence through reboots.
`window_delay.sh` is simply a wrapper for `delay_randomization.sh` to set a random window in which the delay is changed, using `$RANDOM` and the daemon `atd` for scheduling.  `window_delay.sh` needs to be configured in `crontab` for the desired user.
further instructions on usage can be found in the appropriate scripts