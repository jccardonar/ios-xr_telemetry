# ios-xr_telemetry
sample configurations and telemetry export files for ios-xr 6.0

### router-telemetry folder
folder contains sample json-based telemetry export files to be placed on the router under `/telemetry/policies/`
to find the telemetry path, prepend the command through `schema-describe` on the router cli or through the use of `m2mcon` https://github.com/cisco/xr-telemetry-m2m-web/blob/master/m2m.md

### router-configuration folder
folder contains sample configuration file for xr6-based router.  files will need to be edited to reflect policy name as uploaded to router
