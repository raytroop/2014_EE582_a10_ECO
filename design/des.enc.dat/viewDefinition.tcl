create_library_set -name NG_lib_typ\
   -timing\
    [list ../lib/lib/NangateOpenCellLibrary_typical_ecsm.lib]
create_rc_corner -name NG_rc_typ\
   -cap_table ../lib/cap/NangateOpenCellLibrary.cap\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name NG_dc_typ\
   -library_set NG_lib_typ\
   -rc_corner NG_rc_typ
create_constraint_mode -name NG_con_typ\
   -sdc_files\
    [list des.sdc]
create_analysis_view -name NG_view_typ -constraint_mode NG_con_typ -delay_corner NG_dc_typ
set_analysis_view -setup [list NG_view_typ] -hold [list NG_view_typ]
