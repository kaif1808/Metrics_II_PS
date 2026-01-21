EM II/QSM II: Development – Panel Data Models Part I

Spring 2026 | Barcelona School of Economics | Albrecht Glitz
(Wooldridge, Chapter 10)

1. What is Panel Data

A time series of cross sections where the same individual units are followed over a number of time periods; that is, a collection of $N$ time series.

Two sample dimensions: Cross-sectional ($N$, indexed by $i=1,...,N$) and Time-series ($T$, indexed by $t=1,...,T$).

Data collection processes:

Individual units observed until "lost".

Individual units observed for a finite number of time periods and then dropped. Without attrition, this is a balanced panel.

Attrition:

Unbalanced panels usually result from attrition.

If attrition is independent of the dependent variable, it is exogenous, and balanced/unbalanced panels share the same properties.

We assume $T_i = T, \forall i$ (Balanced Panel) for this course to simplify notation.

If attrition is endogenous (e.g., firm failure due to negative profits), the selection process must be modeled.

Matrix Notation

The observable information in a balanced panel with $K$ explanatory variables is structured as follows:

$$y = \begin{pmatrix} y_1 \\ y_2 \\ \vdots \\ y_N \end{pmatrix}, \quad
X = \begin{pmatrix} X_1 \\ X_2 \\ \vdots \\ X_N \end{pmatrix} = \begin{pmatrix}
x_{11}' \\ \vdots \\ x_{1T}' \\
\vdots \\
x_{N1}' \\ \vdots \\ x_{NT}'
\end{pmatrix}$$

$y$ is a column vector of dimension $NT$.

$y_i$ is a column vector of dimension $T$ for each $i=1,...,N$.

$X$ is a matrix $NT \times K$.

$X_i$ is a matrix $T \times K$ for $i=1,...,N$.

Types of Panel Data

Household panels

Individual level panels

Firm level panels

Countries followed over time

Industries followed over time

2. Why/When Do We Need Panel Data

1. Endogeneity

Panel data may offer a solution to unobserved heterogeneity when Instrumental Variables (IV) are not feasible.

Omitted Variable Problem: If an unobservable variable is correlated with observables, OLS is inconsistent.

Example: Suppose the omitted variable $f_i$ is constant over time:


$$y_{it} = x_{it}'\beta + f_i + u_{it}$$

Taking first differences eliminates $f_i$:


$$\Delta y_{it} = \Delta x_{it}'\beta + \Delta u_{it}$$

OLS can be applied to consistently estimate $\beta$ as long as $E(\Delta x_{i}'\Delta u_{i}) = 0$.

2. Dynamics

Panel data is required in the estimation of dynamic economic models in the presence of individual level heterogeneity.

Labour supply and human capital formation: Past labour supply/earnings affect future labour supply/earnings.

Habit formation: Past consumption patterns affect the utility of consumption in the future.

In these examples, present decisions are a function of both non-contemporaneous and contemporaneous variables.

3. Three Types of Estimators

Consistent for fixed $T$ as $N \to \infty$: Suitable where $N$ is large and $T$ is relatively small. (Focus of this course)

Consistent as $T \to \infty$ and $N$ is fixed: Suitable where $T$ is large and $N$ is relatively small.

Consistent as both $N$ and $T \to \infty$: Suitable where both are large.

Note: When $T$ is small, we generally do not need to worry about non-stationarity of regressors.

4. The Observation Sample

Sample of observations $\{(y_{it}, x_{it}) \in \mathbb{R} \times \mathbb{R}^K, i=1,...,N, t=1,...,T\}$.

We assume Random Sampling: Cross-sectional observations are i.i.d. draws from the population.

$(y_{it}, x_{it})_{t=1}^T$ is independent of $(y_{jt}, x_{jt})_{t=1}^T$ for all $i \neq j$.

They have the same distribution.

5. The Model

The basic model is:


$$y_{it} = x_{it}'\beta + v_{it} = x_{it}'\beta + f_i + u_{it}$$

$v_{it} = f_i + u_{it}$ is the composite error term.

$f_i$ is the unobserved effect (time-invariant).

$u_{it}$ is the idiosyncratic time-varying shock.

6. Alternative Assumptions on Error Components

6.1 Strict versus Weak Exogeneity (How $u$ is related to $x$)

Strict Exogeneity:


$$E(u_{it} | x_{i1}, ..., x_{iT}, f_i) = E(u_{it} | X_i, f_i) = 0$$

Implies $E(x_{it}u_{is}) = 0$ for all $t, s$.

Weak Exogeneity (Predetermined Regressors):


$$E(u_{it} | \{x_{is}\}_{s \le t}, f_i) = 0$$

6.2 Random Effects versus Fixed Effects (How $f$ is related to $x$)

Random Effects (RE):


$$E(f_i | x_{i1}, ..., x_{iT}) = E(f_i) = 0$$

Implies $corr(x_{it}, f_i) = 0$.

Fixed Effects (FE):


$$E(f_i | x_{i1}, ..., x_{iT}) = E(f_i | X_i) = g(X_i)$$

Implies generally $corr(x_{it}, f_i) \neq 0$.

7. The Random Effects Model

7.1 Assumptions

RE1. Random individual effects: $E(f_i | X_i) = E(f_i) = 0$.

RE2. Strictly exogenous regressors: $E(u_{it} | X_i, f_i) = 0$.

RE3. Homoscedasticity:

$Var(f_i | X_i) = \sigma_f^2$

$Var(u_{it} | X_i, f_i) = \sigma_u^2$

$Cov(u_{it}, u_{is} | X_i, f_i) = 0$ for $t \neq s$

RE4. Linearly independent regressors: $E(X_i' X_i)$ is positive definite (rank $K$).

These imply:


$$Cov(v_{it}, v_{is} | X_i) = \sigma_f^2 + \delta_{ts}\sigma_u^2$$


where $\delta_{ts}$ is the Kronecker delta (1 if $t=s$, 0 otherwise).

7.2 The Pooled OLS Estimator (POLS)

$$\hat{\beta}^{POLS} = (X'X)^{-1}X'y$$

Unbiased: $E[\hat{\beta}^{POLS}] = \beta$

Consistent: Under RE1 and RE2 (only contemporaneous correlation ruled out).

Issue: Standard errors are incorrect because composite errors $v_{it}$ are serially correlated due to $f_i$.

7.3 Variance of the Error

The covariance matrix for individual $i$, $V = E(v_i v_i' | X_i)$, is:


$$V = \sigma_u^2 I_T + \sigma_f^2 J_T$$


where $I_T$ is the identity matrix and $J_T$ is a matrix of ones.

7.4 The Random Effects Estimator (RE)

Transformed model using GLS:


$$\hat{\beta}^{RE} = \left(\sum_{i=1}^N X_i' V^{-1} X_i\right)^{-1} \left(\sum_{i=1}^N X_i' V^{-1} y_i\right)$$

Consistent: As $N \to \infty$.

Asymptotically Normal: $\sqrt{N}(\hat{\beta}^{RE} - \beta) \xrightarrow{d} \mathcal{N}(0, E[X_i' V^{-1} X_i]^{-1})$.

7.5 Feasible GLS

Since $\sigma_u^2$ and $\sigma_f^2$ are unknown, we use residuals from POLS to estimate them:

$\hat{\sigma}_v^2 = \frac{1}{NT-K} \sum \sum \hat{v}_{it}^2$

$\hat{\sigma}_f^2 = \frac{1}{NT(T-1)/2 - K} \sum \sum_{s > t} \hat{v}_{it} \hat{v}_{is}$

$\hat{\sigma}_u^2 = \hat{\sigma}_v^2 - \hat{\sigma}_f^2$

Construct $\hat{V}$ and substitute into the RE formula.

7.6 Stata Implementation

xtset panelvar timevar
xtreg depvar [indepvars], re


8. The Fixed Effects Model with Strict Exogeneity

Allows correlation between unobserved effect $f_i$ and regressors $x_{it}$.

8.1 Assumptions

FE1. Fixed individual effects: $E(f_i | X_i) \neq 0$.

FE2. Strictly exogenous regressors: $E(u_{it} | X_i, f_i) = 0$.

FE3. Homoscedasticity: $Var(u_{it}|...) = \sigma_u^2$, no serial correlation in $u_{it}$.

FE4. Linearly independent regressors: Rank condition on time-varying regressors.

8.2 The Fixed Effects (Within Groups) Estimator

Uses centered (demeaned) observations to eliminate $f_i$:


$$\tilde{y}_{it} = y_{it} - \bar{y}_i, \quad \tilde{x}_{it} = x_{it} - \bar{x}_i$$


Model: $\tilde{y}_i = \tilde{X}_i \beta + \tilde{u}_i$

Estimator:


$$\hat{\beta}^{FE} = (\sum_{i=1}^N \tilde{X}_i' \tilde{X}_i)^{-1} (\sum_{i=1}^N \tilde{X}_i' \tilde{y}_i)$$

Properties: Unbiased and Consistent.

Limitation: Cannot identify time-constant covariates ($z_i$).

8.3 Variance Estimation

$$\hat{\sigma}_u^2 = \frac{1}{N(T-1)-K} \sum_{i=1}^N \sum_{t=1}^T \hat{\tilde{u}}_{it}^2$$

Note the $N(T-1)$ in denominator due to degrees of freedom lost by demeaning.

8.4 Stata Implementation

xtreg depvar [indepvars], fe
# OR (LSDV approach)
reg depvar i.panelvar indepvars


9. The First-Difference Model

Alternative way to eliminate $f_i$.

9.1 Assumptions

FD1: $E(f_i | X_i) \neq 0$.

FD2: Strict exogeneity.

FD3: Homoscedasticity of differenced errors $\Delta u_{it} = e_{it}$.

FD4: Rank condition on $\Delta X$.

9.2 The First-Difference Estimator

Take first differences:


$$\Delta y_{it} = \Delta x_{it}' \beta + \Delta u_{it}$$

$$\hat{\beta}^{FD} = (\sum_{i=1}^N \Delta X_i' \Delta X_i)^{-1} (\sum_{i=1}^N \Delta X_i' \Delta y_i)$$

Unbiased and consistent.

Most efficient if $u_{it}$ is a random walk (so $\Delta u_{it}$ is serially uncorrelated).

9.3 Comparison: FE vs FD

T=2: FE and FD are identical.

T>2:

Use FE if $u_{it}$ is serially uncorrelated.

Use FD if $u_{it}$ follows a random walk.

If FE and FD estimates differ significantly, strictly exogeneity assumption may be violated.

9.4 Stata Implementation

xtivreg depvar (indepvars), fd
# OR
reg d.depvar d.indepvars, cluster(panelvar)


9.5 Cost of First-Differencing

If regressors are serially correlated (common in economics), FD reduces the signal-to-noise ratio and can greatly reduce precision compared to OLS (on levels) or FE.

10. Comparing RE and FE Estimators

RE Estimator: Weighted average of "Within" and "Between" variation.

Efficient: If assumptions hold, RE is BLUE (or asymptotically efficient).

Identifies: All parameters (time-varying and time-invariant).

FE Estimator: Uses only "Within" variation.

Robust: Consistent even if $E(f_i | X_i) \neq 0$.

Variance Comparison:


$$\hat{Avar}(\hat{\beta}^{RE})^{-1} - \hat{Avar}(\hat{\beta}^{FE})^{-1} \text{ is positive semi-definite.}$$

RE is at least as efficient as FE (variance is smaller or equal).

Hausman Test: Used to decide between RE and FE. Checks if the difference between the estimates is systematically different from zero.