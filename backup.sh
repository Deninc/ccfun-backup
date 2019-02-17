#!/bin/bash

echo_log () {
  echo $(date "+%Y-%m-%d %H:%M:%S %Z") $1
}

myfolder=$(basename $1)

echo_log "start sync folder $1"

aws s3 sync $1 s3://s3-backup/$myfolder --storage-class STANDARD_IA

echo_log "sync done"
