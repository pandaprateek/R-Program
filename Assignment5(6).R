# Assignment 5.6

# Question 1

#Do two simulations of a binomial number with n=100 and p=0.5 .Do you get
#the same results each time? What is different? What is similar?


library(UsingR)

n = 100
p = 0.5
S1 <- rbinom(1000,n,p)
S2 <- rbinom(1000,n,p)
X1 <- (S1 - n*p)/sqrt(n*p*(1-p))
X2 <- (S2 - n*p)/sqrt(n*p*(1-p))
par(mfrow=c(1,2), oma=c(0,0,2,0))

hist(X1, col=gray(.9), prob=T, main="S1")
lines(density(X1, adjust=2), col="red")

hist(X2, col=gray(.9), prob=T, main="S2")
lines(density(X2, adjust=2), col="red")

title("Binomial Simulation Comparison", outer=T)

#output
#S1 and S2 will yield different sets of numbers,
#so their respective density graphs will be different.
#range and shape should be similar.


# Question 2

#Do a simulation of the normal two times. Once with n=10, m1=10 and s1=10,
#the other with n=10, m2=100 and s2=100. How are they different? How are
#they similar? Are both approximately normal?


n = 10
m1 = 10
s1 = 10
m2 = 100
s2 = 100
S1 <- rnorm(10, m1, s1)
S2 <- rnorm(10, m2, s2)
par(mfrow=c(1,2), oma=c(0,0,2,0))

qqnorm(S1, main="S1")
qqline(S1, col="red")

qqnorm(S2, main="S2")
qqline(S2, col="red")

title("Normal Simulation Comparison", outer=T)


# Question 3

#The Bernoulli example is also skewed when p is not 0.5. Do an example
#with n=100 and p=0.25, p=0.05 and p=0.01. Is the data approximately
#normal in each case? The rule of thumb is that it will be approximately
#normal when np>=5 and n(1-p)>=5. Does this hold?


n = 100
f <- function(n=100, p=.5)
{
  S <- rbinom(1,n,p)
  (S - n*p)/sqrt(n*p*(1-p))
}
S1 <- simple.sim(1000,f,n,.25)
S2 <- simple.sim(1000,f,n,.05)
S3 <- simple.sim(1000,f,n,.01)
par(mfrow=c(1,3), oma=c(0,0,2,0))

hist(S1, col=gray(.9), prob=T, main="S1: p=0.25")
lines(density(S1, adjust=2), col="blue")

hist(S2, col=gray(.9), prob=T, main="S2: p=0.05")
lines(density(S2, adjust=2), col="blue")

hist(S3, col=gray(.9), prob=T, main="S3: p=0.01")
lines(density(S3, adjust=2), col="blue")

title("Bernoulli Simulations, p=.25, .05, .01", outer=T)

#output
#yes, you can see that the distribution is 
#approximately normal for S1 and even S2,
#and then it goes south for S3


# Question 4

#The normal plot is a fancy way of checking if the distribution looks
#normal. A more primitive one is to check the rule of thumb that 68% of
#the data is 1 standard deviation from the mean, 95% within 2 standard
#deviations and 99.8% within 3 standard deviations.

#Create 100 random numbers when the Xi are normal with mean 0 and
#standard deviation 1. What percent are within 1 standard deviation of
#the the mean? Two standard deviations, 3 standard deviations? Is your
#data consistent with the normal?


m = 0
s = 1
x <- rnorm(100,m,s)
f <- function(X,k=1,s=1)
{
  sum(-k*s < X & X < k*s)/length(X)
}

f(x,1,s)
f(x,2,s)
f(x,3,s)

#output
#> f(x,1,s)
#[1] 0.71
#> f(x,2,s)
#[1] 0.96
#> f(x,3,s)
#[1] 1


# Question 5

#It is interesting to graph the distribution of the standardized average
#as n increases. Do this when the Xi are uniform on [0; 1]. Look at the
#histogram when n is 1, 5, 10 and 25. Do you see the normal curve taking
#shape?


f <- function(n, a=0, b=1)
{
  m <- (b+a)/2
  s <- (b-a)/sqrt(12)
  (mean(runif(n,a,b))-m)/(s/sqrt(n))
}

X1 <- simple.sim(100,f,1)
X5 <- simple.sim(100,f,5) 
X10 <- simple.sim(100,f,10) 
X25 <- simple.sim(100,f,25)

par(mfrow=c(2,2), oma=c(0,0,2,0))

hist(X1, col=gray(.9), prob=T, main="n=1")
lines(density(X1, adjust=2), col="blue")

hist(X5, col=gray(.9), prob=T, main="n=5")
lines(density(X5, adjust=2), col="red")

hist(X10, col=gray(.9), prob=T, main="n=10")
lines(density(X10, adjust=2), col="forestgreen")

hist(X25, col=gray(.9), prob=T, main="n=25")
lines(density(X25, adjust=2), col="brown")

title("Uniform Dist. Simulations: n=1, 5, 10, 25", outer=T)


# Question 6

#A home movie can be made by automatically showing a sequence of graphs.
#The system function System.sleep can insert a pause between frames. 
#This will show a histogram of the sampling distribution for 
#increasingly large n


f <- function()
{
  for (n in 1:50) {
    results = c()
    mu = 10;sigma = mu
    for (i in 1:200) {
      X = rexp(200,1/mu)
      results[i] = (mean(X)-mu)/(sigma/sqrt(n))
    }
    hist(results, 
         prob=T, 
         col=gray(.9),
         xlim=c(-2, 2),
         ylim=c(0, 4),
         main=paste("Exp distribution: n=", as.character(n), sep=""))
    lines(density(results, adjust=2), col="blue")
    Sys.sleep(1)
  }
}

f()


# Question 7

#Make normal graphs for the following random distributions. Which of
#them (if any) are approximately normal?

#1. rt(100,4)
#2. rt(100,50)
#3. rchisq(100,4)
#4. rchisq(100,50)

par(mfrow=c(2,2), oma=c(0,0,2,0))

R1 <- rt(100,4)
R2 <- rt(100,50)
R3 <- rchisq(100,4)
R4 <- rchisq(100,50)

qqnorm(R1, main="rt(100, 4)")
qqline(R1, col="red")

qqnorm(R2, main="rt(100, 50)")
qqline(R2, col="blue")

qqnorm(R3, main="rchisq(100, 4)")
qqline(R3, col="green")

qqnorm(R4, main="rchisq(100, 50)")
qqline(R4, col="gold")

title("Normal plots: Student's T and Chi-Squared", outer=T)

#output
#only the 1st, 2nd, and 4th distributions look like they could be normal


# Question 8

#The bootstrap technique simulates based on sampling from the data. 
#For example, the following function will find the median of a bootstrap
#sample.

#Let the data be from the built in data set faithful. What does the
#distribution of the bootstrap for the median look like? Is it normal?


data(faithful)

bootstrap <- function(data, n=length(data))
{
  boot.sample <- sample(data, n, replace=T)
  median(boot.sample)
}

S <- simple.sim(100, bootstrap, faithful$eruptions)

par(mfrow=c(1,2), oma=c(0,0,2,0))

qqnorm(S, main="Normal Plot of Sample S")
qqline(S, col="red")

#output
#no, this plot doesn't really look like it could be normal

hist(S, prob=T, col=gray(.9), main="Prob. Distribution of Sample S")
lines(density(S), col="blue")

title("Bootstrap Technique: Sample median from faithful$eruptions",
      outer=T)


# Question 9

#Run the given code. What are the differences? Try, the same experiment with 
#a long tailed distribution such as X=rt(200,2). Is there a difference?
#Explain.


res.median <- c()
res.mean   <- c()

for (i in 1:200) 
{
  X = rnorm(200,0,1)
  res.median[i] <- median(X)
  res.mean[i]   <- mean(X)
}

par(mfrow=c(2,2), oma=c(0,0,2,0))

#  boxplot: rnorm

boxplot(res.mean, res.median, 
        main="rnorm(200, 0, 1)", 
        names=c("mean", "median"),
        col=c("blue", "red"))

#  histogram for comparison: rnorm

x <- rnorm(200,0,1)
hist(x, col=gray(.9), main="rnorm(200,0,1)")
abline(v=mean(x), col="blue", lwd=2, lty=1)
abline(v=median(x), col="red", lwd=2, lty=2)
legend("topleft", 
       c("mean", "median"), 
       col=c("blue", "red"), 
       cex=0.1, 
       lty=1:2)

#  mean: as this considers ALL values in distribution,
#            it is particularly susceptible to the influence
#            of outliers
#  median: prefer median over mean in case of non-normal,
#            skewed distributions

res.median <- c()
res.mean   <- c()

for (i in 1:200) 
{
  X = rt(200,2)
  res.median[i] <- median(X)
  res.mean[i]   <- mean(X)
}

#  boxplot: rt

boxplot(res.mean, res.median, 
        main="rt(200, 2)", 
        names=c("mean", "median"),
        col=c("blue", "red"))

#  histogram for comparison: rt

x <- rt(200,2)
hist(x, col=gray(.9), main="rt(200,2)")
abline(v=mean(x), col="blue", lwd=2, lty=1)
abline(v=median(x), col="red", lwd=2, lty=2)
legend("topright", 
       c("mean", "median"), 
       col=c("blue", "red"), 
       cex=0.1, 
       lty=1:2)

title("Mean and Median: Normal & Long-Tailed Distributions", outer=T)


# Question 10

#Is the mean always better than the median? You may also find that
#side-by-side boxplots of the results of simple.sim are informative.


par(mfrow=c(1,3), oma=c(0,0,2,0))

#first, compare mean/median in a normal distribution

mean.normal   <- function(n=100) mean(rnorm(n,0,1))
median.normal <- function(n=100) median(rnorm(n,0,1))

S.mean.norm    <- simple.sim(100, mean.normal)
S.median.norm  <- simple.sim(100, median.normal)
var(S.mean.norm) / var(S.median.norm)

#output
#[1] 0.7387283

boxplot(S.mean.norm, S.median.norm,
        main="normal",
        names=c("mean", "median"),
        col=c("blue", "red"))

#  next: exponential distribution

mean.exp   <- function(n=100) mean(rexp(n,1/10))
median.exp <- function(n=100) median(rexp(n,1/10))

S.mean.exp    <- simple.sim(100, mean.exp)
S.median.exp  <- simple.sim(100, median.exp)
var(S.mean.exp) / var(S.median.exp)

#output
#[1] 0.6683206

boxplot(S.mean.exp, S.median.exp,
        main="exponential",
        names=c("mean", "median"),
        col=c("blue", "red"))

#  last: t-distribution

mean.t   <- function(n=100) mean(rt(n,2))
median.t <- function(n=100) median(rt(n,2))

S.mean.t    <- simple.sim(100, mean.t)
S.median.t  <- simple.sim(100, median.t)
var(S.mean.t) / var(S.median.t)

#output
#[1] 4.616131

boxplot(S.mean.t, S.median.t,
        main="Student's t",
        names=c("mean", "median"),
        col=c("blue", "red"))

title("Mean and Median: Normal, Exp, & Student's t Distributions", 
      outer=T)