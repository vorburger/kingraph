.PHONY: help

help:
	$(info help	- show this help)
	$(info deps	- install dependencies)
	$(info test	- run tests)
	$(info lint - run linter)
	@true

deps:
	@npm install
	@npm install -g eslint

lint: lib/*.js
#todo: fix shown issues
	@eslint index.js
	@for file in $^ ; do \
		eslint "$${file}" ; \
	done

test: test-compile-to-png test-compile-to-pdf test-compile-to-svg
#todo: real "nodeunit" tests with coverage and expectations
	@./bin/kingraph tests/1_simple.yaml -F dot > /tmp/kingraph-test && grep ♀ /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 1.1)"
	@./bin/kingraph tests/1_simple.yaml -F dot > /tmp/kingraph-test && grep ♂ /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 1.2)"
	@./bin/kingraph tests/3_born.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 3)"
	@./bin/kingraph tests/4_died.yaml -F dot > /tmp/kingraph-test && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 4)"
	@./bin/kingraph tests/5_born_died.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && grep 1999 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 5)"
	@./bin/kingraph tests/6_born2.yaml -F dot > /tmp/kingraph-test && grep 1966 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 6)"
	@./bin/kingraph tests/7_image.yaml -F dot > /tmp/kingraph-test && grep image2 /tmp/kingraph-test >/dev/null && echo "PASS (Search for Content 7)"

test-compile-to-png: tests/*.yaml examples/*.yml
	@for file in $^ ; do \
		./bin/kingraph "$${file}" -F dot | dot -Tpng -o "$${file}.png" || exit 1 ; \
		echo "PASS (Compiling '$${file}' to PNG)" ; \
		if [ -f "$${file}.expected.png" ]; then \
		  if diff "$${file}.expected.png" "$${file}.png" ; then \
		    echo "PASS (Comparing '$${file}' to expected PNG)" ; \
		  else \
		    echo "FAIL (Comparing '$${file}' to expected PNG)" ; \
			exit 1 ; \
		  fi \
		fi \
	done

test-compile-to-svg: tests/*.yaml examples/*.yml
#issue: images tag not supported by viz.js: https://github.com/mdaines/viz.js/issues/125
#issue: warning message with modern NPM: https://github.com/mdaines/viz.js/issues/96
#issue: links tag not supported: https://gitlab.com/graphviz/graphviz/issues/1408
	@for file in $^ ; do \
		if grep -E "picture:|links:" "$${file}" > /dev/null 2>&1 ; then \
			echo "SKIPPED (Compiling '$${file}' to SVG)" ; \
		else \
			./bin/kingraph "$${file}" -F svg > "$${file}.svg" || exit 1 ; \
			echo "PASS (Compiling '$${file}' to SVG)" ; \
		fi \
	done

test-compile-to-pdf: tests/*.yaml examples/*.yml
	@for file in $^ ; do \
		./bin/kingraph "$${file}" -F dot | dot -Tpdf -o "$${file}.pdf" || exit 1 ; \
		echo "PASS (Compiling '$${file}' to PDF)" ; \
	done
