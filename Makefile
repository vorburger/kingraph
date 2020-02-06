.PHONY: help

help:
	$(info help	- show this help)
	$(info deps	- install dependencies)
	$(info test	- run tests)
	@true

deps:
	@npm install

test:
#todo: real "nodeunit" tests with coverage and expectations
	@./bin/kingraph tests/1_simple.yaml -F svg > /tmp/kingraph-test && echo "PASS 1 (SVG)"
	@./bin/kingraph tests/1_simple.yaml -F dot > /tmp/kingraph-test && echo "PASS 1 (DOT)"
	@./bin/kingraph tests/2_name-only.yaml -F svg > /tmp/kingraph-test && echo "PASS 2 (SVG)"
	@./bin/kingraph tests/2_name-only.yaml -F dot > /tmp/kingraph-test && echo "PASS 2 (DOT)"
	@./bin/kingraph tests/3_born.yaml -F svg > /tmp/kingraph-test && echo "PASS 3 (SVG)"
	@./bin/kingraph tests/3_born.yaml -F dot > /tmp/kingraph-test && echo "PASS 3 (DOT)"
	@./bin/kingraph tests/3_born.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && echo "PASS 3 (CONTENT)"
	@./bin/kingraph tests/4_died.yaml -F dot > /tmp/kingraph-test && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS 4 (CONTENT)"
	@./bin/kingraph tests/5_born_died.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS 5 (CONTENT)"