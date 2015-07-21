.PHONY: sync

sync : mgree_bib.html
	@echo SYNCING PRINCETON
	rsync --exclude Makefile --exclude .git --exclude .gitignore -Cavr . princeton:~/../htdocs/mg19/
	@echo SYNCING POMONA
	rsync --exclude Makefile --exclude .git --exclude .gitignore -Cavr . pomona:www/

mgree_bib.html : mgree.bib
	TMPDIR="." bibtex2html mgree.bib
	@rm mgree.html
