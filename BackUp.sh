#!/bin/bash

backup_filename="$(hostname).BackUp.$(date +%F).tar"
src_dir="/stuff"
dst_dir="/mnt/smb/server/BackUp/$(hostname)"

current_backup=`ls ${dst_dir} | grep ^$(hostname).BackUp.20[1-9][0-9]-[0-1][0-9]-[0-3][0-9].tar$`

cd ${src_dir}

echo "BackUp Started..."
echo "BackUp Start:" $(date +%c) >> ${backup_filename}.log

echo "TARing Folders..."
tar -cvf ${backup_filename} BackUp-Script/ CV/ Eagle-Linux-Setup-Solution/ eclipse-workspace/ FileStore/ projects/ Reading/ Recipes/ KeePassDB.BackUp.2012-08-13.kdbx >> ${backup_filename}.log

echo "Checking TAR..."
tar -vtf ${backup_filename} >> ${backup_filename}.log

echo "Feeding BackUp Server..."
mv ${backup_filename} ${dst_dir} > /dev/null

echo "Deleted BackUp file: ${current_backup}" >> ${backup_filename}.log
rm "${dst_dir}/${current_backup}"
rm "${dst_dir}/${current_backup}.log"

echo "BackUp End:" $(date +%c) >> ${backup_filename}.log
mv ${backup_filename}.log ${dst_dir} > /dev/null

echo "BackUp Finished."