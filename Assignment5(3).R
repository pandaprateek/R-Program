#Section 4: Bivariate Data

#Assignment 5.3

#Question 1

#A student evaluation of a teacher is on a 1-5 Leichert scale. Suppose 
#the answers to the first 3 questions are given in this table.


problem <- data.frame(students=c(1,2,3,4,5,6,7,8,9,10),
           Question_1=c(3,3,3,4,3,4,3,4,3,4),
           Question_2=c(5,2,5,5,2,2,5,5,4,2))
problem

#output
#> problem <- data.frame(students=c(1,2,3,4,5,6,7,8,9,10),
#+            Question_1=c(3,3,3,4,3,4,3,4,3,4),
#+            Question_2=c(5,2,5,5,2,2,5,5,4,2))
#> problem
#students Question_1 Question_2
#1         1          3          5
#2         2          3          2
#3         3          3          5
#4         4          4          5
#5         5          3          2
#6         6          4          2
#7         7          3          5
#8         8          4          5
#9         9          3          4
#10       10          4          2


# I) Make a table of the results of question 1 and question 2 separately.


tab1=table(problem$Question_1)
tab1

plot(tab1, xlab = "labels", ylab = "Frequency", 
     col = "red")

tab2=table(problem$Question_2)
tab2

plot(tab2, xlab = "labels", ylab = "Frequency", 
     col = "red")

#output
#> tab1=table(problem$Question_1)
#> tab1

#3 4 
#6 4 
#> 
#> tab2=table(problem$Question_2)
#> tab2

#2 4 5 
#4 1 5 
 

# II) Make a contingency table of questions 1 and 2.

Question_1= c(3,3,3,4,3,4,3,4,3,4)
Question_2=c(5,2,5,5,2,2,5,5,4,2)
tab=table(Question_1,Question_2)
tab

#output
#> Question_1= c(3,3,3,4,3,4,3,4,3,4)
#> Question_2=c(5,2,5,5,2,2,5,5,4,2)
#> tab=table(Question_1,Question_2)
#> tab
#            Question_2
#Question_1   2 4 5
#          3  2 1 3
#          4  2 0 2


# III) Make a stacked barplot of questions 2 and 3.


Question_2 = c(5,2,5,5,2,2,5,5,4,2)
Question_3 = c(1,3,1,1,1,3,1,1,1,1)

tab3=table(Question_3,Question_2)
tab3

#output 
#> Question_2 = c(5,2,5,5,2,2,5,5,4,2)
#> Question_3 = c(1,3,1,1,1,3,1,1,1,1)
#> 
#> tab3=table(Question_3,Question_2)
#> tab3
#           Question_2
#Question_3   2 4 5
#          1  2 1 5
#          3  2 0 0

barplot(tab3,col= c("darkblue","red"),main= "Students answers in Question
        2 and 3", xlab = "Question_2", ylab = "Question_3")

legend("center",title = "Question_3", fill = c("darkblue","red"),
       c("1","3"))



# IV) Make a side-by-side barplot of all 3 questions.


ta=matrix(c(3,5,1,3,2,3,3,5,1,4,5,1,3,2,1,4,2,3,3,5,1,4,5,1,3,4,1,4,2,1)
          ,ncol = 3,byrow = TRUE)
rownames(ta)= c("1","2","3","4","5","6","7","8","9","10")
colnames(ta)= c("Question_1","Question 2","Question 3")

ta=as.table(ta)
ta

#output
#> ta=matrix(c(3,5,1,3,2,3,3,5,1,4,5,1,3,2,1,4,2,3,3,5,1,4,5,1,3,4,1,4,2,1)
#+           ,ncol = 3,byrow = TRUE)
#> rownames(ta)= c("1","2","3","4","5","6","7","8","9","10")
#> colnames(ta)= c("Question_1","Question 2","Question 3")
#> 
#> ta=as.table(ta)
#> ta
#        Question_1 Question 2 Question 3
#1           3          5          1
#2           3          2          3
#3           3          5          1
#4           4          5          1
#5           3          2          1
#6           4          2          3
#7           3          5          1
#8           4          5          1
#9           3          4          1
#10          4          2          1


barplot(ta,col= c("darkblue","red","green"),main= "Students answers", 
        xlab = "Students", 
        ylab = "Answers",beside = TRUE)

legend("topright",title = "Questions", fill = c("darkblue","red","green")
       ,c("1","2","3"),cex = 0.7)


#Question 2

#In the library MASS is a dataset UScereal which contains information 
#about popular breakfast cereals. Attach the data set as follows


library('MASS')
data('UScereal')
attach(UScereal)
names(UScereal)


# I) The relationship between manufacturer and shelf

input= UScereal[,c('shelf','mfr')]
x=input$mfr
y=input$shelf

ggplot(data = UScereal, aes(x = mfr, y = shelf, fill = mfr)) + 
        geom_boxplot()


# II) The relationship between fat and vitamins


input= UScereal[,c('fat','vitamins')]
x=input$vitamins
y=input$fat


ggplot(data = UScereal, aes(y = fat, x = vitamins, fill = vitamins), 
       main = "fat vs vitamins") + 
        geom_boxplot()


# III) The relationship between fat and shelf


input= UScereal[,c('fat','shelf')]
x=input$fat
y=input$shelf

ggplot(data = UScereal, aes(x = fat, y = shelf), main = "fat vs shelf") + 
        geom_point()


# IV) The relationship between carbohydrates and sugars


input= UScereal[,c('carbo','sugars')]
x=input$carbo
y=input$sugars

ggplot(data = UScereal, aes(y = fat, x = vitamins, fill = vitamins), 
       main = "fat vs vitamins") + 
        geom_boxplot()


# V) The relationship between fibre and manufacturer


input= UScereal[,c('fibre','mfr')]
y=input$fibre
x=input$mfr

ggplot(data = UScereal, aes(x = mfr, y = fibre, fill = mfr)) + 
        geom_boxplot()


# VI)  The relationship between sodium and sugars


input= UScereal[,c('sodium','sugars')]
x=input$sodium
y=input$sugars

ggplot(data = UScereal, aes(x = sodium, y = sugars, fill =sodium), 
       main = "sodium vs sugars") + 
        geom_point()


# Question 3

#The built-in data set mammals contains data on body weight versus brain
#weight. Use the cor to find the Pearson and Spearman correlation
#coefficients. Are they similar? Plot the data using the plot command and
#see if you expect them to be similar. You should be unsatisfied with
#this plot. Next, plot the logarithm (log) of each variable and see if
#that makes a difference.


mammals
x= mammals$body
y= mammals$brain

cor(x,y, method = "pearson")
cor(x,y, method = "spearman")

#output
#> cor(x,y, method = "pearson")
#[1] 0.9341638
#> cor(x,y, method = "spearman")
#[1] 0.9534986
# No they are not similar

plot(x,y, xlab = "body", ylab = "brain", 
     main = "body vs brains", col="brown4")

a=log(mammals$body)
b=log(mammals$brain)

plot(a,b, xlab = "body", ylab = "brain", 
     main = "body vs brains", col="red")


# Question 4
 
#For the data set on housing prices, homedata , investigate the 
#relationship between old assessed value and new.Use old as the predictor
#variable. Does the data suggest a linear relationship?Are there any 
#outliers? What may have caused these outliers? What is the predicted new
#assessed value for a $75,000 house in 1970.


data(package='UsingR', homedata)
attach(homedata)

summary(homedata)

#output

#     y1970            y2000        
# Min.   :     0   Min.   :   7400  
# 1st Qu.: 57000   1st Qu.: 161400  
# Median : 68900   Median : 251700  
# Mean   : 70821   Mean   : 268370  
# 3rd Qu.: 80500   3rd Qu.: 335600  
# Max.   :297200   Max.   :1182800


plot(y1970, y2000,
     main="Home Prices: 1970 & 2000",
     xlab="1970",
     ylab="2000")
lm.c <- lm(y2000 ~ y1970)
abline(lm.c, col="red")

b <- coef(lm.c)[[1]]
b
m <- coef(lm.c)[[2]]
m
predicted.price <- 75000*m + b
predicted.price

#output
#> b <- coef(lm.c)[[1]]
#> b
#[1] -104004.7
#> m <- coef(lm.c)[[2]]
#> m
#[1] 5.257972
#> predicted.price <- 75000*m + b
#> predicted.price
#[1] 290343.2

detach(homedata)



#Question 5

#For the florida dataset of Bush vs. Buchanan, there is another obvious outlier
#that indicated Buchanan received fewer votes than expected. If you remove both
#the outliers, what is the predicted value for the number of votes Buchanan
#would get in Miami-Dade county based on the number of Bush votes?


data(package='UsingR', 'florida')
attach(florida)

names(florida)

#output
# [1] "County"     "GORE"       "BUSH"       "BUCHANAN"   "NADER"     
# [6] "BROWN"      "HAGELIN"    "HARRIS"     "MCREYNOLDS" "MOOREHEAD" 
# [11] "PHILLIPS"   "Total"

library(UsingR)
simple.lm(BUSH,BUCHANAN)

#output
#> simple.lm(BUSH,BUCHANAN)

#Call:
#lm(formula = y ~ x)

#Coefficients:
#(Intercept)    x  
#45.289861     0.004917

BUSH[13]
# [1] 289456

BUCHANAN[13]
# [1] 561

BUSH[50]
# [1] 152846

BUCHANAN[50]
# [1] 3407

df <- florida[(County!='DADE' & County!='PALM BEACH'),]
simple.lm(df$BUSH, df$BUCHANAN, pred=BUSH[50])

#output
#1 
#711.6168 

#Call:
#       lm(formula = y ~ x)

#Coefficients:
#(Intercept)    x  
#38.536279     0.004404 

plot(BUSH, BUCHANAN,
     main="Florida: Bush vs Buchanan",
     xlab="Bush",
     ylab="Buchanan")
abline(lm(BUCHANAN ~ BUSH), 
       col="red", 
       lty=1)
abline(lm(df$BUCHANAN ~ df$BUSH), 
       col="darkblue", 
       lty=2)
legend("topright", 
       c("w/ outliers", "w/o outliers"), 
       text.col=c('red', 'darkblue'), 
       col=c("red", "darkblue"), 
       lty=1:2,
       inset=0.05, 
       cex=0.8)

detach(florida)


# Question 6

#For the data set emissions plot the per-Capita GDP (gross domestic product)
#as a predictor for the response variable CO2 emissions. Identify the outlier
#and find the regression lines with this point, and without this point.


data(package="UsingR", emissions)
attach(emissions)

summary(emissions)
#      GDP            perCapita          CO2        
# Min.   :  59900   Min.   : 2507   Min.   :  54.0  
# 1st Qu.: 123100   1st Qu.:13393   1st Qu.:  77.0  
# Median : 206250   Median :20993   Median : 200.0  
# Mean   : 830427   Mean   :17724   Mean   : 669.4  
# 3rd Qu.: 683500   3rd Qu.:22250   3rd Qu.: 547.5  
# Max.   :8083000   Max.   :29647   Max.   :6750.0 

plot(perCapita, CO2,
     main="Emissions: Per-Capita vs CO2",
     xlab="perCapita",
     ylab="CO2")
abline(lm(CO2 ~ perCapita), 
       col="red", 
       lty=1)

abline(lm(emissions[-1]$CO2 ~ emissions[-1]$perCapita),
       col="darkblue", 
       lty=2)
legend("topleft", 
       c("w/ outlier", "w/o outlier"), 
       text.col=c('red', 'darkblue'), 
       col=c("red", "darkblue"), 
       lty=1:2,
       inset=0.05, 
       cex=0.8)

detach(emissions)


# Question 7

#Attach the data set babies :

data(package="UsingR", babies)
attach(babies)

cor(age, wt1, method="pearson")
cor(age, wt1, method="spearman")

#output
#> cor(age, wt1, method="pearson")
#[1] 0.06273172
#> cor(age, wt1, method="spearman")
#[1] 0.1453316

lm.babies <- lm(wt1 ~ age) 
plot(age, wt1,
     main="Babies: Age vs Weight",
     xlab="Age",
     ylab="Weight")
abline(lm.babies, col="red")

par(mfcol=c(2,1))
plot(lm.babies, which=1)
plot(lm.babies, which=2)

cor(ht, wt1, method="pearson")
cor(ht, wt1, method="spearman")

#output
#> cor(ht, wt1, method="pearson")
#[1] 0.6010033
#> cor(ht, wt1, method="spearman")
#[1] 0.5036179

lm.babies <- lm(wt1 ~ ht)

plot(ht, wt1,
     main="Babies: Height vs Weight",
     xlab="Height",
     ylab="Weight")
abline(lm.babies, col="red")

par(mfcol=c(2,1))
plot(lm.babies, which=1)
plot(lm.babies, which=2)

detach(babies)


# Question 8

#Find a dataset that is a candidate for linear regression (you need two 
#numeric variables, one a predictor and one a response.) Make a 
#scatterplot with regression line using R.


attach(women)
summary(women)

#output
#     height         weight     
# Min.   :58.0   Min.   :115.0  
# 1st Qu.:61.5   1st Qu.:124.5  
# Median :65.0   Median :135.0  
# Mean   :65.0   Mean   :136.7  
# 3rd Qu.:68.5   3rd Qu.:148.0  
# Max.   :72.0   Max.   :164.0  

plot(height, weight,
     main="Women: Height vs Weight",
     xlab="Height",
     ylab="Weight")
abline(lm(weight ~ height), col="red")

detach(women)


# Question 9

#The built-in data set mtcars contains information about cars from a 1974
#Motor Trend issue. Load the data set (data(mtcars)) and try to answer the
#following:


attach(mtcars)


# What are the variable names?

names(mtcars)

#output:
#> names(mtcars)
#[1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" 
#"carb"


# what is the maximum mpg

max(mtcars$mpg)

#output:
#> max(mtcars$mpg)
#[1] 33.9


# Which car has this?

mtcars[mpg==max(mpg),]

#output
#> mtcars[mpg==max(mpg),]
#mpg cyl disp hp drat    wt qsec vs am gear carb
#Toyota Corolla 33.9   4 71.1 65 4.22 1.835 19.9  1  1    4    1

# What are the first 5 cars listed?

head(mtcars,5)

#output
#> head(mtcars,5)
#mpg cyl disp  hp drat    wt  qsec vs am gear carb
#Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2

# What horsepower (hp) does the \Valiant" have?

mtcars['Valiant',]$hp

#output
#> mtcars['Valiant',]$hp
#[1] 105

# What are all the values for the Mercedes 450slc (Merc 450SLC)?

mtcars['Merc 450SLC',]

#output
#> mtcars['Merc 450SLC',]
#            mpg cyl disp  hp  drat  wt qsec vs am gear carb
#Merc 450SLC 15.2 8  275.8 180 3.07 3.78 18   0  0  3    3

#Make a scatterplot of cylinders (cyl) vs. miles per gallon (mpg). Fit a 
#regression line. Is this a good candidate for linear regression?

plot(mtcars$cyl, mtcars$mpg,
     main="4.9 - Cars: cyl vs mpg",
     xlab="Cylinders",
     ylab="MPG")
abline(lm(mtcars$mpg ~ mtcars$cyl), col="red")