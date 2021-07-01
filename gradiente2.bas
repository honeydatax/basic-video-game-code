dim n as integer
dim difs as integer
screenres 320,200,32
windowtitle "gradiente"
line (0,0)-(320,200),rgb(255,0,255),bf
for n=0 to 200
	line (0,0)-(320,n),rgb(n,0,n)
next n
difs=320*16
for n=0 to 320
	line (0,0)-(n,200),rgb((n*difs)/8192,0,(n*difs)/8192)
next n
sleep
