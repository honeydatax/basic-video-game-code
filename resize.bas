#include once "simply.bi"
dim shared title1 as control

public sub onexits2()
	destroydc(title1.dc)
	destroydc(title1.dc2)
	system()
end sub


dim shared redraws as sub(as control)
dim color1 as integer=rose
dim n as integer

screenres 320,200,4
title1.x=0
title1.y=0
title1.w=320
title1.h=200
title1.colors=15
title1.bcolor=5
title1.caption="press enter to resize"
title1.value=0
msgboxCreate title1
title1.redraw(title1)
title1.on_click=procptr(onexits2)

while n<>13
	n=getkeys()
wend
	destroydc(title1.dc)
	destroydc(title1.dc2)

screenres 640,480,4
title1.x=0
title1.y=0
title1.w=640
title1.h=480
title1.colors=15
title1.bcolor=5
title1.caption="press esc to exit"
title1.value=0
msgboxCreate title1
title1.redraw(title1)
title1.on_click=procptr(onexits2)

n=0
while n<>27
	n=getkeys()
wend
	destroydc(title1.dc)
	destroydc(title1.dc2)
