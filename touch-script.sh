#!/bin/bash

#Movies
find /home/tom/TorrentShare/RadarrDownloads/ -exec touch -c '{}' +

#TV
#find /home/tom/TorrentShare/SonarrDownloads/ -exec touch -c '{}' +


inotifywait -m /home/tom/TorrentShare/RadarrDownloads -e create -e moved_to |
    while read path action file; do
        -exec touch -c '{}' +
    done
