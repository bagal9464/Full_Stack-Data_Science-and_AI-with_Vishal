import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset=pd.read_csv(r"C:\Users\bagal\Downloads\Salary_Data.csv")

x=dataset.iloc[:,:-1]
y=dataset.iloc[:,-1]

from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size=0.20,random_state=0)

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(x_train,y_train)

y_pred = regressor.predict(x_test)

#Compare predicted and actual salaries from the test set
comparison = pd.DataFrame({'Actual':y_test,'Predicted':y_pred})
print(comparison)


# Visualize the test set
plt.scatter(x_test,y_test,color='red')
plt.plot(x_train,regressor.predict(x_train),color='blue')
plt.title('Salary vs Experience(test set)')
plt.xlabel('salary')
plt.ylabel('Experience')
plt.show()

m_slope=regressor.coef_
print(m_slope)

c_intercept = regressor.intercept_
print(c_intercept)

y_12 = (m_slope*12)+ c_intercept
print(y_12)

y_20 = (m_slope*20)+c_intercept
print(y_20)


#discriptev stat
dataset.mean()
dataset['Salary'].mean()

dataset.median()
dataset['Salary'].median()

dataset['Salary'].mode()


#inferetial stat
dataset.var()
dataset['Salary'].var()

dataset['Salary'].std()


# coefficient of variation
from scipy.stats import variation
variation(dataset.values) # this will give comparison variable of entire dataframe

variation(dataset['Salary'] )


#correlation
dataset.corr()

dataset['Salary'].corr(dataset['YearsExperience'])#this will give us correlation betweend the 


#Skewness
dataset.skew()

dataset['Salary'].skew()


#standard Error
dataset.sem()

dataset['Salary'].sem()


#Z-Score
import scipy.stats as stats

dataset.apply(stats.zscore)

stats.zscore(dataset['Salary'])#this will give us Z-score of that particular column


#Degree fo Fredom
a=dataset.shape[0] #this will gives us no.of rows
b=dataset.shape[1] #this will gives us no.of columns

degree_of_freedom = a-b
print(degree_of_freedom)#this wil give us degree of freedom for entire dataset


#Sum of Squares Regresson(SSR)
y_mean = np.mean(y) 

ssr = np.sum((y_pred-y_mean)**2)
print(ssr)


#Sum of Squares Error(SSE)
y=y[0:6]
sse=np.sum((y-y_pred)**2)
print(sse)

sst = ssr + sse
print(sst)


r_square = 1-(ssr/sst)
r_square


bias = regressor.score(x_train,y_train)
print(bias)

variance= regressor.score(x_test,y_test)
print(variance)

from sklearn.metrics import mean_squared_error
train_mse = mean_squared_error(y_train,regressor.predict(x_train))
test_mse = mean_squared_error(y_test,y_pred)

import pickle

#save the trained model to disk
filename = 'linear_regression_model.pkl'

#open a file in write_binary mode and dump the model
with open(filename,'wb') as file:
    pickle.dump(regressor,file)
print('Model has been pickled and saved as linear_regression_model.pkl')

import os 
os.getcwd()