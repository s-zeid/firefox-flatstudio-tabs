all: out/firefox.css out/thunderbird.css

out/firefox.css: main.css
	cp -a $< $@

out/thunderbird.css: main.css
	cat $< \
	 | sed -e 's/\(#\)TabsToolbar/\1tabs-toolbar/g;s/\(\.\)tabbrowser/\1tabmail/g' \
	 > $@

.PHONY: clean

clean:
	rm -f out/*.css
