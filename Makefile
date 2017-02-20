all: clean
	cat rc.xml \
		| sed 's/terminator --profile dark/termite/g' \
		| perl -pe 'BEGIN { @x=@ARGV; @ARGV=() }; \
			s/terminator --profile light/termite --config @x/g' \
			'~/.config/termite/config-light' \
		> rc-termite-terminal.xml
	cat rc.xml | perl -pe 's/terminator(?= --profile )/konsole/g' \
		> rc-konsole-terminal.xml

clean:
	rm -f rc-termite-terminal.xml rc-konsole-terminal.xml
