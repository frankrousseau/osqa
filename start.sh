#!/bin/bash
set -e
LOGFILE=/home/osqa/logs/website.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=2

# user/group to run as
USER=osqa
GROUP=osqa
cd /home/osqa/osqa/
. virtualenv/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec virtualenv/bin/gunicorn_django -w $NUM_WORKERS \
    --user=$USER --group=$GROUP --log-level=debug \
    --log-file=$LOGFILE 2>>$LOGFILE
