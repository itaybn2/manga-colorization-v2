#!/bin/bash

base_url="https://cdn.readberserk.com/file/AnimeRleases/Berserk"
chapter=84

while true; do
    chapter_dir="Chapter_$chapter"
    mkdir -p "$chapter_dir"

    page=1
    download_complete=false
    while true; do
        url="${base_url}_${chapter}_$(printf "%03d" $page).jpg"
        response_code=$(curl -s -o "$chapter_dir/$(basename $url | sed 's/b/B/g')" -w "%{http_code}" $url)

        if [ $response_code -eq 404 ]; then
            rm "$chapter_dir/$(basename $url)"
            if [ $page -eq 1 ]; then
                rmdir "$chapter_dir"
                download_complete=true
            fi
            break
        fi

        if [ $response_code -eq 200 ]; then
            echo "Downloading $url to $chapter_dir"
        fi

        ((page++))
    done

    if [ "$download_complete" = true ]; then
        break
    fi

    ((chapter++))
done

echo "Download complete!"
