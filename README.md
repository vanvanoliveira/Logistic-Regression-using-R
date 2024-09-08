# Logistic-Regression-using-R

This project aims to predict the likelihood of heart disease using a dataset containing various patient attributes. The analysis leverages logistic regression (a type of generalized linear model) due to the binary nature of the target variable, which indicates the presence (1) or absence (0) of heart disease.

Steps Involved:
Dataset Loading and Preparation:

The dataset is loaded from a CSV file using the read_csv() function.
An 80/20 train-test split is applied to the data to train and validate the model.
Model Selection:

Given the binary nature of the target variable (heart disease: 0 or 1), a Binomial Logistic Regression model is selected.
Significant Variable Identification:

After training the logistic regression model on the training set, a hypothesis test is performed to identify significant variables at a significance level of α=0.05. This involves checking the p-values of the features.
Significant features identified include:
Resting Blood Pressure (trestbps)
Cholesterol Level (chol)
Resting Electrocardiographic Results (restecg)
Maximum Heart Rate Achieved (thalach)
Model Interpretation:

The summary() function is used to inspect the model's coefficients, which helps in understanding the relationship between the features and the likelihood of heart disease.
Model Evaluation:

Although not fully visible in the snippet, it's common to use metrics like accuracy, precision, recall, or AUC-ROC for evaluating logistic regression models on the test data.
Key Takeaways:
This project successfully demonstrates how logistic regression can be applied to medical data for predicting heart disease. It also highlights the importance of feature selection based on statistical significance.
