#No:2.1 
miles=c(65311,65624,65908,66219,66499,66821,67145,67447)				#enters fill-ups into R

x=diff(miles) 									#gives the number of miles between fill-ups.

x																#Print out the value

#o/p-[1] 313 284 311 280 322 324 302


#No:2.2

commutes=c(17,16,20,24,22,15,21,15,17,22)	#enters commute times into R

max(commutes)															#find the longest commute time

#o/p-[1] 24

mean(commutes)															#find the average

#o/p-[1] 18.9

min(commutes)															#find the minimum

#o/p-[1] 15

commutes[4]=18															#Replace 24 by 18

commutes																	#Print out the new vector

#o/p- [1] 17 16 20 18 22 15 21 15 17 22

mean(commutes)														#find the new average

#o/p-[1] 18.3

sum(commutes>=20)							#How many times was your commute 20 minutes or more

#o/p-[1] 4

#We found that for 4 times commute is 20 minutes or more

(sum(commutes<17)*100)/length(commutes) #percentage of commutes that are less than 17

#o/p-[1] 30


#No:2.3

bill=c(46,33,39,37,46,30,48,32,49,35,30,48)		#enters cell phone bill into vector bill

sum(bill)										# find the total amount spent this year on the cell phone

#o/p-[1] 473

min(bill)										#find the smallest amount spent in a month

#o/p-[1] 30

max(bill)										#find the largest amount spent in a month

#o/p-[1] 49

sum(bill>40)															#How many months was the amount greater than $40								

#o/p-[1] 5

(sum(bill>40)*100)/length(bill)										#percentage of  months was the amount greater than $40

#o/p-[1] 41.66667


#No:2.4

car=c(9000,9500,9400,9400,10000,9500,10300,10200)		#Enter prices to vector car

sum(car)/length(car)													#average using sum()

#o/p-[1] 9662.5

(sum(car)/length(car))-car[2]           #comparing average value with Edmund's estimate of 9500

#o/p-[1] 162.5                         #average value is higher than Edmund's estimate of 9500 

min(car)																#Find minimum value	

#o/p-[1] 9000

max(car)																#Find maximum value	

#o/p-[1] 10300


#No:2.5

x=c(1,3,5,7,9)

y=c(2,3,5,7,11,13)

x+1																	#Adds 1 to each value of X

#o/p-[1]  2  4  6  8 10

y*2																	#Multiplies 2 to each value of y

#o/p-[1]  4  6 10 14 22 26

length(x)													#How many elements are there in vector x

#o/p-[1] 5

length(y)																#How many elements are there in vector Y

#o/p-[1] 6

x+y                             #Adds X and Y (with corresponding values)

#o/p-[1]  3  6 10 14 20 14

sum(x>5)												#How many numbers are there which are greater than 5

#o/p-[1] 2

sum(x[x>5])															#Add numbers which are greater than 5

#o/p-[1] 16

sum(x>5|x<3)															#How many numbers are there which are greater than 5 or less than 3

#o/p-[1] 3

y[3]																	#Print out value of 3rd index of Y Vector

#o/p-[1] 5

y[-3]                            #Print all values of Y except value of 3rd index

#o/p-[1]  2  3  7 11 13

y[x]                            #Print  values of Y by taking x values as index

#o/p-[1]  2  5 11 NA NA         #NA means value is not available in that index

y[y>=7]																#Print values of Y vector which are greater than or equal to 7

#o/p-[1]  7 11 13

#No:2.6

x=c(1,8,2,6,3,8,5,5,5,5)												#enters values into vector x

sum(x)/10

#o/p-[1] 4.8

log10(x)																				#print log10(Xi) for each i																				

#o/p-[1] 0.0000000 0.9030900 0.3010300 0.7781513 0.4771213 0.9030900 0.6989700 0.6989700

#o/p-[9] 0.6989700 0.6989700

(x-4.4)/2.875

#o/p-[1] -1.1826087  1.2521739 -0.8347826  0.5565217 -0.4869565  1.2521739  0.2086957

#o/p-[8]  0.2086957  0.2086957  0.2086957

max(x)-min(x)														#find the difference between the largest and smallest values of x

#o/p-[1] 7

diff(range(x)	)													#find the difference between the largest and smallest values of x using built in function

#o/p-[1] 7