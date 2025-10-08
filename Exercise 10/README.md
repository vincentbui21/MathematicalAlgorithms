# 📊 DSP Lab – Moving‑Average FIR Filters (5‑point & 9‑point)

> **Goal** : Compute and visualize frequency responses and pole‑zero maps for **5‑point** and **9‑point** **moving‑average FIR** filters. Compare FIR and IIR filters.

---

## 🧪 What’s in this repo

* MATLAB script (`maf_demo.m`) to:
  * Compute frequency response via `freqz`
  * Compute zeros/poles/gain using `roots` or `tf2zpk`
  * Plot:
    * Magnitude response for 5‑pt & 9‑pt MAF
    * Pole-zero diagrams for 5‑pt & 9‑pt MAF
* Notes on **FIR vs IIR filters**
* This README with instructions and explanations

---

## ▶️ How to run

1. Open MATLAB.
2. Place `maf_demo.m` in your working folder.
3. Run:
   <pre class="overflow-visible!" data-start="806" data-end="834"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>maf_demo
   </span></span></code></div></div></pre>
4. You’ll see four figures:
   * **5‑pt** magnitude response
   * **5‑pt** pole‑zero plot
   * **9‑pt** magnitude response
   * **9‑pt** pole‑zero plot

---

## 🧷 Core MATLAB snippet

<pre class="overflow-visible!" data-start="1028" data-end="1594"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>% FIR coefficients</span><span>
b1 = </span><span>ones</span><span>(</span><span>1</span><span>,</span><span>5</span><span>); a1 = </span><span>1</span><span>;
b2 = </span><span>ones</span><span>(</span><span>1</span><span>,</span><span>9</span><span>); a2 = </span><span>1</span><span>;

</span><span>% Frequency response</span><span>
[H1,w1] = freqz(b1,a1,</span><span>2048</span><span>);
[H2,w2] = freqz(b2,a2,</span><span>2048</span><span>);

</span><span>% Zeros/Poles/Gain</span><span>
z1 = roots(b1); p1 = roots(a1); k1 = b1(</span><span>1</span><span>)/a1(</span><span>1</span><span>);
z2 = roots(b2); p2 = roots(a2); k2 = b2(</span><span>1</span><span>)/a2(</span><span>1</span><span>);

</span><span>% Plots</span><span>
</span><span>figure</span><span>; 
subplot(</span><span>2</span><span>,</span><span>2</span><span>,</span><span>1</span><span>), </span><span>plot</span><span>(w1/</span><span>pi</span><span>,</span><span>abs</span><span>(H1)); grid on; title(</span><span>'5‑pt MAF |H|'</span><span>);
subplot(</span><span>2</span><span>,</span><span>2</span><span>,</span><span>2</span><span>), zplane(b1,a1); axis equal; title(</span><span>'5‑pt MAF PZ'</span><span>);
subplot(</span><span>2</span><span>,</span><span>2</span><span>,</span><span>3</span><span>), </span><span>plot</span><span>(w2/</span><span>pi</span><span>,</span><span>abs</span><span>(H2)); grid on; title(</span><span>'9‑pt MAF |H|'</span><span>);
subplot(</span><span>2</span><span>,</span><span>2</span><span>,</span><span>4</span><span>), zplane(b2,a2); axis equal; title(</span><span>'9‑pt MAF PZ'</span><span>);
</span></span></code></div></div></pre>

> ✅ For unity DC gain:
>
> `b1 = ones(1,5)/5; b2 = ones(1,9)/9;`

---

## 📈 Expected results

* Moving‑average FIR = **low‑pass filter**
* Longer window (9‑pt vs 5‑pt):
  * Narrower main lobe → sharper low-pass
  * More zeros on unit circle → deeper stopband nulls
* Pole‑zero map:
  * All zeros on or inside the unit circle
  * FIR is inherently **stable** (no feedback poles)

---

## 🧠 FIR vs IIR – quick guide

### 🔷 FIR

* Output depends only on a **finite number of past inputs**
* Linear phase possible → minimal phase distortion
* Always **BIBO stable**
* May require more taps for sharp filters → higher computation

### 🔶 IIR

* Output depends on **past inputs + past outputs**
* Sharp roll‑off with lower order → efficient
* Poles must stay **inside unit circle** → stability matters
* Phase is generally nonlinear, sensitive to quantization

> 💡 Rule of thumb: **FIR** → linear phase & guaranteed stability.
>
> **IIR** → steep roll-off with fewer taps, but must manage stability.

---

## 📚 Notes & tips

* `freqz(b,a,N)` → frequency response over ω ∈ [0,π]
* `zplane(b,a)` → visualize zeros (○) and poles (×)
* Moving-average transfer function (length L):

  H(z)=1L∑n=0L−1z−n=1−z−LL(1−z−1)H(z) = \frac{1}{L} \sum_{n=0}^{L-1} z^{-n} = \frac{1 - z^{-L}}{L(1 - z^{-1})}**H**(**z**)**=**L**1****n**=**0**∑**L**−**1****z**−**n**=**L**(**1**−**z**−**1**)**1**−**z**−**L**
  Zeros at L-th roots of unity (except z=1), poles at origin (or none if `a=1`)
* If “Transfer function not proper” with `tf2zp`, switch to:

<pre class="overflow-visible!" data-start="3036" data-end="3121"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>[z,p,k] = tf2zpk(b,a);  </span><span>% or</span><span>
z = roots(b); p = roots(a); k = b(</span><span>1</span><span>)/a(</span><span>1</span><span>);
</span></span></code></div></div></pre>

---

### 🌟 Quick Reflection

* Longer FIR windows = sharper low-pass, deeper stopband nulls
* FIR = safe, linear-phase; IIR = efficient, but poles need care
* Pole-zero plots give immediate intuition on filter behavior
* MATLAB makes visualization fast and confirms theoretical expectations
