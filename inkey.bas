dim key as integer
dim s as string
color 15,5
cls
print "!"
while s<>chr(27)
	s=inkey()
	key=asc(s)
	if s<>"" then 
		if key=255 then
			key=asc(mid(s,2,1))*256
		end if
		print key
	end if
wend
