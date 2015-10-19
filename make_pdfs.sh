for url in $(ag --markdown "source_url =" --nofilename | cut -d'=' -f2,3,4,5,6 | grep .html); do
    url="${url%\"}"
    url="${url#\"}"
    echo $url
    stripped=$(echo $url | tr -d '[:punct:]')
    echo $stripped
    wkhtmltopdf $url ./static/pdfs/$stripped.pdf
done