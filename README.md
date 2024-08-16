# Car Price Prediction Using Multiple Regression Analysis

## Overview
This project applies multiple regression analysis to predict car prices based on various factors such as car model, engine fuel type, engine specifications, and fuel economy. The study aims to provide valuable insights and tools for market participants in the automotive industry.

## Background
The automotive industry has seen exponential growth over the past decades, with a diverse range of models and types leading to varied attributes and prices. This complexity makes car price prediction a challenge for dealers, buyers, and sellers. This project addresses this challenge using statistical methods, specifically multiple regression analysis.

## Methodology
### Data Collection
Data was collected from Kaggle, an online community of data scientists and machine learning experts.

### Variables
The dataset includes various parameters that could influence car prices:
- Car model (body style)
- Engine fuel type
- Engine specifications (number of cylinders, engine size, horsepower)
- Fuel economy (city and highway MPG)

### Model Specification
The general form of the model specification is:

**Car Price = β0 + β1*(Car Model) + β2*(Type of Engine Fuel) + β3*(Engine Specification) + β4*(Fuel Economy) + ε**

## Results
### Model Estimation
The model was estimated using R Studio, calculating coefficients for independent variables to quantify their impact on car prices.

### Model Evaluation
The model's performance was evaluated using:
- Adjusted R-squared
- F-statistic and its p-value
- Root Mean Square Error (RMSE)
- Scatter plot of predicted vs. observed values

## Conclusion
The study highlights the complex interplay of factors influencing car prices and emphasizes the model's value as a tool for understanding and predicting car prices in the automotive industry. It provides insights that can help buyers and sellers make informed decisions in the car market.

## Future Work
Future research could focus on more complex models or integrate additional variables to further improve prediction accuracy.

## References
- "How to interpret RMSE (simply explained)". (2022, August 24). Stephen Allwright.
- "How to validate a predictive model?" (2019, January 3). aspexit.
