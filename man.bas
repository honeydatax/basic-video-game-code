public const up=18432
public const down=20480
public const lefts=19200
public const rigths=19712
dim shared goldsx(0 to 8) as integer
dim shared goldsy(0 to 8) as integer
dim shared x as integer
dim shared y as integer
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
	color 0,5
	cls
end sub

dim i as integer
dim kkey as integer
startx
for i=0 to 8
	goldsx(i)=int(rnd*78)
	goldsy(i)=int(rnd*20)
	locate goldsy(i),goldsx(i),0
	print "*"
next i
	x=int(rnd*78)
	y=int(rnd*20)
	locate y,x,0
	print "X"
kkey=0
while kkey<>27
	kkey=getkeys()
	if kkey<>0 then
		locate y,x,0
		print " "
		if kkey=lefts then x=x-1
		if kkey=rigths then x=x+1
		if kkey=up then y=y-1
		if kkey=down then y=y+1
		if x<1 then x=1
		if x>78 then x=78
		if y<1 then y=1
		if y>20 then y=20
		locate y,x,0
		print "X"
		sleep 200
	end if
wend


