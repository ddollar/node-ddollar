.PHONY: init build clean docs publish

init:
	npm install

build: init
	node_modules/.bin/coffee -o lib/ -c src/

clean:
	rm -rf lib/ test/*.js

docs: init
	node_modules/.bin/docco -o docs/ src/*.coffee

publish: clean init build docs
	npm publish
