.PHONY: sync

sync : mgree_bib.html
	@echo MOUNTING WEBSPACE
	@pomona-www || echo Are you on the VPN?
	@echo SYNCING POMONA
	@rsync --exclude Makefile --exclude .git --exclude .gitignore --inplace -Crlv . ~/.local/mnt/pomona-www/
	@echo CLEANING UP
	@sudo umount ~/.local/mnt/pomona-www

mgree_bib.html : mgree.bib
	TMPDIR="." bibtex2html mgree.bib
	-rm mgree.html 
