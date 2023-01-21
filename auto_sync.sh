#!/bin/bash

SCRIPT_PATH="$(pwd)/sync.sh"
LOG_PATH="$(pwd)/sync.log"
# back up every Friday at 4PM
SCHEDULE='0 16 * * FRI'

# https://stackoverflow.com/a/45770470
(EDITOR=tee && (crontab -l; echo "$SCHEDULE $SCRIPT_PATH >> $LOG_PATH") | uniq - | crontab -)
