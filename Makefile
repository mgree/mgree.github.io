.PHONY: sync

mgree_bib.html : mgree.bib
	TMPDIR="." bibtex2html mgree.bib
	-rm mgree.html 

sync : mgree_bib.html
	@echo MOUNTING WEBSPACE
	@if mount | grep www; then umount ~/www; fi
	@pomona-www || { echo Are you on the VPN? && exit 2 ; }
	@echo SYNCING POMONA
	@rsync --exclude '*~' --exclude Makefile --exclude .git --exclude .gitignore --exclude .DS_Store --exclude courses --inplace --progress -CWaurv . ~/www/
	@echo CLEANING UP
	@umount ~/www
