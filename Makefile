REPORTER = dot

canary:
	open -a /Applications/Google\ Chrome\ Canary.app --args --allow-file-access-from-files --disable-web-security

clean:
	rm -rf docs
	rm -rf artifacts
	rm -rf www
	rm -rf temp
	rm -rf node_modules

ios:
	cake --config ios.json dev

android:
	cake --config android.json dev

lint:
	./node_modules/.bin/coffeelint -f test/config/coffeelint.json src/coffeescripts/*.coffee

tddClient:
	@NODE_ENV=test ./node_modules/.bin/mocha -b -G -w \
	--compilers coffee:coffee-script \
	--reporter $(REPORTER) test/client

tddServer:
	@NODE_ENV=test ./node_modules/.bin/mocha -b -G -w \
	--compilers coffee:coffee-script \
	--reporter $(REPORTER) test/server

casper:
	casperjs test/functional/casper.coffee

docs:
	rm -rf docs
	./node_modules/.bin/docco src/coffeescripts/*.coffee

.PHONY: test docs ios android deploy tddServer