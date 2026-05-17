#!/bin/bash

pkill swaync
pkill waybar
sleep 0.2

swaync &
waybar &
