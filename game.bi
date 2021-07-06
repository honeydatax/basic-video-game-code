dim shared sub1 as sub
public const up=18432
public const down=20480
public const lefts=19200
public const rigths=19712
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
	dc3 as any ptr
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
	put (c1.x,c1.y),c1.dc,trans
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

function getkeys()as integer
	dim key as integer
	dim s as string
	s=inkey()
	key=asc(s)
	if s<>"" then 
		if key=255 then
			key=asc(mid(s,2,1))*256
		end if
		return key
	end if
end function


public sub on_start(colors as integer)
	screenres 640,480,4
	line (0,0)-(640,480),colors,bf
end sub 


