#include once "simply.bi"
dim shared wallpaper1 as control

public sub onexits()
	destroydc(wallpaper1.dc)
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
while n<>27
	n=getkeys()
wend
	destroydc(wallpaper1.dc)
