# MLR_train_save_model.py
import pandas as pd
import numpy as np
import pickle
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Load dataset
dataset = pd.read_csv(r"C:\Users\bagal\OneDrive\Desktop\ML\Simple Liner regression with streamlit\7th- Simple Liner Regression\SLR - House price prediction\House_data.csv")

# Select features
features = ['sqft_living', 'bedrooms', 'bathrooms', 'floors', 'grade', 'sqft_above', 'sqft_basement']
X = dataset[features]
y = dataset['price']

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=1/3, random_state=0)

# Train model
model = LinearRegression()
model.fit(X_train, y_train)

# Save model as pkl
pickle.dump(model, open("MLR_house_price_model.pkl", "wb"))
print("✅ Model saved as house_price_model.pkl")
