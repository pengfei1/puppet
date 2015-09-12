#!/bin/sh

PATH=/sbin:/bin:/usr/sbin:/usr/bin


DAEMON=/usr/hdp/current/hbase-client/bin/hbase-daemon.sh
PIDFILE=/var/run/hbase/hbase-hbase-rest.pid

test -x $DAEMON || exit 5

RUNASUSER=hbase
UGID=$(getent passwd $RUNASUSER | cut -f 3,4 -d:) || true

case $1 in
	start)
        sudo -u $RUNASUSER $DAEMON start rest -p 8090
  		;;
	stop)
        sudo -u $RUNASUSER $DAEMON stop rest
		rm -f $PIDFILE
  		;;
	restart|force-reload)
		$0 stop && sleep 2 && $0 start
  		;;
	try-restart)
		if $0 status >/dev/null; then
			$0 restart
		else
			exit 0
		fi
		;;
	reload)
		exit 3
		;;
	status)
        if [ -r $PIDFILE ]; then
            echo "* HBase Rest Server is running"
            exit 0
        else
            echo "* HBase Rest Server is not running"
            exit 3
        fi
		;;
	*)
		echo "Usage: $0 {start|stop|restart|try-restart|force-reload|status}"
		exit 2
		;;
esac
