# Set working directory
setwd("C:/Users/emili/OneDrive/Economics Master/Econometrics II")

# Load the Stata file
library(haven)
data <- read_dta("C:/Users/emili/Downloads/soep_lebensz_en.dta")

# View the data
View(data)

# Or to see the structure
summary(data)
head(data)

unique(data$year)

# Create binary variable has_kids
data$has_kids <- ifelse(data$no_kids > 0, 1, 0)

# Check the variable
table(data$has_kids, useNA = "ifany")

# Convert year to factor for fixed effects
data$year <- as.factor(data$year)

# Convert health_org to factor (categorical)
data$health_org <- as.factor(data$health_org)

# Pooled OLS regression with clustered standard errors
library(lmtest)
library(sandwich)

# Run the regression
model_ols <- lm(satisf_std ~ has_kids + sex + education + health_org + year, 
                data = data)

# Get clustered standard errors (clustered by individual id)
coeftest(model_ols, vcov = vcovCL(model_ols, cluster = data$id))

# Or for a nicer summary with clustered SEs:
library(estimatr)
model_ols_robust <- lm_robust(satisf_std ~ has_kids + sex + education + health_org + year,
                              data = data,
                              clusters = id,
                              se_type = "CR2")
summary(model_ols_robust)


#FE
# Fixed Effects (within) estimation
library(plm)
# Create panel data object
pdata <- pdata.frame(data, index = c("id", "year"))

# Fixed effects model
model_fe <- plm(satisf_std ~ has_kids + sex + education + health_org + year,
                data = pdata,
                model = "within",
                effect = "individual")

# Clustered standard errors for FE
coeftest(model_fe, vcov = vcovHC(model_fe, type = "HC1", cluster = "group"))


# Create interaction term
data$has_kids_female <- data$has_kids * data$sex

# Fixed effects with interaction
library(plm)
pdata <- pdata.frame(data, index = c("id", "year"))

model_fe_interact <- plm(satisf_std ~ has_kids + has_kids_female + education + health_org + year,
                         data = pdata,
                         model = "within",
                         effect = "individual")

# Clustered standard errors
coeftest(model_fe_interact, vcov = vcovHC(model_fe_interact, type = "HC1", cluster = "group"))

# Random Effects model
library(plm)

model_re <- plm(satisf_std ~ has_kids + sex + education + health_org + year,
                data = pdata,
                model = "random",
                effect = "individual")

# Clustered standard errors
coeftest(model_re, vcov = vcovHC(model_re, type = "HC1", cluster = "group"))

summary(model_re)

# Hausman test to formally test FE vs RE
phtest(model_fe, model_re)
