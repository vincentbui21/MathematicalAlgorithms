# 📊 DSP Lab – N-Point DFT (512-Point Spectrum)

> **Goal** : Compute and visualize the **512-point Discrete Fourier Transform (DFT)** of a two-tone signal. Understand how changing the DFT length affects **frequency resolution** and the resulting magnitude and phase spectra.

---

## 🧪 Overview

* Signal: x(t)=sin⁡(2π15t)+sin⁡(2π40t)x(t) = \sin(2 \pi 15 t) + \sin(2 \pi 40 t)**x**(**t**)**=**sin**(**2**π**15**t**)**+**sin**(**2**π**40**t**)
* Sampling rate: Fs=100 HzF_s = 100\,\text{Hz}**F**s=**100**Hz, duration: 10 s (1000 samples)
* DFT size: N=512N = 512**N**=**512**
* Tasks:
  1. Compute 512-point DFT using `fft(x, n)`
  2. Plot **magnitude** and **phase** spectra
  3. Observe frequency resolution improvement compared to standard DFT

---

## ▶️ MATLAB Code

<pre class="overflow-visible!" data-start="785" data-end="1599"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>clc; clear; close all;

</span><span>% Parameters</span><span>
Fs = </span><span>100</span><span>;                           </span><span>% Sampling frequency (Hz)</span><span>
t  = </span><span>0</span><span>:</span><span>1</span><span>/Fs:</span><span>10</span><span>-1</span><span>/Fs;                </span><span>% Time vector (0 to 9.99 s)</span><span>

</span><span>% Original two-tone signal</span><span>
x = </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>15</span><span>*t) + </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>40</span><span>*t);

</span><span>% 512-point DFT</span><span>
n = </span><span>512</span><span>;
y = fft(x, n);
m = </span><span>abs</span><span>(y);

</span><span>% Clean small magnitudes to avoid round-off noise</span><span>
y(m < </span><span>1e-6</span><span>) = </span><span>0</span><span>;
p = </span><span>unwrap</span><span>(</span><span>angle</span><span>(y));               </span><span>% Phase (radians)</span><span>

</span><span>% Frequency vector</span><span>
f = (</span><span>0</span><span>:n</span><span>-1</span><span>) * Fs / n;

</span><span>% Plot results</span><span>
</span><span>figure</span><span>;

subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>1</span><span>);
</span><span>plot</span><span>(f, m);
grid on;
title(</span><span>'Magnitude Spectrum'</span><span>);
xlabel(</span><span>'Frequency (Hz)'</span><span>); ylabel(</span><span>'|Y(f)|'</span><span>);
xlim([</span><span>0</span><span> Fs]);
ax = gca; ax.XTick = [</span><span>15</span><span></span><span>40</span><span></span><span>60</span><span></span><span>85</span><span>];

subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>2</span><span>);
</span><span>plot</span><span>(f, p * </span><span>180</span><span>/</span><span>pi</span><span>);
grid on;
title(</span><span>'Phase Spectrum'</span><span>);
xlabel(</span><span>'Frequency (Hz)'</span><span>); ylabel(</span><span>'Phase (deg)'</span><span>);
xlim([</span><span>0</span><span> Fs]);
ax = gca; ax.XTick = [</span><span>15</span><span></span><span>40</span><span></span><span>60</span><span></span><span>85</span><span>];
</span></span></code></div></div></pre>

---

## 📈 Expected Results

* Two strong spectral peaks at **15 Hz** and  **40 Hz** .
* Finer frequency spacing (Δf=Fs/N=0.195Hz\Delta f = F_s / N = 0.195 Hz**Δ**f**=**F**s****/**N**=**0.195**Hz**) provides **smoother, more detailed** plots.
* The **phase plot** shows the unwrapped phase angles, continuous over frequency.
* Reducing tiny magnitudes helps eliminate numerical noise near zero.

---

## 🧠 Key Takeaways

* Increasing the **DFT length (N)** improves **frequency resolution** but increases computational cost.
* The **FFT length** need not match the signal length—it can be any convenient power of two.
* Unwrapping phase gives a **continuous representation** of the signal’s phase response.
* Useful in  **spectral analysis** ,  **audio signal processing** , and **filter design** tasks where resolution matters.
