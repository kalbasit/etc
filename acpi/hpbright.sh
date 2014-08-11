#!/bin/sh

KEYS_DIR=/sys/class/backlight/intel_backlight

test -d $KEYS_DIR || exit 0

MIN=0
MAX=$(cat $KEYS_DIR/max_brightness)
VAL=$(cat $KEYS_DIR/brightness)

case $1 in
    up)
      VAL=$((VAL+50)) ;;
    down)
      VAL=$((VAL-50)) ;;
esac

if [ "$VAL" -lt $MIN ]; then
	VAL=$MIN
elif [ "$VAL" -gt $MAX ]; then
	VAL=$MAX
fi

echo $VAL > $KEYS_DIR/brightness
