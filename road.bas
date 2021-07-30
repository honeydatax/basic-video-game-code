#include "string.bi"
public const up=18432
public const down=20480
public const lefts=19200
public const rigths=19712
dim shared x as integer
dim shared z as integer
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
public sub startx()
	screenres 640,480,4
	
end sub
public sub backs(xx as integer,zz as integer)
	line(0,0)-(639,479),5,bf
	line(0,0)-(0,479),0
	line(639,0)-(639,479),0
	line(0,479)-(639,479),0
	line(xx,50)-(xx-340,479),0
	line(xx,50)-(xx+340,479),0
	paint(xx,240),0,0
	line(xx,zz)-(xx,479),15,,&b11110000111100001111000011110000
end sub
dim kkey as integer
x=340
z=50
startx
backs(x,z)
kkey=0
while kkey<>27
	sleep 200
	ScreenLock()
	backs(x,z)
	ScreenunLock()
	z=z+5
	if z > 70 then z=50
	kkey=getkeys()
	if kkey=lefts then x=x-5
	if kkey=rigths then x=x+5
	if x<100 then x=100
	if x>540 then x=540
wend
