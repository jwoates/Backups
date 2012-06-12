#!/bin/bash -x
####################################
#
# backup.sh
# nightly backup to USB drive
# testing cloud9IDE editing.
# 
####################################
SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`
RUNNING=`ps -ef | grep 'rsync -av' | grep -v grep`
log_file=$SCRIPTPATH/task.log

if [ -z $RUNNING ]; then

  # update multiple directories
  rsync --delete --exclude-from=$SCRIPTPATH/rsync.exclude -avzR /etc /home/allibubba/ /media/ThunderdomeBKUP/

  echo "System Backup - `date`" > $log_file

fi
