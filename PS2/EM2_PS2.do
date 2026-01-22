*load data
use soep_lebensz_en.dta
br

* Q3 Setup:
*declare panel data
xtset id year
br
*create dummy variable has_kids
gen has_kids = (no_kids > 0) if !missing(no_kids)
br


* 3a: restrict to T=2
bysort id (year): keep if _n <= 2

* FD model 
reg d.satisf_std d.has_kids d.ed d.health_std, noconstant
estimates store firstT2

* FE model 
xtreg satisf_std has_kids health_std, fe
estimates store fixedT2

* Expect coefficients to not differ, as for T=2 first differences and fixed effects model are the same. 
* Note: excluded education from FE model as it should be dropped in FD model

* 3b:
* Return to full sample
use soep_lebensz_en.dta, clear
xtset id year
gen has_kids = (no_kids > 0) if !missing(no_kids)

*  Re-estimate models
reg d.satisf_std d.has_kids d.ed d.health_std, noconstant
xtreg satisf_std has_kids ed health_std, fe

* Coefficients are not the same, which makes sense as T > 2 now
* FE is efficient if errors are serially uncorrelated. FD is efficient if errors are serially correlated (random walk process).

* In this particular scenario, would expect FE to be more efficient

* FE has smaller standard errors :) 

*Should cluster on individuals to make SE more robust. 

* 3c: dynamic model 
xtreg satisf_std l.satisf_std has_kids ed health_std, fe

* Intuitively, would expect a positive correlation between past and current life satisfaction

*Instead, we get a negative coefficient here.

*Likely, downward biased (Nickell bias?) bc of the lag of life satisfaction being correlated with error term? 

*3d: Arellano-Bond
xtabond satisf_std has_kids ed health_std, lags(1) maxldep(2) vce(robust)
* Now we get a small, albeit positive coefficient on the lag of life satisfaction. Nice!


* test for serial correlation 
estat abond
* Reject H0 in order 1, FTR H0 in order 2. These are acceptable results according to my lecture notes, idk.


*xtabond2 satisf_std l.satisf_std has_kids ed health_std, gmm(l.satisf_std) iv(has_kids ed health_std) h(1)






