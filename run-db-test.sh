#!/usr/bin/env sh
set -e

if [ -z $DBENCH_MOUNTPOINT ]; then
    DBENCH_MOUNTPOINT=/mnt/vol1
fi

    echo "tersever,fiover,testname,blocksize,iodepth,readkb,readbw,readiops,readbwmin,readbwmax,readbw%,readbwmean,readbwstd,writekb,writebw,writeiops,writebwmin,writebwmax,writebw%,writebwmean,writebwstd,iod1,iod2,iod4,iod8,iod16,iod32,iod64"
    echo 1 > /proc/sys/vm/drop_caches
    FILEDIR=$DBENCH_MOUNTPOINT fio --output-format=terse db-tests.fio > /tmp/db-test.tmp
    cut -d";" --fields 1-3,6-8,42-49,83-87,93-99 /tmp/db-test.tmp
    FILEDIR=$DBENCH_MOUNTPOINT fio --output-format=terse ai-tests.fio > /tmp/ai-test.tmp
    cut -d";" --fields 1-3,6-8,42-49,83-87,93-99 /tmp/ai-test.tmp
    FILEDIR=$DBENCH_MOUNTPOINT fio --output-format=terse hpc-tests.fio > /tmp/hpc-test.tmp
    cut -d";" --fields 1-3,6-8,42-49,83-87,93-99 /tmp/hpc-test.tmp
    rm /tmp/db-test.tmp
    rm /tmp/ai-test.tmp
    rm /tmp/hpc-test.tmp
    rm $DBENCH_MOUNTPOINT/fiotest
    exit 0
