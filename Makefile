#!/usr/bin/make -f

all: logs
	git add .
	git submodule foreach "git add ."
	git submodule foreach "git commit -a -m \"`date`\""
	git commit -a -m "`date`"
	#git push --mirror origin


logs:
	@find ./private/log/ \( -name "*-echo.log" -o -name "*-discard.log" -o -name "*-.log" -o -regex "\.\/log\/\(ZIOLA\|FRAGI\)-\(discard\|echo\)" \) -exec rm {} \;
	@find ./private/log/ -name "*.log" -exec bzip2 {} \;
	
