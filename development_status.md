# Development Status

## 2026-03-04 (update 2)
- Completed bonus Q2(h) in `Macro/PS7/Template/Macro_I_PS7_Template.tex`: solved for $N(t)/L(t)$ on the BGP by (1) expressing $L_H=nN/\eta$, $L_V=N(\kappa\lambda/((1-\sigma)\eta))^{1/\psi}$, and $L_P=(1-\beta)N(\rho+z^*\lambda)/(\eta\beta)$ (using H-FE + part-e firm value, simplified via $r^*+z^*+(1-\beta)/\beta\cdot g_w^*=\rho+z^*\lambda$); (2) applying labor market clearing to obtain the closed-form ratio. Recompiled to 13 pages; committed and pushed.

## 2026-03-04
- Completed all 12 solution blocks in `Macro/PS7/Template/Macro_I_PS7_Template.tex` (PS7: Endogenous Growth + Horizontal & Vertical Innovation).
  - Q1(a): Expanding-variety vs Schumpeterian assumptions on the aggregator and sources of growth.
  - Q1(b): Derived intermediate good demand under perfect competition via FOC.
  - Q1(c): Monopolist pricing at $p^*=r/\alpha$, equilibrium quantity, and profits.
  - Q1(d): Equilibrium share of innovators ($L_{N}/L=1-1/(\alpha L)$) and long-run growth rate via return-to-innovation arbitrage.
  - Q1(e): Decentralized equilibrium grows slower than planner — monopoly distortion and incomplete appropriability externality.
  - Q2(a): Consumer's problem with land income and Euler equation $\dot{c}/c=r-\rho$.
  - Q2(b): Machine profits $\pi=\beta q w^{-(1-\beta)/\beta}$ via monopoly pricing with labor-based production.
  - Q2(c): Total production labor $L_P=(1-\beta)NQw^{-1/\beta}$ and Cobb-Douglas output $Y=\frac{(NQ)^\beta L_P^{1-\beta}}{(1-\beta)^{2-\beta}}$.
  - Q2(d): BGP growth rate $g_c=\beta g_Q$; horizontal innovation only keeps pace with population.
  - Q2(e): HJB asset value equation with capital-gains term; BGP firm value derived with wage-growth term $\frac{1-\beta}{\beta}g_w^*$ in denominator.
  - Q2(f): Horizontal and vertical free-entry conditions; derived $z^*=(\lambda/(\eta(1-\sigma)))^{(1-\psi)/\psi}\kappa^{1/\psi}$.
  - Q2(g): $g_c=\beta(\lambda-1)z^*$; no scale effect, no dependence on $L$ or $n$; endogenous growth model (stepping-on-toes eliminates scale effects).
- Recompiled PDF via `latexmk`; build succeeds (11 pages, exit 0). Pre-existing multiply-defined label warnings are non-blocking.

## 2026-02-24
- Improved `PS4/Template/EMII_QSMII_PS4_Template.tex` to submission-ready quality: completed all Q3 solutions (a--i) with balanced-rigor writeups aligned to `PS4_Q3_STAR.log` estimates; added formal proof for Q3(a); and replaced placeholder text in all remaining Q3 solution blocks.
- Refined PS4 template consistency and notation: corrected Q1(a) covariance notation to use `Y_{i,post}`, tightened Q1(c) causal interpretation wording under random assignment, removed duplicate `subdepth` package import, and corrected the Q3(b) prompt wording about the ignored STAR arm (regular-size class with aide).
- Recompiled `PS4/Template/EMII_QSMII_PS4_Template.tex` via `latexmk`; build succeeds and updated PDF is generated. Remaining warnings are non-blocking template-level warnings (pre-existing multiply-defined exam labels and minor overfull boxes).

## 2026-02-23
- Completed PS4 Q1 (RCT theory) solutions in `PS4/Template/EMII_QSMII_PS4_Template.tex`: (a) expressed $\beta_D$ as $E(Y_{i,post}|D_i=1)-E(Y_{i,post}|D_i=0)$; (b) proved $\beta_D=\text{ATE}$ under random assignment; (c) proved $\beta_{DD}=\text{ATE}$ in the DiD regression; (d) gave three reasons to prefer the DiD specification (precision, balance check, robustness). Based on `PS4/RCT.md` lecture notes.
- Created `PS4/Template/EMII_QSMII_PS4_Template.tex` — LaTeX problem set template for PS4 (Randomized Controlled Trials), mirroring PS3 structure. Includes: Q1 (RCT theory, parts a–d), Q2 (DGP with binary regressors, parts a–c), Q3 (Project STAR empirical, parts a–i) with variable list, empty solution blocks, and author line (Kai Faulkner, Rayyaan Kazi, Emilia Infante, Katherine Ciaramello).
- Rewrote PS6 Q2d (transitional dynamics) in `Macro/PS6/Template/Macro_I_PS6_Template.tex`. New solution includes: (1) rigorous derivation of the autonomous logistic ODE $\dot{x}=(1-\alpha)x(B/\alpha-x)$ via co-state equations and the FOC on $u$; (2) ODE for $c=C/K$ from the Euler equation; (3) full linearisation of the $(x,c)$ system with Jacobian and eigenvalues ($\lambda_1=-(1-\alpha)B/\alpha<0$, $\lambda_2=c^*>0$) confirming a unique saddle path; (4) saddle-path slope formula and its sign dependence on $\operatorname{sgn}(\alpha-\theta)$; (5) complete characterisation of $k$, $u$, $c$ dynamics for both $\alpha>\theta$ and $\alpha<\theta$ cases; (6) phase diagram in $(x,c)$ space.

## 2026-03-13
- Created `MicroPracticeQ/Micro1/Micro1Q.tex` as a LaTeX version of the Micro I practice exam (game theory and information economics), with all problems from `Micro1Q.md` structured into sections, properly formatted math, and payoff tables.
- Added `MicroPracticeQ/Micro1/Micro1Q_solutions.tex` containing a comprehensive answer key for Sections 1--5 (dominance solvability, bargaining, mixed strategies/zero-sum value, adverse selection, and moral hazard), with full algebra in LaTeX.
- Set up a local `latexmkrc` in `MicroPracticeQ/Micro1/` to route all build artefacts (`.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`) into `MicroPracticeQ/Micro1/aux/`, keeping the main directory limited to source `.tex` and compiled PDFs. Recompiled both question and solutions PDFs via `latexmk`; builds succeed with minor overfull box warnings only.
- Converted `MicroPracticeQ/Micro2/Micro2Q.md` into `MicroPracticeQ/Micro2/Micro2Q.tex`, a standalone LaTeX exam (questions plus integrated answer key) mirroring the Micro1 style, and compiled `Micro2Q.pdf` successfully via `latexmk` (10 pages, only minor overfull box warnings).

## 2026-03-14
- Converted `MicroPracticeQ/Micro3/Micro3Q.md` into `MicroPracticeQ/Micro3/Micro3Q.tex`, a standalone LaTeX practice exam (game theory and information economics) mirroring the Micro1/Micro2 style, including payoff tables, answer boxes, and an integrated answer key. Successfully compiled `Micro3Q.pdf` via `latexmk` (7 pages, only minor overfull-box warnings).

## 2026-02-21
- Created `Macro/PS6/Template/Macro_I_PS6_Template.tex` — problem set template for PS6 (Endogenous Growth) with two exercises: (1) Endogenous Growth (parts a–f) covering per capita production, derivatives, law of motion, growth rate diagram, and endogenous growth discussion; (2) Endogenous growth with human capital accumulation (parts a–d) covering Hamiltonian, balanced growth path, parameter conditions, and transitional dynamics. Based on PS5 template structure with empty solution blocks.

## 2026-02-18
- Completed PS4 Q3 (Project STAR) in Stata: created `PS4/PS4_Q3_STAR.do` with all empirical parts (b–i), including basic regression, school FE, clustered SEs, ritest randomization inference, balance checks, covariates, and interactions. Used `areg` for school fixed effects (built-in). Log saved to `PS4/PS4_Q3_STAR.log`.
- Added `PS4/Q3_solutions.md` with part (a) mathematical proof and written answers for all parts.

## 2026-02-15
- Created `Macro/PS5/Template/Macro_I_PS5_Template.tex` — solutions template for PS5 (Misallocation and market power) with 11 questions (a–k), based on PS4 template structure. Includes optional figure placeholders for MPK/MPL distributions.
- Completed PS5 Q1 solutions (parts a–d) in `Macro/PS5/Template/Macro_I_PS5_Template.tex`: firm problem & FOCs (a), zero misallocation under identical firms (b), zero misallocation under heterogeneous productivity (c), optimal firm size/profits with DRS vs CRS efficiency discussion (d).
- Completed PS5 Q1 solutions (parts e–h): market power firm problem with MPX misallocation (e), marginal revenue product measure showing τ̃=0 (f), comparison of the two misallocation measures and efficiency inference (g), socially optimal vs market-induced firm size with level/cross-section efficiency analysis (h).
- Completed PS5 Q1 solutions (parts i–k): empirical MP distribution interpretation with revenue-vs-physical-output discussion and violated assumptions (i), CES aggregator showing constant markup eliminates cross-sectional misallocation leaving only level inefficiency (j), monopolistic competition in CES economy confirming constant markup and Dixit-Stiglitz welfare result (k). **PS5 all parts (a–k) now complete.**

## 2026-02-07
- Added `Macro/PS4/ps4_part2.ipynb` implementing PS4 Section 2 Ramsey model algorithm, bisection search for `c0`, and required plots.

## 2026-02-08
- Completed PS4 Q1 solutions (parts a--d) in `Macro/PS4/Template/Macro_I_PS4_Template.tex` with FOCs, savings dynamics, steady state, and corner analysis.
