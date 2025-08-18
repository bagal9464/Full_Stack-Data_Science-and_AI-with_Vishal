import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset = pd.read_csv(r"C:\Users\bagal\OneDrive\Desktop\DataSets\Emp_sal.csv")

X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values

#linear model --- linear algor (degree -1)
from sklearn.linear_model import LinearRegression
lin_reg= LinearRegression()
lin_reg.fit(X,y)

plt.scatter(X,y, color = 'red')
plt.plot(X ,lin_reg.predict(X),color = 'blue')
plt.title('linear regression model (linear Regression)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

lin_model_pred = lin_reg.predict([[6]])
lin_model_pred

#polinomial regression model

from sklearn.preprocessing  import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 5)
X_poly = poly_reg.fit_transform(X)

poly_reg.fit(X_poly,y)

lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, y)

#poly nomial visualization

plt.scatter(X,y, color = 'red')
plt.plot(X,lin_reg_2.predict(poly_reg.fit_transform(X)),color = 'blue')
plt.title('polymodel (polymodel Regression)')
plt.xlabel('Position level')
plt.ylabel('salary')
plt.show()

poly_model_pred = lin_reg_2.predict(poly_reg.fit_transform([[7]]))
poly_model_pred




