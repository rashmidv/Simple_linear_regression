# Step1 is to set working directory
setwd('C:/Users/rashm/Desktop/ECODERS_Datasets/regression_algorithms/01_simple_linear_regression')
# Step is importing librarires which is already imported  in R language
# step 3 is reading files or dataset csv.excel or text

dataset = read.csv("Salary_Data.csv")
# step 4 spliting the data into train and test set using split() from library called as caTools
#install.packages("caTools")
library(caTools)
# caTools is used to slipt dataset
set.seed(123)
split = sample.split(dataset$Salary , SplitRatio = 2/3)
train_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# step 4 : feature scaling .. we dont need to do it will done automatically by r-lang

#step 5 : building your linear regression model and fitting train_set

regressor = lm(formula = Salary ~ YearsExperience, data = train_set)

# step 6: predicting the result on test data
y_predicted = predict(regressor , newdata = test_set)

y_predicted 
test_set
# step 7 visualising the train_set results using ggplot2 library
#install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x= train_set$YearsExperience , y = train_set$Salary), colour = 'red') + 
  geom_line(aes(x= train_set$YearsExperience , y =  predict(regressor , newdata = train_set)), colour = 'blue') + 
  ggtitle("Salary vs Yearsofexp (Train_set)") +
  xlab("yearsofexp") +
  ylab("Salary")

library(ggplot2)
ggplot() +
  geom_point(aes(x= test_set$YearsExperience , y = test_set$Salary), colour = 'green') + 
  geom_line(aes(x= train_set$YearsExperience , y =  predict(regressor , newdata = train_set)), colour = 'black') + 
  ggtitle("Salary vs Yearsofexp (Test_set)") +
  xlab("yearsofexp") +
  ylab("Salary")


