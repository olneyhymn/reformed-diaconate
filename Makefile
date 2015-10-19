all:
	hugo --verbose

rebuild: clean all

watch:
	hugo --verbose --watch

preview:
	hugo server --verbose --watch

clean:
	rm -rf public

deploy:
	git push heroku master

push:
	git push

pdfs:
	. make_pdfs.sh