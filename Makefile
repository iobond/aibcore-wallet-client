.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	aibcore-wallet-client.min.js

clean:
	rm aibcore-wallet-client.js
	rm aibcore-wallet-client.min.js

aibcore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

aibcore-wallet-client.min.js: aibcore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
