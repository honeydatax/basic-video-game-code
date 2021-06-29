dim shared sub1 as sub
public const pink=5
public const rose=5
public const white=15
public const black=0
public const texth=8
public type control
	x as integer
	y as integer
	w as integer
	h as integer
	ww as integer
	hh as integer
	colors as integer
	bcolor as integer
	caption as string
	value as integer
	tag as string
	names as string
	count as integer
	dc as any ptr
	dc2 as any ptr
	on_check as sub(as control)
	on_checks as sub(()as control)
	on_click as sub
	avalue as integer
	redraw as sub(as control)
	redraws as sub(()as control)
	creat as sub ptr
	size as integer
end type 

public type label
	controls as control
end type


public function textSize(s as string)as integer
	return len(s)*8
end function

public sub centerText(c1 as control)
		dim xx as integer
		dim xxx as integer
		xx=textSize(c1.caption)
		if xx<c1.w then
			xxx=(c1.w-xx)/8/2
			c1.caption=space(xxx)+c1.caption
		end if
end sub

public sub rigthText(c1 as control)
		dim xx as integer
		dim xxx as integer
		xx=textSize(c1.caption)
		if xx<c1.w then
			xxx=(c1.w-xx)/8
			xxx=xxx-1
			if xxx<1 then xxx=0
			c1.caption=space(xxx)+c1.caption
		end if
end sub

public sub destroydc(img as any ptr)
	imageDestroy(img)
end sub


public sub imageRedraw(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
		view (c1.x,c1.y)-(c1.x+c1.ww,c1.y+c1.hh)
		window screen (0,0)-(c1.w,c1.h)
	
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			p=(point(xx,yy,c1.dc))
			if p<>0 then line(xx-1,yy-1)-(xx,yy),p,bf
		next
	next
		view (0,0)-(639,479)
		window screen (0,0)-(639,479)
end sub

public sub onimageCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.ww and yy<c1.y+c1.hh then
			c1.on_click()
		end if
	end if
end sub 

public sub imagesCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	bload c1.caption,c1.dc
	c1.on_check=procptr(onimagecheck())
	c1.redraw=procptr(imageRedraw())
end sub

public sub lbtxtRedraw(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	view (c1.x,c1.y)-(c1.x+c1.ww,c1.y+c1.hh)
	window screen (0,0)-(c1.w,c1.h)
	
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			p=(point(xx,yy,c1.dc))
			if p<>0 then line(xx-1,yy-1)-(xx,yy),p,bf
		next
	next
	view (0,0)-(639,479)
	window screen (0,0)-(639,479)
end sub

public sub onlbtxtCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.ww and yy<c1.y+c1.hh then
			c1.on_click()
		end if
	end if
end sub 

public sub lbtxtCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.bcolor,bf
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors,b
	draw string c1.dc,(5,5),c1.caption,c1.colors
	c1.on_check=procptr(onlbtxtcheck())
	c1.redraw=procptr(lbtxtRedraw())
end sub

public sub inputRedraw(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	view (c1.x,c1.y)-(c1.x+c1.ww,c1.y+c1.hh)
	window screen (0,0)-(c1.w,c1.h)
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.bcolor,bf
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors,b
	draw string c1.dc,(5,5),c1.caption+"|",c1.colors
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			p=(point(xx,yy,c1.dc))
			if p<>0 then line(xx-1,yy-1)-(xx,yy),p,bf
		next
	next
	view (0,0)-(639,479)
	window screen (0,0)-(639,479)
end sub

public sub oninputCheck(c1 as control)
	dim keys as integer
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	while keys<>13
		keys=asc(inkey())
		if keys<>0 then
			if keys=8 then
				if len(c1.caption)>0 then c1.caption=mid(c1.caption,1,len(c1.caption)-1)
			else
				c1.caption=c1.caption+chr(keys)
			end if
			c1.redraw(c1)
		end if
	wend
end sub 

public sub inputCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	c1.on_check=procptr(oninputcheck())
	c1.redraw=procptr(inputRedraw())
end sub



public sub txtdrwRedraw(c1 as control)
	put (c1.x,c1.y),c1.dc2,or
end sub

public sub txtdrwCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.ww and yy<c1.y+c1.hh then
			c1.on_click()
		end if
	end if
end sub 

public sub txtdrwCreate(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	dim scalex as integer
	dim scaley as integer
	dim x as integer
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	c1.dc2=imagecreate(c1.ww,c1.hh,0,4)
	scalex=c1.ww/c1.w
	scaley=c1.ww/c1.w
	draw string c1.dc,(5,5),c1.caption,c1.colors
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			p=(point(xx,yy,c1.dc))
			if p<>0 then line c1.dc2,(xx*scalex,yy*scaley)-((xx+1)*scalex,(yy+1)*scaley),p,bf
		next
	next
	for xx=0 to c1.ww step c1.avalue
		line c1.dc2,(xx,0)-(xx,c1.hh),0
	next 
	for yy=0 to c1.hh step c1.avalue
		line c1.dc2,(0,yy)-(c1.ww,yy),0
	next 
	c1.on_check=procptr(txtdrwcheck())
	c1.redraw=procptr(txtdrwRedraw())
end sub







public sub buttonUp()
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	while bb=1
		res=getmouse(xx,yy,,bb)
	wend

end sub 


public sub on_start(colors as integer)
	screenres 640,480,4
	line (0,0)-(640,480),colors,bf
end sub 


