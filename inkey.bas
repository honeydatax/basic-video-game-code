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
dim key as integer
color 15,5
cls
while key<>27
	key=getkeys()
	if key<>0 then 
		print key
	end if
wend
