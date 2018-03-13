	
def tobinary (n , width ) :
	s = ''
	for i in range ( width ) :
		s = s + str ( n %2)
		n = n /2
	s = s [:: -1]
	return s
def add16bits (s):
	count =0
	for i in range(8):
		if s[i] == '1' :
			count +=1
	return tobinary(count,4)
f = open ( 'tracefile.txt' , 'w')
f . seek (0)
f . truncate ()
for i in range (256) :
	x = tobinary (i ,8)
	s=add16bits (x)

	f.write(x+" "+s +" 1111"+"\n")
f.close()		