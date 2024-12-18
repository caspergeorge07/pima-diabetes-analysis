# locking a sample
set.seed(341) 

library(tidyverse) 

# Read Pima Indians Diabetes Dataset as csv file 

diabetesdata <- read.csv('Pima_Indians_Diabetes_Dataset1.csv') 

# To take stratified random samples 

strata_sample = diabetesdata %>%  
  
  group_by(Target) %>%  
  
  slice_sample(n=200) %>%  
  
  ungroup() 

View(strata_sample) 

# Select you own filename instead of 'your_dataset.csv' for your sample 

write_csv(strata_sample, 'portfoliodata.csv') 
#strata_sample
read_csv('portfoliodata.csv')



# PCA biplot 
diabetesdata <- read_csv('portfoliodata.csv')
diabetes_data_bi = select(diabetesdata,-Target)

pca_diabetesdata = prcomp(diabetes_data_bi, scale.=TRUE) 

summary(pca_diabetesdata) 



# Biplot  

#install.packages("ggfortify") 

library(ggfortify) 

autoplot(pca_diabetesdata,
         
         label=TRUE, label.size=3, shape=FALSE,
         
         loadings=TRUE, loadings.label=TRUE,
         
         data=diabetesdata,  col = 'Target')



# Screeplot 

diabetesdata_var = 100*((pca_diabetesdata$sd)^2)/(sum((pca_diabetesdata$sd)^2)) 

diabetesdata_var 

cumsum(diabetesdata_var) 

ggplot(NULL,aes(x=1:8,y=diabetesdata_var)) + 
  
  geom_col() + 
  
  ggtitle('Scree Plot Pima Indians Diabetes') + 
  
  xlab('Principal Component (PC)') + 
  
  ylab('Percentage Variance ') + 
  
  geom_point() + 
  
  geom_line() 


# Loadings plot PC1-PC3

diabetes_loadings = as.data.frame(pca_diabetesdata$rotation[,1:3]) 
diabetes_loadings

diabetes_loadings$Medical_Data = row.names(diabetes_loadings) 

diabetes_loadings = gather(diabetes_loadings, key='Component', value='Diabetes.Pedigree.Function', -Medical_Data) 

ggplot(diabetes_loadings, aes(x=Medical_Data,y=Diabetes.Pedigree.Function)) + 
  
  geom_bar(stat='identity') + 
  
  facet_grid(Component~.) + 
  
  ggtitle('Loadings for Principle Components') 



  

#biplot for pc2 and pc3 

autoplot(pca_diabetesdata,x=2,y=3, 
         
         label=TRUE, label.size=3, shape=FALSE, 
         
         loadings=TRUE, loadings.label=TRUE, 
         
         data=diabetesdata, colour='Target')  

#INTERPRETATION 

# Note that PC3 == 12.60%, and PC2 == 20.93%, 

#      Remember that the sum of PC1 and PC2 as interpreted in Question 1(a) == 46.29% variance. 

#      Consequently, the sum of [PC1, PC2] and PC3 == 58.89% variance. 





#biplot for pc3 and pc4 

#autoplot(pca_diabetesdata,x=3,y=4, 

#         label=TRUE, label.size=3, shape=FALSE, 

#         loadings=TRUE, loadings.label=TRUE, 

#         data=diabetesdata, colour='Target') 



#Factor Analysis
#install.packages("psych") 
#install.packages("factoextra") 
#install.packages("nFactors") 

library(psych) 

library(factoextra) 

library(nFactors) 





cor(diabetes_data_bi)  


# strongest correlation is between Number of times Pregnant and Age which is 0.530*** as compared to the other combinations. 

# Followed by insulin and TST which is 0.426*** 

#getting the eigen values of the sample dataset 


ev=eigen(cor(diabetes_data_bi)) 

Ns=nScree(x=ev$values) 

plotnScree(Ns, legend = F) 

print(ev$values) 


# Eigen values for all 8 components:  

# 2.0284914 1.6744829 1.0077831 0.9072876 0.8519697 0.7400010 0.4349428 0.3550414 

#next this shows us that there are 3 significant factors. 


fit1=factanal(diabetes_data_bi,3, rotation='none') 

print(fit1,digits=3,cutoff=0, sort=T) 

#next we get the 3 factors and their chi sqaure stat and also p-value 

fit2=factanal(diabetes_data_bi,3, rotation='varimax') 

print(fit2,digits=3,cutoff=0, sort=T) 

fit = fa(diabetes_data_bi, nfactors=3, cutoff=0.5,rotate='varimax') 

library(psych)
psych::smc(diabetes_data_bi)
# The communalities tells us how well each variable is explained by the factors.
# the closer the communality is to 1 the better the variable is explained

#Getting the Kaiser-Meyer-olkin measure
KMO(diabetes_data_bi)
fa.diagram(fit)


library(cluster)
BBB = scale(diabetes_data_bi)
D = dist(BBB, method="euclidean")
cluster_results = agnes(D, method='complete')
# "average", "single", "complete", "ward" these are the different hierarchial clustering methods
plot(cluster_results, which.plots=2,
     main='Cluster of Observation of 8 variables (Euclidean/Complete)', ylab = "Distance")
rect.hclust(cluster_results, k=4, border=2)
clusters = cutree(cluster_results, k=4)


#         3B
BBB = scale(diabetes_data_bi)
D = dist(t(BBB), method="manhattan")
cluster_results = agnes(D, method='ward')
plot(cluster_results, which.plots=2,
     main='Cluster of Observation of 8 variables (manhattan/Ward)', ylab = "Distance")
#rect.hclust(cluster_results, k=5, border=3)
clusters = cutree(cluster_results, k=5)



