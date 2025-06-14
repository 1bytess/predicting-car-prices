# Predicting Car Prices using Multiple Regression Analysis
This project focuses on predicting the prices of cars based on various features like engine size, horsepower, and fuel type. A multiple linear regression model is developed in R to understand the relationships between these attributes and the final car price.

### 📋 Table of Contents
- [Introduction](#-introduction)
- [File Structure](#-file-structure)
- [Methodology](#️-methodology)
- [Results](#-results)
- [How to Run](#-how-to-run)
- [Conclusion](#-conclusion) 

### 📖 Introduction
The automotive industry offers a wide variety of vehicles with diverse features, making price prediction a complex but interesting challenge. This analysis aims to build a reliable model that can estimate car prices accurately. By using a dataset from Kaggle, we explore which car attributes are significant predictors of price and build a multiple regression model to capture these relationships. 

### 📁 File Structure
Here is the file structure of the project repository..
```
├── README.md
├── data
│   └── car_price.csv
├── plots
├── presentation
│   ├── [Animated] 회귀분석 과제.pptx
│   └── 회귀분석 과제.pptx
├── report
│   └── CJU_회귀분석_2021012800_베네딕터스 에스라.pdf
├── predict_car_prices.R
└── prediction.R
 ```

 ### 🛠️ Methodology
 The analysis was conducted using R and follows the standard data science workflow.
 1. **Data Collection**: The dataset used is the "Car Price Prediction" dataset from Kaggle, containing 205 observations and 26 features.
 2. **Data Preprocessing**:
 - Relevant variables for the model were selected, including `fueltype`, `carbody`, `drivewheel`, `cylindernumber`, `enginesize`, `horsepower`, `citympg`, `highwaympg`, and `price`.
 - Categorical variables were converted into factor types, and numerical variables were ensured to be in the correct format.
 3. **Exploratory Data Analysis (EDA)**:
 - Visualizations were created using `ggplot2` to understand the distribution of data and the relationships between variables. For example, bar charts were used to compare the average prices for different drive wheel types.
 4. **Modeling**:
 - A multiple linear regression model was built using the `lm()` function in R.The dataset was split into a training set (70%) and a testing set (30%) to train and evaluate the model.The formula used for the model was: `price ~ .`, indicating that price is the dependent variable predicted by all other selected features. 
 
 ### 📈 Results
 The model's performance was evaluated using several statistical metrics and visualizations.
 - **Model Summary**: The summary of the regression model provided insights into which features were statistically significant in predicting the car price.
 - **Prediction Accuracy**: The model was tested on the unseen test data. The predictions were then compared against the actual prices. The Root Mean Square Error (RMSE) was approximately **$3,433.87**, which indicates the average deviation of the predictions from the actual values.Visual 
 - **Validation**: A scatter plot of predicted prices versus actual prices was created to visually inspect the model's performance. The points clustered around the 45-degree line, suggesting a reasonably good fit. 
 
 ### 🚀 How to Run
 To replicate the analysis, follow these steps:
 1. Clone the repository:
 ```
 git clone https://github.com/1bytess/predicting-car-prices.git
 ```
2. Install necessary packages in R:
```
install.packages("dplyr")
install.packages("ggplot2")
```
3. Run the script:
- Open the `predict_car_prices.R` file in RStudio or your preferred R environment.
- Make sure the `car_price.csv` file is correctly located in the data subfolder.
- Execute the script. The script will perform the data processing, modeling, and generate predictions. 

### ✨ Conclusion
This project successfully demonstrates the application of multiple linear regression for predicting car prices. The model shows an acceptable level of accuracy, confirming that features like engine size, horsepower, and car body type are strong indicators of price. Future work could involve exploring more advanced regression techniques or feature engineering to further improve the model's predictive power.