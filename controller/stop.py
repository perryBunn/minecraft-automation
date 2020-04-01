import os

def stop():
	os.system("screen -r mcs -X stuff '/stop\n'")