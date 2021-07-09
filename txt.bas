#include once "simply.bi"
dim shared txt1 as control

public sub onexits2()
	destroydc(txt1.dc)
	destroydc(txt1.dc2)
	system()
end sub


dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

on_start 5


for n=0 to 10
	txt1.caption=txt1.caption+"hello world" +chr(13)+chr(10)
next

txt1.x=0
txt1.y=0
txt1.w=640
txt1.h=480
txt1.colors=15
txt1.bcolor=5
txt1.value=0
txtCreate txt1
txt1.redraw(txt1)
txt1.on_click=procptr(onexits2)


n=0
while n<>27
	n=getkeys()
wend
	destroydc(txt1.dc)
	destroydc(txt1.dc2)
