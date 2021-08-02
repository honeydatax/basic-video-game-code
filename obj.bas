#include once "game.bi"
dim shared image1 as control

public sub onexits()
	destroydc(image1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer
dim x as integer
dim y as integer

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
palette 15,255,0,255
image1.on_click=procptr(onexits)

	for y=0 to 480/32
		for x=0 to 640/32
			image1.x=x*32
			image1.y=y*32
			image1.redraw(image1)
		next
	next
		image1.redraw(image1)
sleep
	destroydc(image1.dc)