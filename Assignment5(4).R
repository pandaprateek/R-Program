#Section 5: Multivariate Data

#    Assignment 5.4

# Question 1

#For the emissions dataset there is an outlier for the CO2 emissions. Find 
#this value using identify and then redo the plot without this point.

data(package="UsingR", emissions)
attach(emissions)

plot(GDP, CO2,
     main="Emissions, with outlier")

plot(GDP[-1], CO2[-1],
     main="Emissions without outlier")

detach(emissions)


# Question 2

#The Simple data set chips contains data on thickness of integrated chips.
#There are data for two chips, each measured at 4 different places. 
#Create a side-by-side boxplot of the thickness for each place of 
#measurement. (There should be 8 boxplots on the same graph). Do the 
#means look the same? The variances?


data(package="UsingR", chips)

boxplot(chips, main="Chips")

library(UsingR)
simple.densityplot(chips)

#  slight variations on mean, but they all seem to be similar


# Question 3

#The Simple data set chicken contains weights of chickens who are given 
#1 of 3 different food rations. Create a boxplot of all 3 rations. Does 
#there appear to be a difference in mean?


data(package="UsingR", chicken)

boxplot(chicken, main="Chicken")

#  there is a clear difference in the mean


# Question 4

#The Simple data set WeightData contains information on weights for
#children aged 0 to 144 months. Make a side-by-side boxplot of the 
#weights broken down by age in years. What kind of trends do you see?


library(MASS)
data(package="UsingR", kid.weights)

attach(kid.weights)
age.yr = cut(age, seq(0,144,by=12), labels=0:11)

boxplot(weight ~ age.yr, main="Age vs. Weights")

detach(kid.weights)

#  a clear upward trend in weight, with the range increasing as 
#  the child gets older


# Question 5

#The Simple data set carbon contains carbon monoxide levels at 3
#different industrial sites. The data has two variables: a carbon 
#monoxide reading, and a factor variable to keep track of the site. 
#Create side-by-side boxplots of the monoxide levels for each site. 
#Does there appear to be a difference? How so?


data(package='UsingR', carbon)

attach(carbon)

boxplot(Monoxide ~ Site, main="Monoxide by Site")

detach(carbon)

#  Site 2 seems to have clearly higher levels than the
#  other 2, which are both at the same level


# Question 6

#For the data set babies make a pairs plot (pairs(babies)) to investigate
#the relationships between the variables. Which variables seem to have
#a linear relationship? For the variables for birthweight and gestation
#make a scatter plot using different plotting characters (pch) depending
#on the level of the factor smoke.


data(package='UsingR', babies)
attach(babies)
babies
pairs(cbind(id,pluralty,outcome,date,gestation,sex))
pairs(cbind(wt,parity,race,age,ed,ht))
pairs(cbind(wt1,drace,dage,ded,dht,dwt))
pairs(cbind(marital,inc,smoke,time,number))

plot(parity, age, 
     main="Babies: Linear Relations?")
abline(lm(age ~ parity), col='red')

plot(age, dage, 
     main="Babies: Linear Relations?")
abline(lm(dage ~ age), col='red')

plot(wt ~ gestation, 
     main="Babies: gestation vs weight")
rect(par("usr")[1],par("usr")[3],par("usr")[2],par("usr")[4],
     col = "gray")

tmp = levels(factor(smoke))

points(wt ~ gestation, 
       pch=smoke, 
       col=heat.colors(n=length(tmp)))

legend("center",title="Factor: smoke",
       cex=0.8,
       legend=tmp, 
       pch=smoke, 
       col=heat.colors(n=length(tmp)),
       horiz=T)

