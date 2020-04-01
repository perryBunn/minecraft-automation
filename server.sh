#!/bin/bash
#
# Performs automation task for miencraft servers.
# File structure should be:
# . src
# ├── server.sh
# ├── server.jar
# ├── ...


#######################################
# Logs input to a daily file and to the console
# Globals:
# 	None
# Arguments:
#	Message
#######################################
logger () {
	# input
	message=$1
	
	now=$(date +%F)

	logFile="./logs/driverlog-${now}.log"
	if ! test -f "$logFile"; then
		touch "$logFile"
	fi
	echo "$message"
	echo "$message" >> "$logFile"
}

#######################################
# Starts the server jar file
# Globals:
# 	None
# Arguments:
#	None
#######################################
startServer() {
	logger "Starting server"
	screen -d -m -L -S mcs java -Xmx1500M -jar server.jar nogui
	logger "Server started"
}

#######################################
# Stops the server jar file
# Globals:
# 	None
# Arguments:
#	None
#######################################
stopServer() {
	screen -r mcs -X stuff '/stop\n'
}

#######################################
# Begins server shutdown process
# Globals:
# 	None
# Arguments:
#	None
#######################################
serverWarnClose() {
	screen -r mcs -X stuff '/say Server will close in 15 minutes. Please finish task.\n'
	sleep 10m
	screen -r mcs -X stuff '/say Server closing in 5 minutes.\n'
	sleep 4m
	screen -r mcs -X stuff '/say Server closing in 60 seconds.\n'
	sleep 1m
	screen -r mcs -X stuff '/say Server close imminent.\n'
	sleep 5
	stopServer
}

#######################################
# Saves server world hourly
# Globals:
# 	None
# Arguments:
#	None
#######################################
saveServer() {
	screen -r mcs -X stuff '/save-all\n'
}

#######################################
# Driver function
# Globals:
# 	None
# Arguments:
#	None
#######################################
main() {
	if ! screen -list | grep -q "mcs" ; then
		logger "Main"
		startServer
		logger "End Main"
	else
		logger "Server already running."
	fi
		
	startTime="08:00"
	stopTime="23:45"
	sleep 5s

	while true ; do

		hourlyTime=$(date +%H:00)
		currentTime=$(date +%H:%M)

		if [[ "$currentTime" = "$startTime" ]]; then
			logger "Starting server"
			screen -d -m -S mcs java -Xmx1500M -jar server.jar nogui
			sleep 60s
			logger "Server started"
		fi

		if [[ "$currentTime" == "$hourlyTime" ]]; then
			logger "Starting saveServer"
			screen -r mcs -X stuff '/say Server backup starting...\n'
			saveServer
			screen -r mcs -X stuff '/say Server backup complete.\n'
			sleep 60s
			logger "End saveServer"
		fi

		if [[ "$currentTime" == "$stopTime" ]]; then
			logger "Starting serverWarnClose"
			serverWarnClose
			sleep 60s
			logger "End serverWarnClose"
		fi
		sleep 59s
	done
}

logger "Script start"
main