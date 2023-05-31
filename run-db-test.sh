#!/usr/bin/env sh
set -e

    echo "tersever,fiover,testname,blocksize,iodepth,readkb,readbw,readiops,readlatmin,readlatmax,readlatmean,readlatstdev,readbwmin,readbwmax,readbw%,readbwmean,readbwstd,writekb,writebw,writeiops,writelatmin,writelatmax,writelatmean,writelatstdev,writebwmin,writebwmax,writebw%,writebwmean,writebwstd,iod1,iod2,iod4,iod8,iod16,iod32,iod64"
    echo 1 > /proc/sys/vm/drop_caches
    fio --output-format=terse db-tests.fio > /tmp/db-test.tmp
    cut -d";" --fields 1-3,6-8,38-49,79-87,93-99 /tmp/db-test.tmp
    fio --output-format=terse ai-tests.fio > /tmp/ai-test.tmp
    cut -d";" --fields 1-3,6-8,38-49,79-87,93-99 /tmp/ai-test.tmp
    fio --output-format=terse hpc-tests.fio > /tmp/hpc-test.tmp
    cut -d";" --fields 1-3,6-8,38-49,79-87,93-99 /tmp/hpc-test.tmp
    rm /tmp/db-test.tmp
    rm /tmp/ai-test.tmp
    rm /tmp/hpc-test.tmp
    exit 0
