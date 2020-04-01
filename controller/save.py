import os

def save():
	os.system("screen -r mcs -X stuff '/save-all\n'")