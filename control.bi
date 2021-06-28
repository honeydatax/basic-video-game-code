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
	view (c1.x,c1.y)-(c1.x+c1.ww,c1.y+c1.hh),c1.bcolor
	window screen (0,0)-(c1.w,c1.h)
	
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			line(xx-1,yy-1)-(xx,yy),(point(xx,yy,c1.dc)),bf
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
	c1.dc=imagecreate(c1.w,c1.h)
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.bcolor,bf
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors,b
	draw string c1.dc,(5,5),c1.caption,c1.colors
	c1.on_check=procptr(onlbtxtcheck())
	c1.redraw=procptr(lbtxtRedraw())
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


