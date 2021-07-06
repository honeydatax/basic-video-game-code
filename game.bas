#include once "game.bi"
dim shared image1 as control

public sub onexits()
	destroydc(image1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start 15



image1.x=10
image1.y=10
image1.w=24
image1.h=24
image1.ww=24
image1.hh=24
image1.colors=0
image1.bcolor=0
image1.caption="plane.bmp"
imagesCreate image1
image1.redraw(image1)
palette 15,255,0,255
image1.on_click=procptr(onexits)
while n<>27
	n=getkeys()
	if n=up or n=down or n=lefts or n=rigths then
		line (image1.x,image1.y)-(image1.x+24,image1.y+24),15,bf
		if n=up then image1.y=image1.y-8
		if n=down then image1.y=image1.y+8
		if n=lefts then image1.x=image1.x-8
		if n=rigths then image1.x=image1.x+8
		if image1.x>610 then image1.x=610
		if image1.x<0 then image1.x=0
		if image1.y>450 then image1.y=450
		if image1.y<0 then image1.y=0
		image1.redraw(image1)
	end if
wend
	destroydc(image1.dc)
