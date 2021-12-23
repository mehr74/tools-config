#!/bin/bash
for var in "$@"
do
    sdcv --color --non-interactive "$var"
    say -v Samantha "$var"
done
