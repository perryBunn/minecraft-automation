import os

def warnStop():
	os.system("screen -r mcs -X stuff '/say Server will close in 15 minutes. Please finish task.\n'")
	time.sleep(600)
	os.system("screen -r mcs -X stuff '/say Server closing in 5 minutes.\n'")
	time.sleep(240)
	os.system("screen -r mcs -X stuff '/say Server closing in 60 seconds.\n'")
	time.sleep(60)
	os.system("screen -r mcs -X stuff '/say Server close imminent.\n'")
	time.sleep(5)
	stop()