.PHONY: init build-docs clean-docs publish-docs build clean docs publish

init:
	npm install

build-docs:
	node_modules/.bin/docco src/*.coffee

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
	git stash pop || true

build:
	node_modules/.bin/coffee -o lib/ -c src/

clean: clean-docs
	rm -rf lib/ test/*.js

docs: clean-docs build-docs

publish: clean init publish-docs build
	npm publish
