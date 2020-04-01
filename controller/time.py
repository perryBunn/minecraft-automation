def time(start, current, end):
	# if start is less than or equal to stop
	# e.g. 8 <= 12
	if start <= end:
		# return if current is inbetween start and end
		return start <= current <= end
	else:
		#return if start is less than or equal current pr if current is less than end
		return start <= current or current < end