#include once "control.bi"
dim shared inputs1 as control

public sub onexits()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start color1

inputs1.x=10
inputs1.y=10
inputs1.w=140
inputs1.h=30
inputs1.ww=630
inputs1.hh=120
inputs1.colors=white
inputs1.bcolor=pink
inputs1.caption=""
inputCreate inputs1
inputs1.redraw(inputs1)
inputs1.on_click=procptr(onexits)
	inputs1.redraw(inputs1)
	inputs1.on_check(inputs1)

	destroydc(inputs1.dc)
