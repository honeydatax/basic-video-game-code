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


public sub backRedraw(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	line c1.dc,(0,0)-(c1.w,c1.h),c1.bcolor,bf
	for xx=0 to c1.w step c1.avalue
		line c1.dc,(xx,0)-(xx,c1.h),c1.colors
	next
	for yy=0 to c1.h step c1.avalue
		line c1.dc,(0,yy)-(c1.w,yy),c1.colors
	next
	put (c1.x,c1.y),c1.dc,pset
end sub

public sub backCheck(c1 as control)
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

public sub backCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	c1.on_check=procptr(backcheck())
	c1.redraw=procptr(backRedraw())
end sub



public sub msgboxRedraw(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	line c1.dc,(0,0)-(c1.w,c1.h),c1.bcolor,bf
	draw string c1.dc,(1,1),c1.caption,c1.colors
	if c1.value=0 then
		put (c1.x,c1.y),c1.dc,pset
	else
		put (c1.x,c1.y),c1.dc2,pset
	end if
end sub

public sub msgboxCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.w and yy<c1.y+c1.h then
			c1.on_click()
		end if
	end if
end sub 

public sub msgboxCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	c1.dc2=imagecreate(c1.w,c1.h,0,4)
	get (c1.x,c1.y)-(c1.x+c1.w-1,c1.y+c1.h-1),c1.dc2
	c1.on_check=procptr(msgboxCheck())
	c1.redraw=procptr(msgboxRedraw())
end sub



public sub txtRedraw(c1 as control)
	dim n as integer
	dim s as string
	dim ss as string
	dim xx as integer
	dim yy as integer
	dim p as integer
	line c1.dc,(0,0)-(c1.w,c1.h),c1.bcolor,bf
	n=1
	ss=c1.caption
	yy=0
	while n<>0
		n=instr(ss,chr(13)+chr(10))
		s=ss
		if n>0 then
			s=mid(ss,1,n-1)
			ss=mid(ss,n+2)
		end if
		draw string c1.dc,(1,yy),s,c1.colors
		yy=yy+9
	wend
		put (c1.x,c1.y),c1.dc,pset
end sub

public sub txtCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.w and yy<c1.y+c1.h then
			c1.on_click()
		end if
	end if
end sub 

public sub txtCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,0,4)
	c1.on_check=procptr(txtCheck())
	c1.redraw=procptr(txtRedraw())
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


