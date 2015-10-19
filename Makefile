all:
	hugo --verbose

rebuild: clean all

preview:
	hugo server --verbose --watch

clean:
	rm -rf public

deploy:
	git push heroku master

push:
	git push