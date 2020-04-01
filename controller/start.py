import os

def start():
	os.system("screen -d -m -L -S mcs java -Xmx1500M -jar server.jar nogui")
