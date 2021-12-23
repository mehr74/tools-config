#!/bin/bash

for var in "$@"
do
    cd /Users/mehrshad/.bin/out && out="$(grep -l '<TITLE>'$var'</TITLE>' *)"
    if [ $out == '' ]; then
        cd /Users/mehrshad/.bin/out && out="$(grep -l '<TITLE>'$var *)"
    fi
    if [ $out == '' ]; then
        cd /Users/mehrshad/.bin/out && out="$(grep -l '<TITLE>'$var *)"
    fi
    for val in $out; do
        open /Users/mehrshad/.bin/out/$val
    done
    say -v Anna "$var"
done
