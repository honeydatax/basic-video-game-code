dim n as integer
screenres 320,200,32
line (0,0)-(320,200),rgb(255,0,255),bf
for n=0 to 200
	line (0,n)-(320,n),rgb(n,0,n)
next n
sleep
