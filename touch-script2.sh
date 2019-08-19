#!/bin/sh

#find /home/tom/TorrentShare/RadarrDownloads/ -exec touch {} +
find /home/tom/TorrentShare/RadarrDownloads -cmin -5 '!' -name "*.partial~" -exec touch -c {} +
find /home/tom/TorrentShare/SonarrDownloads -cmin -5 '!' -name "*.partial~" -exec touch -c {} +
