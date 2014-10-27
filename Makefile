all: test

test: 
	@cd ./tests/unit/ && \
  haxe build.hxml && \
  neko build/main.n

clean:
	@rm -rf dist
	@rm -rf build
	@rm -rf docs

.PHONY: clean test
