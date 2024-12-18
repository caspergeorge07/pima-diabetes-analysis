
#INDIVIDUAL TASK
#install.packages('ISLR')
library(broom)
library(tidyverse)
library(stats)
#install.packages('olsrr')
library(olsrr)
library(ggfortify)
library(psych)
library(factoextra)
library(nFactors)
library(factoextra)
library(cluster)
library(ISLR)
print('Individual Task Part 1')
set.seed(341)

diabetesdata <- read.csv('Pima_Indians_Diabetes_Dataset1.csv') 

# To take stratified random samples 
strata_sample = diabetesdata %>%  
  group_by(Target) %>%  
  slice_sample(n=200) %>%  
  ungroup()

write_csv(strata_sample, 'portfoliodata.csv') 
read_csv('portfoliodata.csv')
diabetesdata <- read_csv('portfoliodata.csv')

diabetes_data_bi = select(diabetesdata,-Target)

#install.packages("GGally")
library(GGally)

ggpairs(diabetesdata, aes(color=diabetesdata$Target))

# from the scatter plot, age and number of times pregnant are somewhat correlated
# with a correlation coefficient of 0.530. In as much as the correlation value is not that high,
# it is the strongest correlation as compared to other variables

# Using the scatterplot we can see that tricep skinfold thickness has the highest correlation 0.194 
# with diabetes pedigree function as compared to others


ggplot(diabetesdata,aes(x=Triceps.skinfold.thickness,y=Diabetes.pedigree.function)) +
  geom_point(aes(colour=Target))

ekwuemedata = diabetes_data_bi
names(ekwuemedata) = c("Times_pregnant", "Plasma_GC", "Diastolic_BP", "Tricep_ST", 
                       "X2HSI", "BMI", "Diabetes_PF", "Age")

colnames(ekwuemedata)


#To get the best predictor linear models of diabetes pedigree function
model = lm(Diabetes_PF~Times_pregnant+Plasma_GC+Diastolic_BP+Tricep_ST + X2HSI + BMI+ Age,data = ekwuemedata)
ols_step_best_subset(model)

# best single predictor model of diabetes pedigree function
model = lm(Diabetes_PF~Tricep_ST, data=ekwuemedata)
summary(model) # R-squared = 0.03779
AIC(model)     # AIC value = 251.4073
a= model$coefficients[1] #(Intercept) 0.3990308
b = model$coefficients[2]# Tricep_ST 0.004077741
print(a)
print(b)

autoplot(model)

# fitted regression model
# Diabetes_PF = 0.399 + 0.004078*Tricep_ST
# the r-square value of 0.03779 only explains 3.8% of the variance of Diabetes pedigree function



print(' 2b ')
# Model 1: best predictor model between Diastolic blood pressure and body mass index of diabetes pedigree function
model_1a = lm(Diabetes_PF~Diastolic_BP+BMI, data=ekwuemedata)
summary(model_1a) # R-squared = 0.03203
AIC(model_1a) # AIC value = 255.7964
a= model_1a$coefficients[1] #(Intercept) 0.2115292
b = model_1a$coefficients[2] #Diastolic_BP 0.0003180339
c = model_1a$coefficients[3] #BMI 0.007620086
print(a)
print(b)
print(c)

#Diabetes_PF = 0.2115 + 0.00032*Diastolic_BP + 0.007620086*BMI
# the r-square value of 0.03203 only explains 3.2% of the variance of Diabetes pedigree function
autoplot(model_1a)

# we can go further from the diagnostic plots
#                         Residuals vs fitted: GOOD
#                         normal Q-Q: GOOD
#                         Scale location: GOOD
#                         Residuals vs Leverage: BAD

# When making regression model, it must meet the assumptions of normality, homoscedastic,
# so that the prediction makes sense.
# Therefore, the data does not have a normal distribution.

# Model 2: best two predictor model of diabetes pedigree function
model2 = lm(Diabetes_PF~Tricep_ST+BMI, data=ekwuemedata)
summary(model2) # R-squared = 0.0494
AIC(model2)     #AIC value = 248.5357
a= model2$coefficients[1] #(Intercept) 0.2497198
b = model2$coefficients[2] # Tricep_ST 0.003061499 
c = model2$coefficients[3] #BMI 0.005186392
print(a)
print(b)
print(c)

#Diabetes_PF = 0.2497 + 0.0031*Tricep_ST + 0.0052*BMI
# the r-square value of 0.03203 only explains 3.2% of the variance of Diabetes pedigree function
autoplot(model2)

# Model 3: best four predictor model of diabetes pedigree function
model3 = lm(Diabetes_PF~Times_pregnant + Plasma_GC + Tricep_ST + BMI, data=ekwuemedata)
summary(model3) # R-squared = 0.05399
AIC(model3)     #AIC value =  250.6179
a = model3$coefficients[1] #(Intercept) 0.2497198
b = model3$coefficients[2] # Times_pregnant -0.004558482
c = model3$coefficients[3] #Plasma_GC 0.0006087658
d = model3$coefficients[4] #Tricep_ST 0.003144331
e = model3$coefficients[5] #BMI 0.004649767
print(a)
print(b)
print(c)
print(d)
print(e)
autoplot(model3)
#
#
# (Zach, 2021), #How to Interpret Diagnostic Plots in R, https://www.statology.org/diagnostic-plots-in-r/


print("Part 3")

# 
