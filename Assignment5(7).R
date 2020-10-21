# Assignment 5.7

# Question 1

#Create 15 random numbers that are normally distributed with mean 10 and 
#s.d. 5. Find a 1-sample z-test at the 95% level. Did it get it right?


library(UsingR)

mu = 10
sd = 5

x <- rnorm(15, mu, sd)

simple.eda(x)

xbar <- mean(x)
se   <- sd/sqrt(length(x))

z <- (xbar - mu) / se
z

#output
#> z
#[1] 0.8779614

#From a standard normal table, we see that this measurement is roughly
#only 2.8% of the population have sample mean this close away from the 
#population mean (10) i.e., this particular 1-sample z test got it right


# Question 2

#Do the above 100 times. Compute what percentage is in a 95% confidence 
#interval.


f <- function() mean(rnorm(15, mean=10, sd=5))
SE <- 5/sqrt(15)
xbar <- simple.sim(100, f)

alpha = 0.1;  zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)
alpha = 0.05; zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)
alpha = 0.01; zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)

#output
#> alpha = 0.1;  zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)
#[1] 89
#> alpha = 0.05; zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)
#[1] 95
#> alpha = 0.01; zstar = qnorm(1-alpha/2); sum(abs(xbar-10) < zstar*SE)
#[1] 99

#It appears that 93% of our samples calculated above are in the 95% 
#confidence interval


# Question 3

#The t-test is just as easy to do. Do a t-test on the same data. Is it
#correct now? Comment on the relationship between the confidence
#intervals.

t.test(x)
t.test(xbar)

#output
#> t.test(x)

#One Sample t-test

#data:  x
#t = 8.8102, df = 14, p-value = 4.379e-07
#alternative hypothesis: true mean is not equal to 0
#95 percent confidence interval:
#  8.214745 13.501397
#sample estimates:
#  mean of x 
#10.85807 

#> t.test(xbar)

#One Sample t-test

#data:  xbar
#t = 72.566, df = 99, p-value < 2.2e-16
#alternative hypothesis: true mean is not equal to 0
#95 percent confidence interval:
#  9.511277 10.046047
#sample estimates:
#  mean of x 
#9.778662


# Question 4

#Find an 80% and 95% confidence interval for the median for the exec.pay
#dataset.


data(package='UsingR', exec.pay)

wilcox.test(exec.pay, conf.int=T, conf.level=.8)
wilcox.test(exec.pay, conf.int=T, conf.level=.95)

#output
#> data(package='UsingR', exec.pay)
#> 
#  > wilcox.test(exec.pay, conf.int=T, conf.level=.8)

#Wilcoxon signed rank test with continuity correction

#data:  exec.pay
#V = 19306, p-value < 2.2e-16
#alternative hypothesis: true location is not equal to 0
#80 percent confidence interval:
#  27.00005 31.49996
#sample estimates:
#  (pseudo)median 
#29.00002 

#> wilcox.test(exec.pay, conf.int=T, conf.level=.95)

#Wilcoxon signed rank test with continuity correction

#data:  exec.pay
#V = 19306, p-value < 2.2e-16
#alternative hypothesis: true location is not equal to 0
#95 percent confidence interval:
#  25.99998 32.99994
#sample estimates:
#  (pseudo)median 
#29.00002 


# Question 5

#For the Simple data set rat do a t-test for mean if the data suggests
#it is appropriate. If not, say why not.

data(package='UsingR', rat)

simple.eda(rat)
t.test(rat)
sd(rat) / sqrt(length(rat))

#output
#> data(package='UsingR', rat)
#> 
#  > simple.eda(rat)
#> t.test(rat)

#One Sample t-test

#data:  rat
#t = 14.176, df = 19, p-value = 1.48e-11
#alternative hypothesis: true mean is not equal to 0
#95 percent confidence interval:
#  96.69997 130.20003
#sample estimates:
#  mean of x 
#113.45 

#> sd(rat) / sqrt(length(rat))
#[1] 8.002787

#we are at 0.956 % accuracy!

# Question 6

#Repeat the previous for the Simple data set puerto (weekly incomes
#of Puerto Ricans in Miami.).

data(package='UsingR', puerto)

simple.eda(puerto)
simple.eda(puerto)
t.test(puerto)

#output
#> data(package='UsingR', puerto)
#> 
#  > simple.eda(puerto)
#> simple.eda(puerto)
#> t.test(puerto)

#One Sample t-test

#data:  puerto
#t = 25.847, df = 49, p-value < 2.2e-16
#alternative hypothesis: true mean is not equal to 0
#95 percent confidence interval:
#  255.9244 299.0756
#sample estimates:
#  mean of x 
#277.5


# Question 7

#The median may be the appropriate measure of center. If so, you might
#want to have a confidence interval for it too. Find a 90% confidence
#interval for the median for the Simple data set malpract (on the size
#of malpractice awards). Comment why this distribution doesn't lend
#itself to the z-test or t-test.


data(package='UsingR', malpract)

simple.eda(malpract)
wilcox.test(malpract, conf.int=T, conf.level=.9)

#output
#> data(package='UsingR', malpract)
#> 
#  > simple.eda(malpract)
#> wilcox.test(malpract, conf.int=T, conf.level=.9)

#Wilcoxon signed rank exact test

#data:  malpract
#V = 153, p-value = 1.526e-05
#alternative hypothesis: true location is not equal to 0
#90 percent confidence interval:
#  385 1325
#sample estimates:
#  (pseudo)median 
#800


# Question 8

#The t-statistic has the t-distribution if the Xi's are normally
#distributed. What if they are not? Investigate the distribution of the
#t-statistic if the Xi's have different distributions. Try short-tailed
#ones (uniform), long-tailed ones (t-distributed to begin with), Uniform
#(exponential or log-normal).


f = function(n=10,p=0.95) {
   y = rnorm(n,mean=0,sd=1+9*rbinom(n,1,1-p))
   t = (mean(y) - 0) / (sqrt(var(y))/sqrt(n))
  }
sample = simple.sim(100,f)

qqplot(sample,rt(100,df=9),main="sample vs. t");qqline(sample)
qqnorm(sample,main="sample vs. normal");qqline(sample)
hist(sample)