# 📊 DSP Lab – FFT of Two Sine Waves

> **Goal** : Compute and visualize the time-domain and frequency-domain representation of a signal composed of two sine waves using MATLAB.

---

## 🧪 Overview

* Signal: x(t)=sin⁡(2π50t)+sin⁡(2π75t)x(t) = \sin(2 \pi 50 t) + \sin(2 \pi 75 t)**x**(**t**)**=**sin**(**2**π**50**t**)**+**sin**(**2**π**75**t**)
* Time vector: t∈[0,2]t \in [0, 2]**t**∈**[**0**,**2**]** s, sampling rate 1000 Hz
* Tasks:
  1. Plot **time-domain signal** (zoomed)
  2. Compute  **FFT** , take absolute value
  3. Use `fftshift` to center zero frequency
  4. Plot **frequency-domain representation**

---

## ▶️ MATLAB Code

<pre class="overflow-visible!" data-start="637" data-end="1249"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>clc; clear all; close all;

</span><span>% Time vector</span><span>
t = </span><span>0</span><span>:</span><span>1</span><span>/</span><span>1000</span><span>:</span><span>2</span><span>; </span><span>% 0 to 2 s, 1000 Hz sampling</span><span>

</span><span>% Two-tone signal: 50 Hz + 75 Hz</span><span>
x = </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>50</span><span>*t) + </span><span>sin</span><span>(</span><span>2</span><span>*</span><span>pi</span><span>*</span><span>75</span><span>*t);

</span><span>% Time-domain plot (zoomed)</span><span>
subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>1</span><span>);
</span><span>plot</span><span>(t(</span><span>1001</span><span>:</span><span>1200</span><span>), x(</span><span>1001</span><span>:</span><span>1200</span><span>));
grid on;
title(</span><span>'Sin(2\pi50t) + Sin(2\pi75t)'</span><span>);
xlabel(</span><span>'Time (s)'</span><span>);

</span><span>% Frequency-domain plot</span><span>
subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>2</span><span>);
X = fft(x);          </span><span>% FFT</span><span>
X2 = fftshift(X);    </span><span>% Center zero frequency</span><span>

f = </span><span>linspace</span><span>(</span><span>-500</span><span>, </span><span>500</span><span>, </span><span>length</span><span>(X)); </span><span>% Frequency vector</span><span>
</span><span>plot</span><span>(f, </span><span>abs</span><span>(X2));
grid on;
title(</span><span>'Frequency-domain representation of Sin(2\pi50t) + Sin(2\pi75t)'</span><span>);
xlabel(</span><span>'Frequency (Hz)'</span><span>);
</span></span></code></div></div></pre>

---

## 📈 Expected Results

* **Time-domain** : Superposition of 50 Hz and 75 Hz sine waves; waveform shows beat pattern.
* **Frequency-domain** : Two distinct peaks at ±50 Hz and ±75 Hz, symmetric around zero due to `fftshift`.
* Magnitude plot shows how energy is distributed across the two frequency components.

---

## 🧠 Key Takeaways

* FFT reveals **individual frequency components** in a multi-tone signal.
* `fftshift` helps visualize negative and positive frequencies symmetrically.
* Time-domain sampling rate determines frequency resolution and maximum observable frequency (Nyquist).
* Practical for analyzing  **audio signals, communications, and mixed-frequency sensor data** .
