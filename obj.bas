public const w=24
public const h=24
public sub startx()
	screenres 640,350,4
end sub
public sub draws (x as integer,y as integer,Image As Any Ptr) 
	put (x*w,y*h),Image
end sub

dim x as integer
dim y as integer
Dim myImage As Any Ptr = ImageCreate( w, h)
startx
BLoad "plane.bmp", myImage
palette 15,200,0,200
line (0,0)-(639,349),15,bf
for y=0 to 350/24
	for x=0 to 640/24
		'draws x,y,myImage
	next
next

sleep
ImageDestroy( myImage )
end 0
