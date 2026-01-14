* Step 1: Load and Prepare Data
use "soep_lebensz_en.dta", clear
describe
summarize

* Question 4a: Variable Construction & FE vs Pooled OLS

* Construct binary variable 'has_kids'
gen has_kids = (no_kids > 0) if !missing(no_kids)

* Declare data as panel data
* id is the individual identifier, year is the time variable
xtset id year

* 1. Pooled OLS Regression
reg satisf_std has_kids i.sex education i.health_org i.year, vce(cluster id)

* 2. Fixed Effects (FE) Regression
xtreg satisf_std has_kids education i.health_org i.year, fe

* Question 4b: Gender Interaction
xtreg satisf_std i.has_kids##i.sex education i.health_org i.year, fe

* Question 4c: Random Effects (RE)

* Estimate Random Effects model
xtreg satisf_std has_kids i.sex education i.health_org i.year, re

* Question 4d: Hausman Test

* 1. Run Fixed Effects again and store
quietly xtreg satisf_std has_kids education i.health_org i.year, fe
estimates store fixed_model

* 2. Run Random Effects again and store
quietly xtreg satisf_std has_kids education i.health_org i.year, re
estimates store random_model

* 3. Run the test
hausman fixed_model random_model
