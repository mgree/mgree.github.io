.PHONY: sync

sync : mgree_bib.html
	rsync --exclude Makefile -Cavr . office:~/../htdocs/mg19/
#	ssh office ./make_html_public

mgree_bib.html : mgree.bib
	TMPDIR="." bibtex2html mgree.bib
	@rm mgree.html
