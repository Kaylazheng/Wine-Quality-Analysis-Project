install.packages("car")
library(broom)
library(tidyverse)
library(car)
## Multiple Linear regression model ##
# with interaction
MLR_wine <- lm(quality ~ alcohol*`volatile acidity`, wine_data)
MLR_wine_results <- tidy(MLR_wine) %>%
  mutate_if(is.numeric, round, 3)
MLR_wine_results
## Model Diagnostics ##
#1) Residual plot
options(repr.plot.width = 8, repr.plot.height = 6)
plot(MLR_wine, 1)
#2) Q-Q plot
plot(MLR_wine, 2)
## 3.Multicollinearity
wine1 <- wine_data %>%
  select(quality, alcohol,`volatile acidity`)
MLR_wine1 <- lm(quality ~ alcohol + `volatile acidity`, wine1)
MLR_wine1_results <- tidy(MLR_wine1) %>%
  mutate_if(is.numeric, round, 3)
MLR_wine1_results
vif(MLR_wine1)

