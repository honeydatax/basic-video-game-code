dim n as integer
dim difs as integer
screenres 320,200,32
windowtitle "gradiente"

for n=100 to 1 step -1
	circle (320/2,200/2),n,rgb(200-(n*2),0,200-(n*2)),,,,f
next n
sleep
