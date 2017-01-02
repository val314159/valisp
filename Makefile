all:
	echo try make test
%.js: %.xjs
	perl -npe 's/str\(/JSON.stringify\(/g' $< >$@
	perl -i -npe 's/println/console.log/g' $@
	perl -i -npe 's/@@/function /g' $@
test: xparse.js test_xparse.js
	node test_xparse.js
clean:
	rm -fr *.js
