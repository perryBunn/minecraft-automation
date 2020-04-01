import controller
from controller import lib
import datetime

def main():
	start = 8 
	stop = 0
	saveInterval = 15
	
	while True:
		now = datetime.datetime.now()

		if controller.time(start, now.hour, stop):
			controller.start()

		if now.minute % saveInterval == 0:
			controller.save()

		if controller.time(stop, now.hour, stop):
			controller.warnStop()


if __name__ == '__main__':
	main()