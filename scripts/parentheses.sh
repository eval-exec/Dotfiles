#!/bin/bash -
#===============================================================================
#
#          FILE: parentheses.sh
#
#         USAGE: ./parentheses.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 01/19/2021 03:42:12 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error


for (( n = 1; n < 100;n++ ));do
    echo -n '"';
    for ((i = 1;i < $n;i++));do
        if [[ $(( $RANDOM % 2 )) -eq 1 ]];then
            echo -n '('
        else
            echo -n ')'
        fi
    done 
    echo '"'

done

