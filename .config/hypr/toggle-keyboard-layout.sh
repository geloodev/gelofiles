#!/bin/bash

layout=$(hyprctl devices -j | jq -r '.keyboards[0].active_keymap')

if [ "$layout" == "Portuguese (Brazil)" ]; then
    hyprctl keyword input:kb_layout "ru"
else
    hyprctl keyword input:kb_layout "br"
fi
