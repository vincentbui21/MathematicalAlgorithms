# 📊 DSP Lab – DFT of Two-Tone Signal

> **Goal** : Compute and visualize the **Discrete Fourier Transform (DFT)** of a signal composed of two sine waves. Analyze its **magnitude** and **phase** spectra in MATLAB.

---

## 🧪 Overview

* Signal: x(t)=sin⁡(2π15t)+sin⁡(2π40t)x(t) = \sin(2 \pi 15 t) + \sin(2 \pi 40 t)**x**(**t**)**=**sin**(**2**π**15**t**)**+**sin**(**2**π**40**t**)
* Time vector: t∈[0,10)t \in [0, 10)**t**∈**[**0**,**10**)** s, sampling rate 100 Hz
* Tasks:
  1. Plot **time-domain signal**
  2. Compute **DFT** using `fft`
  3. Calculate **magnitude** and **phase** spectra
  4. Clean small numerical artifacts

---

## ▶️ MATLAB Code

<pre class="overflow-visible!" data-start="652" data-end="1369"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>clc; clear all; close all;

</span><span>% Time vector</span><span>
t = </span><span>0</span><span>:</span><span>1</span><span>/</span><span>100</span><span>:</span><span>10</span><span>-1</span><span>/</span><span>100</span><span>;   </span><span>% 0 to 9.99 s, 100 Hz sampling</span><span>

</span><span>% Two-tone signal: 15 Hz + 40 Hz</span><span>
x = </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>15</span><span>*t) + </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>40</span><span>*t);

</span><span>% Time-domain plot</span><span>
subplot(</span><span>3</span><span>,</span><span>1</span><span>,</span><span>1</span><span>);
</span><span>plot</span><span>(t, x);
grid on;
title(</span><span>'Original Signal'</span><span>);
xlabel(</span><span>'Time (s)'</span><span>);

</span><span>% DFT</span><span>
y = fft(x);

</span><span>% Magnitude and Phase</span><span>
m = </span><span>abs</span><span>(y);
p = </span><span>angle</span><span>(y);

</span><span>% Remove round-off noise</span><span>
y(m < </span><span>1e-6</span><span>) = </span><span>0</span><span>;
m(m < </span><span>1e-6</span><span>) = </span><span>0</span><span>;
p(m == </span><span>0</span><span>) = </span><span>0</span><span>;

</span><span>% Frequency vector</span><span>
f = (</span><span>0</span><span>:</span><span>length</span><span>(y)</span><span>-1</span><span>) * </span><span>100</span><span> / </span><span>length</span><span>(y);

</span><span>% Plot Magnitude</span><span>
subplot(</span><span>3</span><span>,</span><span>1</span><span>,</span><span>2</span><span>);
</span><span>plot</span><span>(f, m);
title(</span><span>'Magnitude Spectrum'</span><span>);
ax = gca; ax.XTick = [</span><span>15</span><span></span><span>40</span><span></span><span>60</span><span></span><span>85</span><span>];

</span><span>% Plot Phase</span><span>
subplot(</span><span>3</span><span>,</span><span>1</span><span>,</span><span>3</span><span>);
</span><span>plot</span><span>(f, p*</span><span>180</span><span>/</span><span>pi</span><span>);
title(</span><span>'Phase Spectrum (degrees)'</span><span>);
ax = gca; ax.XTick = [</span><span>15</span><span></span><span>40</span><span></span><span>60</span><span></span><span>85</span><span>];
</span></span></code></div></div></pre>

---

## 📈 Expected Results

* **Time-domain** : Superposition of 15 Hz and 40 Hz sine waves; waveform repeats periodically.
* **Magnitude spectrum** : Peaks at 15 Hz and 40 Hz (main frequency components).
* **Phase spectrum** : Shows phase angles of the frequency components; small values near zero elsewhere.
* Cleaning small magnitudes reduces numerical noise and makes the phase plot easier to interpret.

---

## 🧠 Key Takeaways

* DFT allows us to **analyze frequency content** of discrete signals.
* Magnitude spectrum identifies  **dominant frequencies** ; phase spectrum gives  **relative timing information** .
* Proper sampling and frequency resolution are essential for accurate spectral representation.
* Useful for  **signal processing, communications, and vibration analysis** .
