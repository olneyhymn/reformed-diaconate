all: clean build push
	# Rebuild pages
	s3cmd sync --acl-public --delete-removed public/ s3://reformeddeacon.com

build:
	hugo --verbose
	sass static/scss/bootstrap.scss:public/_css/bootstrap.css static/scss/bootstrap-grid.scss:public/_css/bootstrap-grid.css static/scss/bootstrap-reboot.scss:public/_css/bootstrap-reboot.scss

scss:
	sass --watch static/scss/bootstrap.scss:static/_css/bootstrap.css static/scss/bootstrap-grid.scss:static/_css/bootstrap-grid.css static/scss/bootstrap-reboot.scss:static/_css/bootstrap-reboot.scss

preview:
	# Launch local server to preview pages (with auto refresh)
	hugo server --verbose --watch

clean:
	# Delete local build
	rm -rf public
	rm -rf static/_css

deploy:
	# Deploy site to heroku
	s3cmd sync --acl-public --delete-removed public/ s3://reformeddeacon.com

push:
	# Push to github
	git push

pdfs:
	# Generate PDFs from HTML pages (esp opc.org pages)
	. make_pdfs.sh

archive_pdfs:
	# Archive pdf files from other sites... just in case.
	. archive_pdfs.sh