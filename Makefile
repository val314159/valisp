all:
	echo try make test
%.js: %.xjs
	perl -npe 's/str\(/JSON.stringify\(/g' $< >$@
	perl -i -npe 's/println/console.log/g' $@
	perl -i -npe 's/@@/function /g' $@
test: xparse.js test_xparse.js xprint.js
	node test_xparse.js
repl: xrepl.js xparse.js xprint.js xcompile.js
	node xrepl.js
test2: xrepl.js xparse.js xprint.js xcompile.js
	echo '11 qq null 22 true (console.log "qwert") (if 1 2 3) 44 false' | make repl
clean:
	rm -fr *.js
