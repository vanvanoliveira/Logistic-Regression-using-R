install.packages('MASS')
library(MASS)
library(nnet)
library(readr)
data <- read_csv("Desktop/DATA ANALYTICS/STATISTICS/CA-Two_Statistics/heart.csv")
head(data)




# a) Train the model using 80% of this dataset and suggest an appropriate GLM to model
set.seed(124)
n=nrow(data)
indexes = sample(n,n*(80/100))
train = data[indexes,]
test = data[-indexes,]

#As we can see, our target variable is binary, 0 for those who do not have heart disease and 1 for those who do. 
#For this reason, the GLM model chosen and used is Binominal (Logistic Regression)





# b) Specify the significant variables on the output variable at the level of 𝛼=0.05 and explore the related hypotheses test. Estimate the parameters of your model.
train_glm = glm(as.factor(target)~., data=train, family='binomial')
#train_glm = glm(target~., data=train, family='binomial')
coef(train_glm)

summary(train_glm)
#these are the best features for our model because their p.values are less than 0.05:
#trestbps
#chol
#restecg
#thalach
#oldpeak
#slope


# c) Predict the output of the test dataset using the trained model. Provide the functional form of the optimal predictive model. 

pred = predict(train_glm, test, type='response')
predicted_values= rep(0, length(pred))
predicted_values[pred >0.5] = 1
predicted_values


step.model <- stepAIC(train_glm, trace = FALSE)
pred_red=predict(step.model,test,type='response')
predicted_values_red=rep(0,length(pred_red))
predicted_values_red[pred_red >0.5] = 1
predicted_values_red




# D - Provide the confusion matrix and obtain the probability of correctness of predictions. 
print('Confusion Matrix with predicted values vs actual values')
actual= test$target
c_m = table (predicted_values, actual)
c_m
accuracy_pred=(c_m[1,1]+c_m[2,2])/nrow(test)
accuracy_pred

print('Confusion Matrix with predicted values using stepAIC vs actual values')
c_m2 = table (predicted_values_red, actual)
c_m2
accuracy_pred_red=(c_m2[1,1]+c_m2[2,2])/nrow(test)
accuracy_pred_red

robust_acc=rep(0,2)
robust_acc=robust_acc+(1/10)*c(accuracy_pred,accuracy_pred_red)
robust_acc
