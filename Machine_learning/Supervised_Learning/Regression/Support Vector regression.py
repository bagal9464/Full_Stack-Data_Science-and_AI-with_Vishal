import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset = pd.read_csv(r"C:\Users\bagal\OneDrive\Desktop\DataSets\Emp_sal.csv")

X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values

from sklearn.svm import SVR

svr_reg = SVR(kernel = 'sigmoid',degree=5,gamma ='scale')
svr_reg.fit(X,y)

svr_pred = svr_reg.predict([[6]])
print(svr_pred)
