.PHONY: help test_coverage build_coverage open_coverage

# Default target
help:
	@echo "Available targets:"
	@echo "  test_coverage:     Build the test runner with watch for continuous testing"
	@echo "  build_coverage:    Generate and view code coverage report"
	@echo "  open_coverage:     Open the coverage report in the default web browser"

test_coverage:
	flutter test --no-pub --coverage

build_coverage:
	make test_coverage && genhtml coverage/lcov.info -o coverage/html

open_coverage:
	make build_coverage && open coverage/html/index.html
