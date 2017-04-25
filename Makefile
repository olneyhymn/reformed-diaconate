all: clean
	# Rebuild pages
	hugo --verbose

preview:
	# Launch local server to preview pages (with auto refresh)
	hugo server --verbose --watch

clean:
	# Delete local build
	rm -rf public

deploy:
	# Deploy site to heroku
	git push heroku master

push:
	# Push to github
	git push

pdfs:
	# Generate PDFs from HTML pages (esp opc.org pages)
	. make_pdfs.sh

archive_pdfs:
	# Archive pdf files from other sites... just in case.
	. archive_pdfs.sh