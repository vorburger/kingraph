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
