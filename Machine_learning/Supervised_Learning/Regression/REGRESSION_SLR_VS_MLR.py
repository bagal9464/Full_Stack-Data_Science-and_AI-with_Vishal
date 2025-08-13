# Import Libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score

# Load dataset
dataset = pd.read_csv(r"C:\Users\bagal\OneDrive\Desktop\10th- mlr\MLR\House_data.csv")

# ---------------- SIMPLE LINEAR REGRESSION ----------------
X_simple = dataset[['sqft_living']]  # only one feature
y = dataset['price']

X_train_s, X_test_s, y_train_s, y_test_s = train_test_split(X_simple, y, test_size=1/3, random_state=0)

reg_simple = LinearRegression()
reg_simple.fit(X_train_s, y_train_s)
pred_simple = reg_simple.predict(X_test_s)

r2_simple = r2_score(y_test_s, pred_simple)

# ---------------- MULTIPLE LINEAR REGRESSION ----------------
# Select multiple relevant features
features = ['sqft_living', 'bedrooms', 'bathrooms', 'floors', 'grade', 'sqft_above', 'sqft_basement']
X_multi = dataset[features]

X_train_m, X_test_m, y_train_m, y_test_m = train_test_split(X_multi, y, test_size=1/3, random_state=0)

reg_multi = LinearRegression()
reg_multi.fit(X_train_m, y_train_m)
pred_multi = reg_multi.predict(X_test_m)

r2_multi = r2_score(y_test_m, pred_multi)

# ---------------- RESULTS ----------------
print("R² score - Simple Linear Regression:", round(r2_simple, 4))
print("R² score - Multiple Linear Regression:", round(r2_multi, 4))

# Optional: Plot comparison for Simple Linear Regression
plt.scatter(X_test_s, y_test_s, color='red', label="Actual")
plt.scatter(X_test_s, pred_simple, color='blue', label="Predicted")
plt.title("Simple Linear Regression - sqft_living vs Price")
plt.xlabel("sqft_living")
plt.ylabel("Price")
plt.legend()
plt.show()

#code to plot Predicted vs Actual Prices (best for checking model performance)
import matplotlib.pyplot as plt

# Scatter plot of actual vs predicted
plt.scatter(y_test_m, pred_multi, alpha=0.5, color='blue')
plt.plot([y_test_m.min(), y_test_m.max()], [y_test_m.min(), y_test_m.max()], color='red', linewidth=2)  # ideal fit line
plt.xlabel("Actual Price")
plt.ylabel("Predicted Price")
plt.title("Multiple Linear Regression - Actual vs Predicted")
plt.show()
