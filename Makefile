all: clean
	cat rc.xml \
		| perl -pe 'BEGIN { @x=@ARGV; @ARGV=() }; \
			s/terminator --profile (dark|light)/termite --config @x\1/g' \
			'~/.config/termite/config-' \
		> rc-termite-terminal.xml
	cat rc.xml | perl -pe 's/terminator(?= --profile )/konsole/g' \
		> rc-konsole-terminal.xml

clean:
	rm -f rc-termite-terminal.xml rc-konsole-terminal.xml
