# replace <newuser> with the user you created above
SRCDS_USER="<newuser>"

# Do not change this path
PATH=/bin:/usr/bin:/sbin:/usr/sbin

# The path to the game you want to host. example = /home/newuser/dod
DIR=/home/<newuser>/orangebox
DAEMON=$DIR/srcds_run

# Change all PARAMS to your needs.
PARAMS="-game tf +map pl_badwater"
NAME=SRCDS
DESC="source dedicated server"

case "$1" in
	start)
		echo "Starting $DESC: $NAME"
		if [ -e $DIR ]; then
			cd $DIR
			su $SRCDS_USER -l -c "screen -d -m -S $NAME $DAEMON $PARAMS"
		else
			echo "No such directory: $DIR!"
		fi
		;;

	stop)
		if screen -ls |grep $NAME; then
			echo -n "Stopping $DESC: $NAME"
			kill `screen -ls |grep $NAME |awk -F . '{print $1}'|awk '{print $1}'`
			echo " ... done."
		else
			echo "Coulnd't find a running $DESC"
		fi
		;;

	restart)
		if screen -ls |grep $NAME; then
			echo -n "Stopping $DESC: $NAME"
			kill `screen -ls |grep $NAME |awk -F . '{print $1}'|awk '{print $1}'`
			echo " ... done."
		else
			echo "Couldn't find a running $DESC"
		fi
		echo -n "Starting $DESC: $NAME"
		cd $DIR
		screen -d -m -S $NAME $DAEMON $PARAMS
		echo " ... done."
		;;

	status)
		# Check whether there's a "srcds" process
		ps aux | grep -v grep | grep srcds_r > /dev/null
		CHECK=$?
		[ $CHECK -eq 0 ] && echo "SRCDS is UP" || echo "SRCDS is DOWN"
		;;

	*)
		echo "Usage: $0 {start|stop|status|restart}"
		exit 1
		;;
esac

exit 0
