# Question 1 : Convert minutes into human readable form
 #Example : Input = 130 , Output : 2 hours 10 minutes
 
 minutes = int(input("Enter minutes: "))

hours = minutes // 60
remaining = minutes % 60

if hours == 1:
    print(f"{hours} hour {remaining} minutes")
elif hours > 1:
    print(f"{hours} hours {remaining} minutes")
else:
    print(f"{remaining} minutes")
    
    
