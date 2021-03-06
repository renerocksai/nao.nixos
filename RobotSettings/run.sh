#!/usr/bin/env bash
URL=https://community-static.aldebaran.com/resources/2.8.7/Robot+settings+1.2.1/Linux64/robot-settings_linux64_1.2.1-6c3a1204f_20210902-182550.tar.gz
tgz=$(basename $URL)
d=$(echo $tgz | sed 's/.tar.gz//')


if [ ! -d $d ] ; then
    if [ ! -f $tgz ] ; then
        wget $URL
    fi
    tar xvzf $tgz
fi

steam-run $d/bin/robot_settings

