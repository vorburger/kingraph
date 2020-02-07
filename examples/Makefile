all: got.svg simpsons.svg potter.svg got.png simpsons.png potter.png modernfamily.png

open: all
	open *.svg -a "Google Chrome"

%.png: %.yaml
	../bin/kingraph $^ -F png > $@
%.svg: %.yaml
	../bin/kingraph $^ -F svg > $@
