# Z-Transform Lab (Week 3) — MATLAB

## 📌 Overview

This lab explores **Z-transforms** for finite and infinite sequences, properties of linearity and shifting, inverse transforms, and analyzing digital filters using MATLAB. Tasks cover:

1. Finite sequences → polynomial representation
2. Infinite sequences → ROC analysis
3. Linearity & time-shifting
4. Inverse Z-transform
5. Filter analysis → poles, zeros, magnitude & phase response

MATLAB symbolic tools are used to compute Z-transforms, inverses, and visualize filter properties.

---

## 📝 Task Summaries, Results & Reflections

### **A1 – Finite Sequences**

* **Sequences:**

  i) `x[n] = {1,2,5}` → `X(z) = 1 + 2 z^-1 + 5 z^-2`

  ii) `x[n] = {0,3,0,4}` → `X(z) = 0 + 3 z^-1 + 0 z^-2 + 4 z^-3`
* **MATLAB check:** Used `syms n z` → symbolic polynomials matched sequences.
* **Observation:** Finite sequences have  **ROC = entire z-plane except z=0** .
* **Reflection:** Finite sequences are straightforward to analyze and plot. ROC is simple because there are no infinite terms. It shows how Z-transform reduces to a regular polynomial.

---

### **A2 – Infinite Sequences & ROC**

* **x[n] = a^n u[n], a = 0.6** → `X(z) = 1 / (1 - 0.6 z^-1), |z|>0.6`
* **x[n] = (-0.8)^n u[n]** → `X(z) = 1 / (1 + 0.8 z^-1), |z|>0.8`
* **x[n] = -(0.9)^n u[-n-1]** → left-sided, `X(z) = -1 / (1 - 0.9 z^-1), |z|<0.9`
* **Reflection:** ROC depends on sequence type; right-sided sequences converge outside the largest pole, left-sided inside. This clarified how ROC is linked to stability and convergence.

---

### **A3 – Properties: Linearity & Shifting**

* **Linearity:** `Z{2x1[n]-3x2[n]} = 2*Z{x1[n]} - 3*Z{x2[n]}`
* **Time shift:** `Z{x1[n-3]} = z^-3 * Z{x1[n]}`
* Verified with `ztrans()` in MATLAB symbolic toolbox.
* **Reflection:** Linearity and shifting are easy to implement in MATLAB. Observing results symbolically reinforced understanding of basic Z-transform properties.

---

### **A4 – Inverse Z-Transform**

* **X(z) = 1 / (1 - 0.7 z^-1)** → `x[n] = 0.7^n u[n]`
* **X(z) = (1 - 0.5 z^-1) / (1 - 0.8 z^-1)** → `x[n] = 0.8^n - 0.5*0.8^(n-1) u[n-1]`
* **Reflection:** MATLAB makes inversion straightforward. Visualizing poles and ROC helps predict sequence behavior without calculation.

---

### **A5 – H(z) Filter Analysis**

* **H(z) = (1 − 2.4 z^-1 + 2.88 z^-2) / (1 − 0.8 z^-1 + 0.64 z^-2)**
* **Poles/Zeros:** Plotted using `zplane()`; all poles inside unit circle → stable.
* **Magnitude & Phase:** Plotted with `freqz()`.
* **Filter Type:** Band-pass. Zeros near ±1 cancel low/high frequencies; poles near unit circle define passband.
* **Reflection:** Pole-zero diagrams directly reveal stability and filter type. Frequency plots confirmed intuition, showing how MATLAB connects theory to observable behavior.

---

## 🧪 MATLAB Notes

* Used `syms n z` for symbolic Z-transforms.
* Used `ztrans()` & `iztrans()` for forward/inverse transforms.
* Plotted poles/zeros (`zplane`) and frequency responses (`freqz`) for filter characterization.

---

## 📂 Deliverables

* MATLAB `.m` scripts for all tasks.
* Screenshots
* README.md with explanations and reflections.
