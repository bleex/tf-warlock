#!/usr/bin/make -f

all: logs
	git add .
	git commit -a -m "`date`"
	#git push --mirror origin


logs:
	@find ./log/ \( -name "*-echo.log" -o -name "*-discard.log" -o -name "*-.log" -o -regex "\.\/log\/\(ZIOLA\|FRAGI\)-\(discard\|echo\)" \) -exec rm {} \;
	@find ./log/ -name "*.log" -exec bzip2 {} \;
	
