all: clean
	~/go/bin/hugo --verbose

watch:
	~/go/bin/hugo --verbose --watch

preview:
	~/go/bin/hugo server --verbose --watch

clean:
	rm -rf public

deploy:
	git push heroku master

push:
	git push

pdfs:
	. make_pdfs.sh

archive_pdfs:
	. archive_pdfs.sh