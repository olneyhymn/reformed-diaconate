for url in $(ag --markdown "\"ht.*.pdf" --nofilename --nobreak | cut -d'=' -f2,3,4,5,6); do
    url="${url%\"}"
    url="${url#\"}"
    echo $url
    outFile=$(echo "$url" | cut -d /  -f 5- | tr / _)
    cd "$HOME/repos/reformed-diaconate/static/pdfs/archive" && curl -o $outFile $url
done