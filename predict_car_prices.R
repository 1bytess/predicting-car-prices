#===== Data Preparation =====

#Packages Load
library(dplyr)
library(ggplot2)

#Data Load (kaggle.com/datasets/hellbuoy/car-price-prediction)
data <- read.csv("../data/car_price.csv")
str(data)

#===== Data Pre-Processing ======

#Extracting Independent Variables
Refined_data <- data[c("fueltype", "carbody", "drivewheel", "cylindernumber", "enginesize",  "horsepower", "citympg", "highwaympg", "price")]
str(Refined_data)

#Changing Value Types
Refined_data$cylindernumber <- as.factor(Refined_data$cylindernumber)
Refined_data$enginesize <-as.numeric(Refined_data$enginesize)
Refined_data$horsepower <-as.numeric(Refined_data$horsepower)
Refined_data$citympg <-as.numeric(Refined_data$citympg)
Refined_data$highwaympg <-as.numeric(Refined_data$highwaympg)

table(Refined_data$cylindernumber)
Refined_data$cylindernumber <- recode(data$cylindernumber,
                              "two" = 2,
                              "three" = 3,
                              "four" = 4,
                              "five" = 5,
                              "six" = 6,
                              "eight" = 8,
                              "twelve" = 12)

#Removing Variable for data train
Refined_data <- Refined_data %>%
  group_by(cylindernumber) %>%
  filter(n()>1)

#===== Descriptive Statistics =====

#Central Tendency
summary(Refined_data$price)
ggplot(Refined_data, aes(x=price)) +
  geom_boxplot() +
  labs(x="Car Price")

#Body types Average Price
avg_modelprice <- Refined_data %>%
  group_by(carbody) %>%
  summarise(Avg_Price = mean(price, na.rm=TRUE)) %>%
  arrange(desc(Avg_Price))

avg_modelprice
ggplot(avg_modelprice, aes(x=carbody, y=Avg_Price, fill=carbody)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0("$", round(Avg_Price))), vjust = 1.5, colour="white") +
  labs(x = "Car Model/Type", y = "Average Price") +
  guides(fill=FALSE)

#Body types distribution
table(Refined_data$carbody)
ggplot(Refined_data, aes(x=carbody, fill=carbody)) +
  geom_bar() +
  labs(x="Car Type",y="Number of Cars") +
  guides(fill=FALSE) +
  theme_minimal()


#Drive Wheel of Sedan's Type Distribution
sedan_counts <- Refined_data %>%
  filter(carbody == 'sedan') %>%
  group_by(drivewheel) %>%
  summarise(count = n(), .groups = 'drop')
sedan_counts$count <- as.numeric(sedan_counts$count)

ggplot(sedan_counts, aes(x=drivewheel, y=count, fill=drivewheel)) +
  geom_bar(stat = "identity") +
  labs(x="Drive Wheel Type",y="Number of Sedan") +
  guides(fill=FALSE) +
  theme_minimal()

#Average Drive Wheel Car Price
avg_dwprice <- Refined_data %>%
  group_by(drivewheel) %>%
  summarise(Avg_Price = mean(price, na.rm=TRUE)) %>%
  arrange(desc(Avg_Price))

ggplot(avg_dwprice, aes(x=drivewheel, y= Avg_Price, fill=drivewheel)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0("$", round(Avg_Price))), vjust = 1.5, colour="white") +
  labs(x = "Drive Wheel Type", y = "Average Price") +
  guides(fill=FALSE) +
  theme_minimal()

#===== Regression Analysis to Predict Prices =====
set.seed(1712)

S <- sample(seq_len(nrow(Refined_data)), floor(0.7 * nrow(Refined_data)))
train_data <- Refined_data[S,]
test_data <- Refined_data[-S,]

model <- lm(price ~., data = train_data)
summary(model)

predicted <- predict(model, newdata = test_data)

prediction_df <- data.frame(
  Predicted = predicted,
  Observed = test_data$price
)

ggplot(prediction_df,
       aes(x = Observed, y = Predicted)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, colour="red")

rmse <- sqrt(mean((prediction_df$Observed - prediction_df$Predicted)^2))
print(paste0("RMSE = ", rmse))
print(paste0("Median = ", median(prediction_df$Observed)))

#==== T ====
library(broom)
library(knitr)
tidied_results <- broom::tidy(model)
knitr::kable(tidied_results)
