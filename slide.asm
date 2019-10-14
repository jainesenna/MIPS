	bne $s3,$s4,Else
	add $s0,$s1,$s2
	j Exit
Else:
	sub $s0,$s1,$s2 
Exit: