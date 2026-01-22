# Empirical Analysis: Children and Life Satisfaction (SOEP Data)
# Econometrics Methods II – Problem Set 2: Panel Data

setwd("C:/Users/emili/OneDrive/Economics Master/Econometrics II")

library(haven)
library(plm)
library(lmtest)
library(sandwich)
library(dplyr)

# Load and prepare data
data <- read_dta("C:/Users/emili/Downloads/soep_lebensz_en.dta") %>%
  mutate(has_kids = ifelse(no_kids > 0, 1, 0)) %>%
  filter(!is.na(has_kids), !is.na(education), !is.na(health_std), !is.na(satisf_std))

# ==========================================
# PART A) T=2: FD vs FE
# ==========================================

data_a <- data %>%
  group_by(id) %>%
  arrange(id, year) %>%
  slice(1:2) %>%
  filter(n() == 2) %>%
  ungroup()

# First-Difference
data_fd <- data_a %>%
  group_by(id) %>%
  summarise(d_satisf = satisf_std[2] - satisf_std[1],
            d_has_kids = has_kids[2] - has_kids[1],
            d_health = health_std[2] - health_std[1])

fd_model <- lm(d_satisf ~ d_has_kids + d_health - 1, data = data_fd)
summary(fd_model)

# Fixed Effects
pdata <- pdata.frame(data_a, index = c("id", "year"))
fe_model <- plm(satisf_std ~ has_kids + health_std, data = pdata, model = "within")
summary(fe_model)

# ==========================================
# PART B) All periods: FD vs FE
# ==========================================

# First-Difference
data_fd_full <- data %>%
  group_by(id) %>%
  arrange(id, year) %>%
  mutate(d_satisf = satisf_std - lag(satisf_std),
         d_has_kids = has_kids - lag(has_kids),
         d_health = health_std - lag(health_std)) %>%
  filter(!is.na(d_satisf)) %>%
  ungroup()

fd_model_full <- lm(d_satisf ~ d_has_kids + d_health - 1, data = data_fd_full)
summary(fd_model_full)

# Fixed Effects
pdata_full <- pdata.frame(data, index = c("id", "year"))
fe_model_full <- plm(satisf_std ~ has_kids + health_std, data = pdata_full, model = "within")
summary(fe_model_full)

# Robust SE
coeftest(fe_model_full, vcov = vcovHC(fe_model_full, type = "HC1", cluster = "group"))

# ==========================================
# PART C) Dynamic FE
# ==========================================

data_dynamic <- data %>%
  group_by(id) %>%
  arrange(id, year) %>%
  mutate(satisf_std_lag = lag(satisf_std)) %>%
  filter(!is.na(satisf_std_lag)) %>%
  ungroup()

pdata_dynamic <- pdata.frame(data_dynamic, index = c("id", "year"))
fe_dynamic <- plm(satisf_std ~ satisf_std_lag + has_kids + education + health_std,
                  data = pdata_dynamic, model = "within")
summary(fe_dynamic)

# ==========================================
# PART D) Arellano-Bond
# ==========================================

pdata_ab <- pdata.frame(data, index = c("id", "year"))
ab_model <- pgmm(satisf_std ~ lag(satisf_std, 1) + has_kids + health_std + education |
                   lag(satisf_std, 2:99),
                 data = pdata_ab, effect = "individual",
                 model = "onestep", transformation = "d")
summary(ab_model)
mtest(ab_model, order = 2)

