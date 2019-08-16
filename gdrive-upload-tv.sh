#!/bin/bash
# RCLONE UPLOAD CRON TAB SCRIPT

if pidof -o %PPID -x "gdrive-upload-tv.sh"; then
echo "Script is already running. Terminating."
exit 1
fi

LOGFILE="/home/tom/logs/gdrive-upload-tv.log"
FROM="/home/tom/TorrentShare/SonarrDownloads/"
#TO="/home/tom/mnt/gdrive/TV/"
TO="crypt2:/TV"
CONFIG="/home/tom/.config/rclone/rclone.conf"

echo "$(date "+%m.%d.%Y %T") RCLONE UPLOAD STARTED" | tee -a $LOGFILE
# MOVE FILES TO GOOGLE DRIVE
rclone move "$FROM" "$TO" --config=$CONFIG --log-file=$LOGFILE -v --transfers=10 --checkers=3 --no-traverse --tpslimit 3 --drive-chunk-size 32M --ignore-existing --exclude *partial~ --delete-after 
echo "$(date +"%D %T") RCLONE UPLOAD FINISHED" | tee -a $LOGFILE
