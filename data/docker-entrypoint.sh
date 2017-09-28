#!/bin/sh

# OC_RSYNC_SRC: rsync source target
# OC_RSYNC_DEST: rsync destination target

exec ./oc-client/oc rsync $OC_RSYNC_SRC $OC_RSYNC_DEST --progress=true