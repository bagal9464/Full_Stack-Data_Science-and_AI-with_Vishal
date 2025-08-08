import numpy as np                   #   here we import libraries
import pandas as pd                  
import matplotlib.pyplot as plt      

dataset=pd.read_csv(r"C:\Users\bagal\Downloads\Salary_Data.csv")      # and we import data useing csv file 

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




