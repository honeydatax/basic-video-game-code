#include once "control.bi"
dim shared label1 as control

public sub onexits()
	destroydc(label1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start color1

label1.x=10
label1.y=10
label1.w=140
label1.h=30
label1.ww=141
label1.hh=31
label1.colors=white
label1.bcolor=black
label1.caption="hello world..."
lbtxtCreate label1
label1.redraw(label1)
label1.on_click=procptr(onexits)
for n=0 to 16
	label1.redraw(label1)
	label1.on_check(label1)
	label1.ww=label1.ww+(label1.ww/10)
	label1.hh=label1.hh+(label1.hh/10)
	sleep 800
	line (0,0)-(639,479),pink,bf
next

	destroydc(label1.dc)
