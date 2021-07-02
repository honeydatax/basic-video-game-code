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
	dim p2 as integer
	dim scalex as integer
	dim scaley as integer
	dim x as integer
	c1.dc=imagecreate(c1.w,c1.h,0,32)
	c1.dc2=imagecreate(c1.ww,c1.hh,0,32)
	c1.dc3=imagecreate(c1.ww,c1.hh,0,32)
	scalex=c1.ww/c1.w
	scaley=c1.hh/c1.h
	line c1.dc,(0,0)-(c1.w,c1.h),0,bf
	line c1.dc2,(0,0)-(c1.ww,c1.hh),0,bf
	line c1.dc3,(0,0)-(c1.ww,c1.hh),0,bf
	draw string c1.dc,(1,1),c1.caption,c1.colors
	for yy=c1.h-1 to 0 step -1
		for xx=c1.w-1 to 0 step -1
			p=(point(xx,yy,c1.dc))
			if p<>0 then line c1.dc2,(xx*scalex,yy*scaley)-((xx+1)*scalex,(yy+1)*scaley),p,bf
		next
	next
	line c1.dc3,(0,0)-(c1.ww,c1.hh),0,bf
	for xx=0 to c1.ww step c1.avalue
		line c1.dc3,(xx,0)-(xx,c1.hh),c1.value
	next 
	for yy=0 to c1.hh step c1.avalue
		line c1.dc3,(0,yy)-(c1.ww,yy),c1.value
	next 

	for yy=0 to c1.hh
		for xx=0 to c1.ww
			p=(point(xx,yy,c1.dc2))
			p2=(point(xx,yy,c1.dc3))
			if p<>0 then 
				if p2<>0 then 
					pset c1.dc2,(xx,yy),c1.value
				else
					pset c1.dc2,(xx,yy),p
				end if
			end if
		next
	next
	c1.on_check=procptr(txtdrwcheck())
	c1.redraw=procptr(txtdrwRedraw())
end sub














public sub gradienteRedraw(c1 as control)
	put (c1.x,c1.y),c1.dc,pset
end sub

public sub gradienteCheck(c1 as control)
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

public sub gradienteCreate(c1 as control)
	dim xx as integer
	dim yy as integer
	dim p as integer
	dim p2 as integer
	dim scalex as integer
	dim scaley as integer
	dim x as integer
	c1.dc=imagecreate(c1.w,c1.h,c1.bcolor,32)
	line c1.dc,(0,0)-(c1.w,c1.h),c1.bcolor,bf
	if c1.w<255 then
		scalex=255000/c1.w
	else
		scalex=c1.h*1000/255
	end if
	if c1.h<255 then
		scaley=255000/c1.h
	else
		scaley=c1.h*1000/255
	end if
	for yy=0 to c1.h
		line c1.dc,(0,yy)-(c1.w,yy),rgb(scaley*yy/1000,0,scaley*yy/1000)
	next yy
	c1.on_check=procptr(gradientecheck())
	c1.redraw=procptr(gradienteRedraw())
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
	screenres 320,200,32
	line (0,0)-(320,200),colors,bf
end sub 


