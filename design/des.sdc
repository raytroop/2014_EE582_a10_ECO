###################################################################

# Created by write_sdc on Fri Sep  5 13:55:51 2014

###################################################################
set sdc_version 1.8

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_max_capacitance 10000.0 [current_design]
set_max_fanout 12 [current_design]
set_max_delay -from UDriver/Z -to USink/A 0.5

