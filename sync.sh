#!/bin/bash

set -e

SRC='./src'

echo "[$(date)] Sync started"

echo "[$(date)] Backing up files..."
./backup.sh

if [[ -z $(git diff --stat) ]]; then
  echo "[$(date)] Nothing to commit"
else
	echo "[$(date)] Committing..."
	git add $SRC && git commit -m "backup:$(date +%s)"
fi

echo "[$(date)] done"

