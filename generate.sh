#!/bin/bash
steroidsurl="https://raw.github.com/AppGyver/steroids/master/src/steroids.coffee"
opts=$(curl -s $steroidsurl | grep '^\s\+when ".*"$' | sed -e 's/when //' -e 's/[ "]//g' | tr '\n' ' ' )
sed "s/%OPTS%/$opts/" < steroids.template > steroids
chmod +x steroids