#!/usr/bin/env bash
URL=https://community-static.aldebaran.com/resources/2.8.7/Choregraphe+Suite/Linux64/choregraphe-suite-2.8.7.4-linux64.tar.gz
tgz=$(basename $URL)
d=$(echo $tgz | sed 's/.tar.gz//')


if [ ! -d $d ] ; then
    if [ ! -f $tgz ] ; then
        wget $URL
    fi
    tar xvzf $tgz
fi

steam-run $d/choregraphe

