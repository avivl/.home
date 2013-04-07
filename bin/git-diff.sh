#!/bin/bash - 
#===============================================================================
#
#          FILE:  git-diff.sh
# 
#         USAGE:  ./git-diff.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Aviv Laufer (al), aviv@cellrox.com
#       COMPANY: Cellrox
#       CREATED: 10/16/2011 07:24:49 PM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

meld "$2" "$5" > /dev/null 2>&1
