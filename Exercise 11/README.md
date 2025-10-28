# 🎧 DSP Lab – FIR Filter Types (Type I–IV)

> **Goal:** Visualize and compare the **magnitude**, **phase**, and **zero-pole** characteristics of the four **linear-phase FIR filter types (I–IV)**.
> Understand how symmetry and filter length affect frequency and phase responses.

---

## 🧪 What’s in this repo

* `ex11_main.m` → MATLAB script that:
  * Defines impulse responses for FIR Types I–IV
  * Computes frequency response using `freqz`
  * Plots:
    * Magnitude response → `abs(H)`
    * Unwrapped phase → `unwrap(angle(H))`
    * Zero-pole diagram → `zplane(h,1)`
* `README.md` → Short explanation and results overview

---

## ▶️ How to run

1. Open MATLAB and place `ex11_main.m` in your working folder.
2. Run:
   ```matlab
   ex11_main
   ```

3. You’ll see a single figure with **12 subplots** (4 rows × 3 columns):
   * Left → Magnitude
   * Middle → Phase
   * Right → Zero-Pole plot


## ⚙️ Impulse responses

<pre class="overflow-visible!" data-start="1123" data-end="1366"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>h1 = [</span><span>1</span><span></span><span>2</span><span></span><span>3</span><span></span><span>4</span><span></span><span>4</span><span></span><span>3</span><span></span><span>2</span><span></span><span>1</span><span>];     </span><span>% Type I – even, symmetric</span><span>
h2 = [</span><span>1</span><span></span><span>2</span><span></span><span>3</span><span></span><span>4</span><span></span><span>3</span><span></span><span>2</span><span></span><span>1</span><span>];       </span><span>% Type II – odd, symmetric</span><span>
h3 = [</span><span>-1</span><span></span><span>-2</span><span></span><span>-3</span><span></span><span>-4</span><span></span><span>3</span><span></span><span>3</span><span></span><span>2</span><span></span><span>1</span><span>]; </span><span>% Type III – even, antisymmetric</span><span>
h4 = [</span><span>-1</span><span></span><span>-2</span><span></span><span>-3</span><span></span><span>0</span><span></span><span>3</span><span></span><span>2</span><span></span><span>1</span><span>];    </span><span>% Type IV – odd, antisymmetric</span><span>
</span></span></code></div></div></pre>

---

## 📈 Expected results

| Type | Symmetry      | Length | Linear-Phase | Use Case                   |
| ---- | ------------- | ------ | ------------ | -------------------------- |
| I    | Symmetric     | Even   | ✅           | Low-/band-pass             |
| II   | Symmetric     | Odd    | ✅           | Low-/band-pass             |
| III  | Antisymmetric | Even   | ✅           | High-pass / differentiator |
| IV   | Antisymmetric | Odd    | ✅           | High-pass / differentiator |

**Key takeaways**

* Symmetric impulse → even phase response
* Antisymmetric impulse → odd phase response
* All are **linear-phase FIR** filters
* Type I & II pass DC, Type III & IV suppress DC

---

## 🧠 Notes

* `freqz(h,1,512)` → frequency response
* `zplane(h,1)` → zero locations (FIR has poles only at origin)
* Linear-phase FIR = no phase distortion + guaranteed stability

---

**Author:** Vincent Bui

**Course:** Digital Signal Processing – Exercise 11

**Date:** October 2025
