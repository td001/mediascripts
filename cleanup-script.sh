#!/bin/bash
#This script cleans up any empty directories and also deletes logfiles so they don't get too large

if pidof -o %PPID -x “cleanup-script.sh”; then
exit 1
fi

#Variables
LOGFILE="/home/tom/logs/cleanup-script.log"
FROMMOVIE="/home/tom/TorrentShare/RadarrDownloads"
FROMTV="/home/tom/TorrentShare/SonarrDownloads"
start=$(date +'%s')

echo "$(date "+%d.%m.%Y %T") BEGIN CLEANUP" | tee -a $LOGFILE
#Run cleanup
find /home/tom/TorrentShare/RadarrDownloads/* -maxdepth 1 -type d -empty -delete
find /home/tom/TorrentShare/SonarrDownloads/* -maxdepth 1 -type d -empty -delete
find /home/tom/logs -type f \( -name "*.log" \) -size +10M -delete -print
echo "$(date "+%d.%m.%Y %T") CLEANUP FINISHED IN $(($(date +'%s') - $start)) SECONDS" | tee -a $LOGFILE
