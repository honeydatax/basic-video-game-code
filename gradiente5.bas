#include once "control32.bi"
dim shared txtxsdrw1 as control

public sub onexits()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim difs as integer
dim n as integer

screenres 320,200,32
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

txtxsdrw1.x=10
txtxsdrw1.y=10
txtxsdrw1.w=120
txtxsdrw1.h=10
txtxsdrw1.ww=310
txtxsdrw1.hh=190
txtxsdrw1.colors=rgb(255,255,255)
txtxsdrw1.bcolor=rgb(255,0,255)
txtxsdrw1.caption="hello world..."
txtxsdrw1.avalue=8
txtxsdrw1.value=rgb(0,0,255)
txtdrwCreate txtxsdrw1
txtxsdrw1.redraw(txtxsdrw1)
txtxsdrw1.on_click=procptr(onexits)
windowtitle "gradiente"
sleep
	destroydc(txtxsdrw1.dc)
	destroydc(txtxsdrw1.dc2)
	destroydc(txtxsdrw1.dc3)

