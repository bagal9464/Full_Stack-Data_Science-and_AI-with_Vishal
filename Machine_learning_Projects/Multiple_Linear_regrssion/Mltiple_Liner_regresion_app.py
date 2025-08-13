# app.py
import streamlit as st
import numpy as np
import pickle

# Load saved model
model = pickle.load(open("MLR_house_price_model.pkl", "rb"))

st.title("🏠 House Price Prediction (Multiple Linear Regression)")
st.write("Adjust the sliders to predict house price.")

# Input sliders
sqft_living = st.slider("Living Area (sqft)", 500, 5000, 1500)
bedrooms = st.slider("Bedrooms", 1, 10, 3)
bathrooms = st.slider("Bathrooms", 1, 8, 2)
floors = st.slider("Floors", 1, 4, 1)
grade = st.slider("Grade", 1, 13, 7)
sqft_above = st.slider("Sqft Above Ground", 500, 4000, 1500)
sqft_basement = st.slider("Sqft Basement", 0, 2000, 500)

# Predict button
if st.button("Predict Price"):
    input_data = np.array([[sqft_living, bedrooms, bathrooms, floors, grade, sqft_above, sqft_basement]])
    predicted_price = model.predict(input_data)[0]
    st.success(f"Estimated Price: ₹{predicted_price:,.2f}")
