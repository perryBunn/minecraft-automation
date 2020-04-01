import subprocess

def run(command):
	cmd = parse(command)
	output = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()[0]
	return output

def parse(string):
	return string.split(" ")