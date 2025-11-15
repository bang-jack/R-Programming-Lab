# Simple Linear Regression - Income vs Happiness
This project demonstrates how to perform simple linear regression analysis in R using data from an Excel file. The goal is to explore the relationship between income and happiness, verify model assumptions, and visualize results with regression lines and equations.

## 📦 Dependencies
The following libraries are required:

```
library(ggplot2)   # data visualization
library(dplyr)     # data manipulation
library(broom)     # model output formatting (tidy output)
library(ggpubr)    # regression annotations and stats on plots
library(readxl)    # importing Excel (.xlsx) files
```

## 🧹 Data Preparation
After importing the data, ensure numeric columns are properly typed, especially if Excel imports them as text:
```
data <- data %>%
  mutate(
    happiness = as.numeric(happiness),
    income_x = as.numeric(income_x)
  )
```

## 📊 1️⃣ Checking Normality (Histogram)
We analyze whether the dependent variable (happiness) is approximately normally distributed.
```
ggplot(data, aes(x = happiness)) +
  geom_histogram(bins = 20, fill = "green", color = "black") +
  labs(
    title = "Happiness Distribution",
    x = "Happiness Level",
    y = "Frequency"
  )
```

**Interpretation**
- Bell-shaped, symmetrical → approximately normal
- Strong skew → not normal
- Normality is suggested (not required) for more reliable regression inference

## 📈 2️⃣ Checking Linearity (Scatter Plot)
```
ggplot(data, aes(x = income_x, y = happiness)) +
  geom_point(color = "blue") +
  labs(
    title = "Scatter Plot: Income vs Happiness",
    x = "Income",
    y = "Happiness"
  )
```

**Interpretation**
- Upward trend → positive relationship
- Downward trend → negative relationship
- No clear pattern → no linear association

## 📐 3️⃣ Simple Linear Regression Model
```
model <- lm(happiness ~ income_x, data = data)
summary(model)
```

Important output components:
| Output            | Meaning                                                |
| ----------------- | ------------------------------------------------------ |
| Intercept & Slope | Forms the regression equation                          |
| p-value           | Significance of the relationship (<0.05 = significant) |
| R-squared         | Strength of relationship (closer to 1 = strong)        |


🧪 4️⃣ Checking HomoskedasticityThis section:
```
plot(model, which = 1)
```

**Interpretation**
| Pattern       | Meaning                                  |
| ------------- | ---------------------------------------- |
| Random spread | Homoskedasticity met (good)              |
| Funnel / wave | Heteroskedasticity (model less reliable) |


## 🎨 5️⃣ Final Regression Visualization
```
ggplot(data, aes(x = income_x, y = happiness)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  stat_regline_equation(label.y = max(data$happiness)) +
  stat_cor(label.y = max(data$happiness) - 1) +
  labs(
    title = "Regression: Income vs Happiness",
    x = "Income",
    y = "Happiness"
  )
```

**Interpretation Example**
Suppose the regression equation is y = 0.71x + 0.21, meaning:
For every additional 1-unit increase in income, happiness increases by approximately 0.71 units.
R value near 1 → strong correlation
p < 0.05 → statistically significant