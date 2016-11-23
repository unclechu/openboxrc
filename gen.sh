#!/bin/bash

cat rc.xml \
	| sed 's/terminator --profile dark/termite/g' \
	| sed 's/terminator --profile light/termite --config ~\/.config\/termite\/config-light/g' \
	> rc-termite-terminal.xml
