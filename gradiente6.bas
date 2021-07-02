#include once "control32.bi"
dim shared txtxsdrw1 as control
dim shared gradiante1 as control

public sub onexits()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim difs as integer
dim n as integer
	screenres 640,480,32
	line (0,0)-(320,200),rgb(255,0,255),bf

'on_start(rgb(255,0,255))

gradiante1.x=0
gradiante1.y=0
gradiante1.w=640
gradiante1.h=480
gradiante1.colors=rgb(255,0,255)
gradiante1.bcolor=rgb(255,0,255)
gradienteCreate gradiante1
gradiante1.redraw(gradiante1)
gradiante1.on_click=procptr(onexits)
txtxsdrw1.x=10
txtxsdrw1.y=10
txtxsdrw1.w=120
txtxsdrw1.h=10
txtxsdrw1.ww=640
txtxsdrw1.hh=480
txtxsdrw1.colors=rgb(255,255,255)
txtxsdrw1.bcolor=rgb(255,0,255)
txtxsdrw1.caption="hello world..."
txtxsdrw1.avalue=8
txtxsdrw1.value=rgb(255,0,255)
txtdrwCreate txtxsdrw1
txtxsdrw1.redraw(txtxsdrw1)
txtxsdrw1.on_click=procptr(onexits)
sleep
	destroydc(txtxsdrw1.dc)
