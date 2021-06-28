#include once "control.bi"
dim shared image1 as control

public sub onexits()
	destroydc(image1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start color1

image1.x=10
image1.y=10
image1.w=64
image1.h=64
image1.ww=65
image1.hh=65
image1.colors=white
image1.bcolor=pink
image1.caption="cube.bmp"
imagesCreate image1
image1.redraw(image1)
image1.on_click=procptr(onexits)
for n=0 to 16
	image1.redraw(image1)
	image1.on_check(image1)
	image1.ww=image1.ww+(image1.ww/8)
	image1.hh=image1.hh+(image1.hh/8)
	sleep 800
	line (0,0)-(639,479),image1.bcolor,bf
next

	destroydc(image1.dc)
