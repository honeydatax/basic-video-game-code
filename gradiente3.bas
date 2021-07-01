dim n as integer
dim difs as integer
screenres 320,200,32
windowtitle "gradiente"

for n=100 to 1 step -1
	circle (320/2,200/2),n,rgb(100-n,0,100-n),,,,f
next n
sleep
