import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset = pd.read_csv(r"C:\Users\bagal\OneDrive\Desktop\DataSets\Emp_sal.csv")

X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values


from sklearn.neighbors import KNeighborsRegressor
knn_reg = KNeighborsRegressor(n_neighbors =3)
knn_reg.fit(X,y)

knn_pred = knn_reg.predict([[6]])
print(knn_pred)

