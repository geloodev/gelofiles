#!/bin/sh

# NOTE: This script requires pipewire & wireplumber

volume() {
	#echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -e 's/^.*: //')"
	amixer -D pulse sget Master | awk -F '[^0-9]+' '/Left:/{print $3}'
}

muted() {
	if [ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED)" ]; then
		echo true
	else
		echo false
	fi
}

micvolume() {
	echo "$(wpctl get-volume 49 | sed -e 's/^.*: //')"
}

micmuted() {
	if [ "$(wpctl get-volume 49 | grep MUTED)" ]; then
		echo true
	else
		echo false
	fi
}

if [[ $1 == "--volume" ]]; then
	volume
elif [[ $1 == "--muted" ]]; then
	muted
elif [[ $1 == "--micvolume" ]]; then
	micvolume
elif [[ $1 == "--micmuted" ]]; then
	micmuted
fi

