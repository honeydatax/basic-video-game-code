#include once "control.bi"
dim shared txtxsdrw1 as control

public sub onexits()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start color1

txtxsdrw1.x=10
txtxsdrw1.y=10
txtxsdrw1.w=140
txtxsdrw1.h=30
txtxsdrw1.ww=630
txtxsdrw1.hh=120
txtxsdrw1.colors=white
txtxsdrw1.bcolor=pink
txtxsdrw1.caption="hello world..."
txtxsdrw1.avalue=3
txtdrwCreate txtxsdrw1
txtxsdrw1.redraw(txtxsdrw1)
txtxsdrw1.on_click=procptr(onexits)
	txtxsdrw1.redraw(txtxsdrw1)

sleep 10000
	destroydc(txtxsdrw1.dc)