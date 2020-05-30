#!/bin/bash


# Enables 'tap to click' on touchpad
xinput list --name-only | grep -i touchpad | xargs -I {} xinput set-prop {} "libinput Tapping Enabled" 1
xinput list --name-only | grep -i touchpad | xargs -I {} xinput set-prop {} "libinput Natural Scrolling Enabled" 1

# Screensaver and lock screen
xscreensaver -no-splash &

# Compositor (only for transparency)
compton &

# clipboard manager
copyq &
