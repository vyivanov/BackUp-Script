#!/bin/bash

backup_filename="$(hostname).BackUp.$(date +%F)"
src_dir="/stuff"
dst_dir="/mnt/smb/server/BackUp"

cd ${src_dir}
echo "BackUp Started..."
echo "BackUp Start:" $(date +%c) >> ${backup_filename}.tar.log
echo "TARing Folders..."
tar -cvf ${backup_filename}.tar Eagle-Linux-Setup-Solution/ eclipse-workspace/ FileStore/ projects/ Reading/ Recipes/ >> ${backup_filename}.tar.log
echo "Checking TAR..."
tar -vtf ${backup_filename}.tar >> ${backup_filename}.tar.log
echo "Feeding BackUp Server..."
mv ${backup_filename}.tar ${dst_dir} -v >> ${backup_filename}.tar.log
echo "BackUp End:" $(date +%c) >> ${backup_filename}.tar.log
mv ${backup_filename}.tar.log ${dst_dir}
echo "BackUp Finished."
