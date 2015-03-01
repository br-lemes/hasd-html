
hasd.pdf: hasd.book
	@htmldoc --batch $<

hasd.book: html
	@cp .book $@
	@for d in [0-9][0-9][0-9]/letra/index.html; do echo $$d >> $@; done

html:
	@for d in [0-9][0-9][0-9]/letra; do $(MAKE) -C $$d; done

clean:
	$(RM) hasd.pdf hasd.book
	@for d in [0-9][0-9][0-9]/letra; do $(MAKE) -C $$d clean; done

.PHONY: clean html
