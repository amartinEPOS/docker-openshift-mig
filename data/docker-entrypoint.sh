#!/bin/sh

# OC_RSYNC_SRC: rsync source target

if [ -z "$(ls -A /data)" ]; then
	exec ./oc-client/oc rsync $OC_RSYNC_SRC /data --progress=true
fi
