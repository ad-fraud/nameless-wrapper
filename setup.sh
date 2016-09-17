#!/bin/bash
	cd
	CURRENT=$(pwd)
	mkdir nameless
	INSTALL=$(echo $CURRENT/nameless)
	echo -e "alias nameless='cd $INSTALL && $INSTALL/nameless.sh \$1 2>/dev/null'" >> .bash_profile
	cp ~/documents/dev/nameless/nameless.zip $INSTALL
	unzip "$INSTALL"/nameless.zip -d "$INSTALL"
	rm -f "$INSTALL"/nameless.zip
	rm -rf "$INSTALL"/*MACOS*
	chmod +x "$INSTALL"/nameless.sh

	osascript -e 'tell application "Terminal" to do script "nameless cnn.com"'
