#include once "simply.bi"
dim shared wallpaper1 as control
dim shared msgbox1 as control

public sub onexits()
	destroydc(wallpaper1.dc)
	destroydc(msgbox1.dc)
	destroydc(msgbox1.dc2)
	system()
end sub

public sub onexits2()
	destroydc(wallpaper1.dc)
	destroydc(msgbox1.dc)
	destroydc(msgbox1.dc2)
	system()
end sub


dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start 5



wallpaper1.x=0
wallpaper1.y=0
wallpaper1.w=640
wallpaper1.h=480
wallpaper1.ww=640
wallpaper1.hh=480
wallpaper1.colors=0
wallpaper1.bcolor=5
wallpaper1.caption=""
wallpaper1.avalue=8
backCreate wallpaper1
wallpaper1.redraw(wallpaper1)
wallpaper1.on_click=procptr(onexits)



msgbox1.x=50
msgbox1.y=50
msgbox1.w=160
msgbox1.h=50
msgbox1.ww=160
msgbox1.hh=50
msgbox1.colors=15
msgbox1.bcolor=5
msgbox1.caption="press enter to exit msgbox"
msgbox1.value=0
msgboxCreate msgbox1
msgbox1.redraw(msgbox1)
msgbox1.on_click=procptr(onexits2)

while n<>13
	n=getkeys()
wend
msgbox1.value=1
msgbox1.redraw(msgbox1)
n=0
while n<>27
	n=getkeys()
wend
	destroydc(wallpaper1.dc)
	destroydc(msgbox1.dc)
	destroydc(msgbox1.dc2)
