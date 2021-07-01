dim n as integer
dim difs as integer
screenres 320,200,32
windowtitle "gradiente"
line (0,0)-(320,200),rgb(255,0,255),bf
for n=0 to 200
	line (320/2,200/2)-(0,n),rgb(n,0,n)
next n
difs=320*16
for n=0 to 320
	line (320/2,200/2)-(n,0),rgb(((n*difs)/8192),0,((n*difs)/8192))
next n
for n=0 to 200
	line (320/2,200/2)-(320,n),rgb(200-n,0,200-n)
next n
difs=320*16
for n=0 to 320
	line (320/2,200/2)-(n,200),rgb(200-((n*difs)/8192),0,(200-(n*difs)/8192))
next n

sleep
