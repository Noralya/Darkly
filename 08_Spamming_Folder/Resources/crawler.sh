#!/bin/bash

base="http://192.168.56.101//.hidden/"
visited_file="/tmp/visited_urls.txt"
> "$visited_file"   # reset fichier

normalize_url() {
    local url=$1
    url=${url//\/\//\/}  # Supprime les doubles slashes
    echo "$url"
}

crawl() {
    local url=$1
    url=$(normalize_url "$url")

    # Vérifie si déjà visité
    if grep -qx "$url" "$visited_file"; then
        return
    fi
    echo "$url" >> "$visited_file"

    # Récupère tous les liens
    links=$(curl -s "$url" | grep -oP '(?<=href=")[^"]+' | sort -r)
    for link in $links; do
        # Ignore les liens de navigation et les liens absolus hors domaine
        if [[ $link == "README" ]]; then
            curl -s "$url$link" | grep "flag"
        elif [[ $link =~ ^http:// || $link =~ ^https:// ]]; then
            continue  # Ignore les liens absolus hors domaine
        elif [[ $link == "../" || $link == "./" ]]; then
            continue
        else
            # Construit l'URL correctement
            local new_url
            if [[ $link == /* ]]; then
                new_url="http://192.168.56.101$link"
            else
                new_url="${url%/}/$link"
            fi
            new_url=$(normalize_url "$new_url")
            crawl "$new_url"
        fi
    done
}

crawl "$base"
