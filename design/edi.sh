#!/bin/sh
# Config script for Cadence-soc
# Source this file to set up Cadence Virtual Silicon Prototyping
# > source /net/ictools/sh/cadence-soc.sh
#
# If you want to specify an alternate path to the Cadence IC package,
#   add something like this to your .bashrc:
# export CDS_SOC_HOME=/net/ictools/cadence/soc_61

default_loc=`readlink -f /net/ictools/cadence/EDI132`

basedir=/net/ictools

source $basedir/sh/license-add.sh 5280

# If package location not specified, use this default:
if [ ! $CDS_SOC_HOME ] ; then
    export CDS_SOC_HOME=$default_loc
elif [ $CDS_SOC_HOME != $default_loc ] ; then
    echo "$0: Overwriting execution path since CDS_SOC_HOME=$CDS_SOC_HOME" 1>&2
fi

# If "soc" is already in the path, remove it:
source $basedir/sh/path-strip.sh soc_

# Add to end of path:
export PATH=${PATH}:$CDS_SOC_HOME/tools/bin
