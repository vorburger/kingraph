.PHONY: help

help:
	$(info help	- show this help)
	$(info deps	- install dependencies)
	$(info test	- run tests)
	@true

deps:
	@npm install

test: test-compile-to-png
#todo: real "nodeunit" tests with coverage and expectations
	@./bin/kingraph tests/1_simple.yaml -F dot > /tmp/kingraph-test && grep ♀ /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 1.1)"
	@./bin/kingraph tests/1_simple.yaml -F dot > /tmp/kingraph-test && grep ♂ /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 1.2)"
	@./bin/kingraph tests/3_born.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 3)"
	@./bin/kingraph tests/4_died.yaml -F dot > /tmp/kingraph-test && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 4)"
	@./bin/kingraph tests/5_born_died.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 5)"
	@./bin/kingraph tests/6_born2.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 6)"
	@./bin/kingraph tests/7_image.yaml -F dot > /tmp/kingraph-test && grep image2 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 7)"

test-compile-to-png: tests/*.yaml examples/*.yml
#todo: not all compile to SVG
	@for file in $^ ; do \
		./bin/kingraph $${file} -F dot | dot -Tpng -o $${file}.png ; \
		echo "PASS (Compiling $${file} to PNG)" ; \
	done
