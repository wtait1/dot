#!/bin/bash

SRC='./src'

echo 'Sync started'

echo 'Backing up files...'
./backup.sh

echo 'Pushing to Github...'
git add $SRC && git commit -m "backup:$(date +%s)" && git push

echo 'done'

