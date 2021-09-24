#!/bin/bash

SCRIPT_LOC="$(pwd)/sync.sh"
# back up every Friday at 4PM
SCHEDULE='0 16 * * FRI'

# https://stackoverflow.com/a/45770470
(EDITOR=tee && (crontab -l; echo "$SCHEDULE $SCRIPT_LOC") | uniq - | crontab -)
