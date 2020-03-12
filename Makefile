.PHONY: sync

sync : mgree_bib.html
	@echo MOUNTING WEBSPACE
	@-umount ~/www
	@pomona-www || { echo Are you on the VPN? && exit 2 ; }
	@echo SYNCING POMONA
	@rsync --exclude '*~' --exclude Makefile --exclude .git --exclude .gitignore --inplace -CWaurv . ~/www/
	@echo CLEANING UP
	@umount ~/www

mgree_bib.html : mgree.bib
	TMPDIR="." bibtex2html mgree.bib
	-rm mgree.html 
