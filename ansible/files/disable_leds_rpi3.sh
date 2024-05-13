#!/bin/bash

sudo sh -c 'echo none > /sys/class/leds/ACT/trigger'
sudo sh -c 'echo none > /sys/class/leds/PWR/trigger'
sudo sh -c 'echo 0 > /sys/class/leds/ACT/brightness'
sudo sh -c 'echo 0 > /sys/class/leds/PWR/brightness'
sudo sh -c 'lan951x-led-ctl --fdx=0 --lnk=0 --spd=0'