all:
	hugo --verbose

preview:
	hugo server --verbose --watch

clean:
	rm -rf public

deploy:
	git push heroku master

push:
	git push