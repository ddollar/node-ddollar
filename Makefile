PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean-docs clean build dist publish

init:
	npm install

docs:
	docco src/*.coffee
	rm -rf /tmp/ddollar-docs
	mv docs /tmp/ddollar-docs
	git add -A
	git stash
	git checkout gh-pages
	mv /tmp/ddollar-docs/* .
	git add -A
	git commit -am 'updating docs'
	git push origin gh-pages
	git checkout master
	git stash pop

clean-docs:
	rm -rf docs/

clean: clean-docs
	rm -rf lib/ test/*.js

build:
	coffee -o lib/ -c src/

dist: clean init docs build

publish: dist
	npm publish
