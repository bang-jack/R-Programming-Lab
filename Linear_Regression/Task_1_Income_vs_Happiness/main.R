library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(readxl)

data <- read_excel("income_vs_happiness_dataset.xlsx")

head(data)
summary(data)
str(data)

data <- data %>% 
  mutate(
    happiness = as.numeric(happiness),
    income = as.numeric(income)
  )


# check normality of dependent variable (Happiness)
ggplot(data, aes(x = happiness)) +
  geom_histogram(bins = 20, fill = "green", color = "black") +
  labs(title = "Happiness Distribution",
       x = "Happiness Level",
       y = "Frequency")

# check linear relation with scatter plot
ggplot(data, aes(x = income, y = happiness)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot Income vs Happiness",
       x = "income",
       y = "happiness")

# simple linear regression
model <- lm(happiness ~ income, data = data)
summary(model)

# check homoskedasticity
plot(model, which = 1)   # Residuals vs Fitted Plot

# visualise linear regression with equations
ggplot(data, aes(x = income, y = happiness)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  stat_regline_equation(label.y = max(data$happiness)) + 
  stat_cor(label.y = max(data$happiness) - 1) +
  labs(title = "Relation Between Income and Happiness",
       x = "Income",
       y = "Happiness")


