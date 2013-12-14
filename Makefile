PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean-docs clean build dist publish

init:
	npm install

docs: clean-docs build-docs

build-docs:
	docco src/*.coffee

clean-docs:
	rm -rf docs/

publish-docs: docs
	rm -rf /tmp/ddollar-docs
	mv docs /tmp/ddollar-docs
	git add -A
	git stash
	git checkout gh-pages
	rm -rf *
	mv /tmp/ddollar-docs/* .
	git add -A
	git commit -am 'updating docs' --allow-empty
	git push origin gh-pages
	git checkout master
	git stash pop

clean: clean-docs
	rm -rf lib/ test/*.js

build:
	coffee -o lib/ -c src/

dist: clean init docs build

publish: dist publish-docs
	npm publish
