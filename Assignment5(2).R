#Assignment 6

#question 1

#x=c(60, 85, 72, 59, 37, 75, 93, 7, 98, 63, 41, 90, 5, 17, 97)

scores=scan()
apropos("steams")
stem(scores)

#output
#scores=scan()
#1: 60 85 72 59 37 75 93 7 98 63 41 90 5 17 97
#16: 
 # Read 15 items
#> apropos("steams")
#character(0)
#> stem(scores)

#The decimal point is 1 digit(s) to the right of the |
  
 # 0 | 577
#2 | 7
#4 | 19
#6 | 0325
#8 | 50378

scores=c(60, 85, 72, 59, 37, 75, 93, 7, 98, 63, 41, 90, 5, 17, 97)
stem(scores)

#output
#The decimal point is 1 digit(s) to the right of the |
  
 # 0 | 577
#2 | 7
#4 | 19
#6 | 0325
#8 | 50378

#Question 2

#The decimal point is 1 digit(s) to the right of the |
 # 8 | 028
#9 | 115578
#10 | 1669
#11 | 01

x=c(80,82,88,91,91,95,95,97,98,101,106,106,109,110,111)
hist(x)

#Question 3

#1st time
x = rnorm(100)
x
hist(x)

#2nd time
x = rnorm(100)
x
hist(x)

#both the time we get different histograms

#Question 4

mtcars
mtcars[1]
hist(mtcars$mpg)
boxplot(mtcars$mpg,horizontal = T)

#output
#symmetric data as it has several initial failures and then rise up.

hist(mtcars$cyl)
boxplot(mtcars$cyl,horizontal = T)

#output
#this data represents outliers
#> mean(mtcars$cyl)
#[1] 6.1875
#> median(mtcars$cyl)
#[1] 6
#> mode(mtcars$cyl)
#[1] "numeric"

hist(mtcars$drat)
boxplot(mtcars$drat,horizontal = T)
boxplot(mtcars[5],horizontal = T)
#output
#skewed data

#Question 5

hist(mtcars$disp)

mean(mtcars$disp)
median(mtcars$disp)
sd(mtcars$disp)

#output
#>mean(mtcars$disp)
#[1] 230.7219
#> median(mtcars$disp)
#[1] 196.3
#> sd(mtcars$disp)
#[1] 123.9387

hist(mtcars$hp)

mean(mtcars$hp)
median(mtcars$hp)
sd(mtcars$hp)

#output
#>mean(mtcars$hp)
#[1] 146.6875
#> median(mtcars$hp)
#[1] 123
#> sd(mtcars$hp)
#[1] 68.56287

hist(mtcars$wt)

mean(mtcars$wt)
median(mtcars$wt)
sd(mtcars$wt)

#output
#> mean(mtcars$wt)
#[1] 3.21725
#> median(mtcars$wt)
#[1] 3.325
#> sd(mtcars$wt)
#[1] 0.9784574

#Question 6

#data=(0 1 0 NA 0 0 0 0 0 1 1 1 0 0 3 0 0 0 0 0 2 0 1)
Oring= scan()
table(Oring)
mean(Oring,na.rm=TRUE)

#output
#> Oring= scan()
#1: 0 1 0 NA 0 0 0 0 0 1 1 1 0 0 3 0 0 0 0 0 2 0 1
#24: 
#  Read 23 items
#> table(Oring)
#Oring
#0  1  2  3 
#15  5  1  1 
#> mean(Oring,na.rm=TRUE)
#[1] 0.4545455