#Section 6: Random Data

# Assignment 5.5

#Question 1

#Generate 10 random numbers from a uniform distribution on [0,10]. Use R 
#to find the maximum and minimum values.x


x <- runif(10, min=0, max=10)
x

min(x)
max(x)

#output
#> x <- runif(10, min=0, max=10)
#> x
#[1] 9.579925 8.286251 1.192788 2.403410 7.431885 3.157976 3.562254 9.143599
#[9] 2.744015 4.333381
#> 
#> min(x)
#[1] 1.192788
#> max(x)
#[1] 9.579925


# Question 2

#Generate 10 random normal numbers with mean 5 and standard deviation 5
#(normal(5,5)). How many are less than 0?


x <- rnorm(10, mean=5, sd=5)
x

sum(x<0)

#output
#> x <- rnorm(10, mean=5, sd=5)
#> x
#[1]  5.2730258 13.5383871 -0.4718649  3.5535909 16.0370648  7.5937450
#[7] -2.0245897 15.0743224 -0.9407917  5.9519040
#> sum(x<0)
#[1] 3


# Question 3

#Generate 100 random normal numbers with mean 100 and standard deviation
#10. How many are 2 standard deviations from the mean (smaller than 80 or
#bigger than 120)?


m = 100
s = 10
x <- rnorm(100, mean=m, sd=s)

sum(x<m-2*s | x>m+2*s)

#output
#> m = 100
#> s = 10
#> x <- rnorm(100, mean=m, sd=s)
#> sum(x<m-2*s | x>m+2*s)
#[1] 3


# Question 4

#Toss a fair coin 50 times (using R). How many heads do you have?


n = 1
p = 0.5
x <- rbinom(50, n, p)

sum(x==1)

#output
#> n = 1
#> p = 0.5
#> x <- rbinom(50, n, p)
#> 
#> sum(x==1)
#[1] 32


# Question 5

#Roll a \die" 100 times. How many 6's did you see?


x <- sample(1:6, 100, replace=T)

sum(x==6)

#output
#> x <- sample(1:6, 100, replace=T)
#> 
#> sum(x==6)
#[1] 17


# Question 6

#Select 6 numbers from a lottery containing 49 balls. What is the largest
#number? What is the smallest? Answer these using R.


x <- sample(1:49, 6, replace=F)
x

min(x)
max(x)

#output
#> x <- sample(1:49, 6, replace=F)
#> x
#[1] 25 37 21  6 12 24
#> 
#> min(x)
#[1] 6
#> max(x)
#[1] 37


# Question 7

#For normal(0,1), find a number z* solving P(Z<=z*)=.05 (use qnorm).


qnorm(0.05, 0, 1)

#output
#> qnorm(0.05, 0, 1)
#[1] -1.644854


# Question 8

#For normal(0,1), find a number z* solving P(-z*<=Z<=z*)=.05 (use qnorm
#and symmetry).


z <- qnorm(0.525)
z

pnorm(-1*z)

pnorm(z)

#output
#> z <- qnorm(0.525)
#> z
#[1] 0.06270678
#> 
#> pnorm(-1*z)
#[1] 0.475
#> 
#> pnorm(z)
#[1] 0.525


# Question 9

#How much area (probability) is to the right of 1.5 for a normal(0,2)?


pnorm(1.5, 0, 2, lower.tail=F)

#output
#> pnorm(1.5, 0, 2, lower.tail=F)
#[1] 0.2266274


# Question 10

#Make a histogram of 100 exponential numbers with mean 10. Estimate the
#median. Is it more or less than the mean?


x <- rexp(100, 1/10)

hist(x, probability=T, col=gray(0.9), main="6.10 - exponential, mean=10")
curve(dexp(x, 1/10), col="red", add=T)

median(x)

#output
#> x <- rexp(100, 1/10)
#> 
#> hist(x, probability=T, col=gray(0.9), main="6.10 - exponential, mean=10")
#> curve(dexp(x, 1/10), col="red", add=T)
#> 
#> median(x)
#[1] 6.512419


# Question 11

#Can you figure out what this R command does?
#> rnorm(5,mean=0,sd=1:5)


rnorm(5, mean=0, sd=1:5)

#output
#> rnorm(5, mean=0, sd=1:5)
#[1]  0.5725492 -1.9544717 -1.8445412  1.6105403 -2.7506195


# Question 12

#Use R to pick 5 cards from a deck of 52. Did you get a pair or better?
#Repeat until you do. How long did it take?


cards = paste(rep(c("A",2:10,"J","Q","K"),4),c("H","D","S","C"))
cards

sample(cards, 5)
sample(cards, 5)

#output
#> cards = paste(rep(c("A",2:10,"J","Q","K"),4),c("H","D","S","C"))
#> cards
#[1] "A H"  "2 D"  "3 S"  "4 C"  "5 H"  "6 D"  "7 S"  "8 C"  "9 H"  "10 D"
#[11] "J S"  "Q C"  "K H"  "A D"  "2 S"  "3 C"  "4 H"  "5 D"  "6 S"  "7 C" 
#[21] "8 H"  "9 D"  "10 S" "J C"  "Q H"  "K D"  "A S"  "2 C"  "3 H"  "4 D" 
#[31] "5 S"  "6 C"  "7 H"  "8 D"  "9 S"  "10 C" "J H"  "Q D"  "K S"  "A C" 
#[41] "2 H"  "3 D"  "4 S"  "5 C"  "6 H"  "7 D"  "8 S"  "9 C"  "10 H" "J D" 
#[51] "Q S"  "K C" 
#> 
#> sample(cards, 5)
#[1] "6 D"  "7 C"  "5 H"  "K S"  "10 C"
#> sample(cards, 5)
#[1] "9 H"  "10 S" "2 C"  "8 D"  "7 D" 
#> sample(cards, 5)
#[1] "A D"  "10 S" "6 H"  "K H"  "2 C" 
#> sample(cards, 5)
#[1] "Q D"  "Q H"  "9 S"  "7 C"  "10 C"
#  ... it only took 4 tries before getting a pair of queens!