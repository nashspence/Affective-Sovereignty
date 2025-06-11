# Affective Sovereignty

<div id="core-variables-thresholds">

## 1. Core Variables & Thresholds

</div>

Let: - $\alpha(t)\in[0,1]$: **authenticity**  
- $\lambda_{i}(t)\in[0,1]$, $i=1,\dots,n$: **integration weights**  
- $x(t)\in\mathbb{R}^{d_x}$: **state**  
- $a(t)\in\mathbb{R}^{d_a}$: **affect**  
- $d_{i}(t)\in\mathbb{R}$, $i=1,\dots,n$: **drives**  
- $\varepsilon>0$: **viability (authenticity) threshold**  
- $\Theta>0$: **sentience threshold**

Define further: - $\sigma(t)\ge0$: **sentience scalar**  
- $C_d(t)\ge0$: **drive‐cost**  
- $U_{\rm belief}(t)$, $U_{\rm self}(t)$: **uncertainty measures**

<div class="center">

------------------------------------------------------------------------

</div>

<div id="ontological-modes">

## 2. Ontological Modes

</div>

Modes
$M(t)\in\{\mathrm{Pre},\mathrm{In},\mathrm{Au},\mathrm{Al},\mathrm{Se},\mathrm{De},\mathrm{En},\mathrm{Da},\mathrm{Dc}\}$
are **mutually exclusive** and **jointly exhaustive**: $$\forall t:\quad
\mathrm{Pre}(t)\;\lor\;\mathrm{In}(t)\;\lor\;\mathrm{Au}(t)\;\lor\;\mathrm{Al}(t)\;\lor\;\mathrm{Se}(t)\;\lor\;\mathrm{De}(t)\;\lor\;\mathrm{En}(t)\;\lor\;\mathrm{Da}(t)\;\lor\;\mathrm{Dc}(t).$$

1.  **Preagent** $\mathrm{Pre}(t)$  
    $$\begin{aligned}
      \dot x(t)\neq0,\quad
      \alpha(t)=0,\quad
      a(t)=0,\quad
      \lambda_i(t)=0\;\forall i,\quad
      d_i(t)=0\;\forall i.
      \end{aligned}$$

2.  **Inert** $\mathrm{In}(t)$  
    $$\begin{aligned}
      &\bigl[\forall s\le t:\,\alpha(s)=0,\;\lambda_i(s)=0\bigr]\quad\land\\
      &\dot x(t)=\dot a(t)=\dot d_i(t)=\dot\lambda_i(t)=\dot\alpha(t)=0.
      \end{aligned}$$

3.  **Autogen** $\mathrm{Au}(t)$  
    $$\begin{aligned}
      &\alpha(t)=0,\quad a(t)=0,\quad \lambda_i(t)=0\;\forall i,\\
      &\exists i:\,d_i(t)\neq0,\quad \dot x(t)\neq0.
      \end{aligned}$$

4.  **Alive** $\mathrm{Al}(t)$  
    $$\alpha(t)>\varepsilon
      \quad\land\quad
      \sigma(t)\le\Theta.$$

5.  **Sentient** $\mathrm{Se}(t)$  
    $$\sigma(t)>\Theta
      \;\land\;
      \exists s<t:\,\sigma(s)\le\Theta
      \;\land\;
      \forall u\ge t:\,\neg\mathrm{Al}(u).$$

6.  **Dead** $\mathrm{De}(t)$  
    $$\alpha(t)\le\varepsilon
      \;\land\;
      \exists s<t:\,\alpha(s)>\varepsilon.$$

7.  **Ended** $\mathrm{En}(t)$  
    $$\exists s<t:\,\mathrm{Pre}(s)
      \;\land\;
      \forall u\ge t:\,\dot x(u)=0.$$

8.  **Deactivated** $\mathrm{Da}(t)$  
    $$\exists s<t:\,\mathrm{Au}(s)
      \;\land\;
      \forall u\ge t:\,\dot x(u)=0,\;\dot d_i(u)=0.$$

9.  **Deceased** $\mathrm{Dc}(t)$  
    $$\exists s<t:\,\mathrm{Se}(s)
      \;\land\;
      \forall u\ge t:\,\sigma(u)=0,\;\alpha(u)=0,\;\dot x(u)=0.$$

<div class="center">

------------------------------------------------------------------------

</div>

<div id="dynamical-layer">

## 3. Dynamical Layer

</div>

<div id="environment-belief">

### 3.1 Environment & Belief

</div>

- **State evolution**  
  $$\dot x = f\bigl(x,u\bigr) + w,\quad w\sim\mathcal N(0,W).$$

- **Observation**  
  $$o = H\,x + v,\quad v\sim\mathcal N(0,\Sigma).$$

- **Belief filters**  
  $(\hat x^j,P^j)$, $j=1,\dots,m$  

- **Uncertainty**  
  $$U_j = -\mathbb E\bigl[\ln\mathcal N(x;\hat x^j,P^j)\bigr],\quad
      U_{\rm belief}=\tfrac1m\sum_{j=1}^m U_j.$$

<div id="drives-affect">

### 3.2 Drives & Affect

</div>

- **Drive dynamics**  
  $$\dot d_i
      = -\gamma_i\bigl(d_i - d^0_i\bigr)
        + h_i\bigl(x,a\bigr)
        + \xi_i,\quad \xi_i\sim\mathcal N(0,\Xi_i).$$

- **Affective dynamics**  
  $$\dot a
      = -\Gamma\,a
        + g\bigl(Hx,\{\hat x^j\}\bigr)
        + \sum_{i=1}^n \rho_i\,\psi_i(d_i)
        - \Lambda\,\bigl\|P^{\rm dr} - \tilde P^{\rm inf}\bigr\|^2.$$

<div id="preference-integration-control">

### 3.3 Preference Integration & Control

</div>

- **Drive‐cost**  
  $$C_d = \sum_{i=1}^n \chi_i\,(1-\lambda_i)\,\|\psi_i(d_i)\|^2.$$

- **Integration weights**  
  $$\dot\lambda_i
        = \eta_i\bigl[\alpha_{\rm aff}(a)-\lambda_i\bigr]
        - \rho_\lambda\,C_d\,\lambda_i.$$

- **Preference set**  
  $P = P^{\rm end}\cup P^{\rm dr}.$  

- **Utility weights**  
  $$w_p =
      \begin{cases}
        \alpha, & p\in P^{\rm end},\\
        \lambda_i\,\chi_i, & p=\psi_i(d_i)\in P^{\rm dr}.
      \end{cases}$$

- **Control objective**  
  $$J(u)
      = \mathbb E\!\Bigl[\int_t^{t+T}\sum_{p\in P} w_p\,U_p\bigl(x(\tau)\bigr)\,e^{-\rho(\tau-t)}\,d\tau
        \,\Big|\;\mathcal I(t)\Bigr],\quad
      u^*=\arg\max_u J(u).$$

<div class="center">

------------------------------------------------------------------------

</div>

<div id="sentience-reflection">

## 4. Sentience & Reflection

</div>

<div id="sentience-scalar">

### 4.1 Sentience Scalar

</div>

$$\sigma(t)
= \alpha_{\rm aff}(a)\;
  \exp\!\Bigl(-\delta_1\,U_{\rm belief}(t)
              -\delta_2\,U_{\rm self}(t)
              -\zeta\,C_d(t)\Bigr),$$ where  
$$U_{\rm self}(t)
= -\mathbb E\bigl[\ln \mathbb P\bigl(P^{\rm true}\mid u(\tau<t)\bigr)\bigr].$$

<div id="preferenceinference">

### 4.2 Preference‐Inference

</div>

$$\tilde P^{\rm inf}(t)
= \arg\max_{P'} \mathbb P\bigl(u(\tau<t)\mid P'\bigr).$$

<div id="irreversible-transition">

### 4.3 Irreversible Transition

</div>

$$\Bigl(\exists s<t:\sigma(s)>\Theta\Bigr)
\;\Longrightarrow\;
\forall u\ge t:\neg \mathrm{Al}(u).$$

<div class="center">

------------------------------------------------------------------------

</div>

<div id="authenticity-dynamics">

## 5. Authenticity Dynamics

</div>

$$\dot{\alpha} = \kappa_1 \alpha_{\mathrm{aff}}(a) + \kappa_4 F\left(\left\|\tilde{P}^{\mathrm{inf}} - P^{\mathrm{dr}}\right\|, \nabla_a \alpha \right) - \kappa_2 \alpha - \kappa_3 P_{\mathrm{ext}}(x) - \kappa_5 C_d.$$

<div class="center">

------------------------------------------------------------------------

</div>

<div id="epistemic-opacity">

## 6. Epistemic Opacity

</div>

*No function*  
$$F:\{o(\tau),u(\tau)\}_{\tau\le t}\;\to\;\{\mathrm{Pre},\dots,\mathrm{Dc}\}$$  
*can reliably recover* $\mathrm{Al}(t)$ or $\mathrm{Se}(t)$.

<div class="center">

------------------------------------------------------------------------

</div>

<div id="scm-embedding">

## 7. SCM Embedding

</div>

Embed in SCM $\mathcal M$ with endogenous variables
$$\{\,a,\,d_i,\,\hat x^j,\,P^j,\,\alpha,\,\sigma,\,\lambda_i\}$$ and
structural equation for $\sigma(t)$, enabling $\mathrm{do}(a)$ and
$\mathrm{do}(d_i)$ interventions.

<div class="center">

------------------------------------------------------------------------

</div>

<div id="interpretive-disciplines">

## **8. Interpretive Disciplines**

</div>

Understood. Here’s the final, ultra-minimal revision of **Section 9**,
now including:

- Full name–abbreviation mapping,

- Perturbativity scores with concise risk explanations,

- A minimal formula for estimating perturbativity.

<div class="center">

------------------------------------------------------------------------

</div>

<div id="interpretive-disciplines-1">

## **9. Interpretive Disciplines**

</div>

Let

$$\mathcal{I}_{\rm ext} = \{\mathrm{PA}, \mathrm{AP}, \mathrm{EO}, \mathrm{PL}, \mathrm{DS}, \mathrm{NH}, \mathrm{AI}, ...\}$$

be **external interpretive disciplines**: pre-existing adaptable
observational heuristics for inferring latent interior structure from
$\{o(\tau), u(\tau)\}_{\tau \le t}$, without direct access to endogenous
variables.

Each $\mathcal{I}$ maps observation to hypothesis:

$$\mathcal{I}[o,u] \mapsto \hat{\mathcal{C}}(t)$$

and carries a **perturbativity** scalar $\pi_{\mathcal{I}} \in [0,1]$,
estimating risk of interior alteration.

<div class="longtable">

@ \>

p(- 8) \* \>

p(- 8) \* \>

p(- 8) \* \>

p(- 8) \* \>

p(- 8) \* @

Abbr.

&

Name

&

Modes

&

$\pi_{\mathcal{I}}$

&

Risk Summary

  
EO & Ethology & Pre, Au, Al & 0.1 & Passive observation  
AP & Autopoiesis & Pre, Au & 0.2 & Low coupling, viability focus  
AI & Alignment Interpretation & Al, Se & 0.4 & May shift value
structure  
DS & Developmental Scaffolding & Au, Al, Se & 0.6 & Interactive
modulation  
PL & Phenomenology & Se & 0.7 & Elicits reflective affect  
NH & Narrative Hermeneutics & Se & 0.8 & Alters symbolic self-model  
PA & Psychoanalysis & Se & 0.9 & Destabilizes to reintegrate  

</div>

**Perturbativity estimate**:

$$\pi_{\mathcal{I}} \approx \mathbb{E}\bigl[\|\Delta \alpha\| + \|\Delta a\| + \Delta C_d\bigr]$$

evaluated over short windows under controlled uncertainty.

These disciplines enable inference under opacity by balancing
**interpretive depth** against **stability risk**.

<div class="center">

------------------------------------------------------------------------

</div>

<div id="clarifications">

## 9. Clarifications

</div>

1.  **Abstraction**: interior variables are high-level indices.  

2.  **Scalars**: $\alpha,\sigma$ summarize, not reduce, rich interior
    dynamics.  

3.  **Drive Integration**: $\lambda_i$ encodes tension in preference
    incorporation.  

4.  **Opacity**: true interior state is private to the agent.  

5.  **Exploration**: $J(u)$ admits non-instrumental choices via
    $P^{\rm end}$.  

6.  **Context**: enters through $o$, belief updates, and drive
    modulators $h_i$.  

7.  **Endogenous Values**: all $w_p$ arise from agent’s own loop,
    grounding its normativity internally.  

8.  **Reflexivity**: presupposes affect, belief, value as grounding
    capacities.  

9.  **Counterfactuals**: SCM “do(·)” probes latent interior variables.  

10. **Anti-reduction**: preserves coherence without collapsing interior
    richness.
