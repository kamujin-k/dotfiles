#!/bin/bash


# Enables 'tap to click' on touchpad
xinput set-prop "DLL0798:00 06CB:7E92 Touchpad" "libinput Tapping Enabled" 1

# Screensaver and lock screen
xscreensaver -no-splash &

# Compositor (only for transparency)
compton
