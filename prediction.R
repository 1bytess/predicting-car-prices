#===== Data Preparation =====

#Packages Load
library(dplyr)
library(ggplot2)
library(psych)

#Data Load (kaggle.com/datasets/hellbuoy/car-price-prediction)
data <- read.csv("C:/Users/ezrah/Documents/[회귀분석 과제]/data/car_price.csv")
str(data)

#===== Data Pre-Processing ======

#Extracting Independent Variables
Refined_data <- data[c("fueltype", "carbody", "drivewheel", "cylindernumber", "enginesize",  "horsepower", "citympg", "highwaympg", "price")]
str(Refined_data)

#Changing Variable Value to Numerical
table(Refined_data$cylindernumber)
Refined_data$cylindernumber <- recode(Refined_data$cylindernumber,
                              "two" = 2,
                              "three" = 3,
                              "four" = 4,
                              "five" = 5,
                              "six" = 6,
                              "eight" = 8,
                              "twelve" = 12)
#Changing Discrete to factor
Refined_data$fueltype <- as.factor(Refined_data$fueltype)
Refined_data$carbody <- as.factor(Refined_data$carbody)
Refined_data$drivewheel <- as.factor(Refined_data$drivewheel)
Refined_data$cylindernumber <- as.numeric(Refined_data$cylindernumber)

#===== Descriptive Statistics =====

summary(Refined_data)
pairs.panels(Refined_data)

#===== Regression Analysis to Predict Prices =====

#Split Data
set.seed(1712)
S <- sample(1:nrow(Refined_data), (nrow(Refined_data)*0.7))
train_data <- Refined_data[S,]
test_data <- Refined_data[-S,]

#Model Building
model <- lm(price ~., data = train_data)
summary(model)

#Data Validation
predicted <- predict(model, newdata = test_data)
prediction_df <- data.frame(
  Predicted = predicted,
  Observed = test_data$price
)

ggplot(prediction_df,
       aes(x = Observed, y = Predicted)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, colour="red")

#Test Fits
rmse <- sqrt(mean((prediction_df$Observed - prediction_df$Predicted)^2))
print(paste0("RMSE = ", rmse))
print(paste0("Median = ", median(prediction_df$Observed)))

#==== T ====
library(broom)
library(knitr)
tidied_results <- broom::tidy(model)
knitr::kable(tidied_results)
