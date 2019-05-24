#!/bin/sh
### BEGIN INIT INFO
# Provides:				minidlna
# Required-Start:		$networking
# Required-Stop:
# Default-Start:        2 3 4 5
# Default-Stop:			0 1 6
# Short-Description:	DLNA/UPnP-AV media server
### END INIT INFO

# This service script is used in Enigma2 based set-top boxes (STB).
# Note that the default Start/Stop runlevels above isn't always used.
# This script is for example executed from the OpenPLi DLNAServer plugin.

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/sbin/minidlnad
NAME=MiniDLNA
DESC=DLNA-Server

test -x "$DAEMON" || exit 0

case "$1" in

	start)
		echo -n "Starting ${DESC}: "
		start-stop-daemon -S -x "$DAEMON"
		echo "${NAME}."
		;;

	stop)
		echo -n "Stopping ${DESC}: "
		start-stop-daemon -K -x "$DAEMON"
		echo "${NAME}."
		;;

	restart)
		echo -n "Restarting ${DESC}: "
		start-stop-daemon -K -x "$DAEMON"
		sleep 1
		start-stop-daemon -S -x "$DAEMON"
		echo "${NAME}."
		;;

	reload)
		echo -n "Reloading ${DESC}: "
		start-stop-daemon -K -x "$DAEMON"
		sleep 1
		start-stop-daemon -S -x "$DAEMON" -- -R
		echo "${NAME}."
		;;

	*)
		echo "usage: /etc/init.d/${NAME} {start|stop|restart|reload}" >&2
		exit 1
		;;
esac

exit 0
