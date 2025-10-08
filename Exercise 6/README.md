# 📊 DSP Lab – FFT of a Sine Wave

> **Goal** : Compute and visualize the time-domain and frequency-domain representation of a sine wave using MATLAB.

---

## 🧪 Overview

* Signal: x(t)=sin⁡(2π50t)x(t) = \sin(2 \pi 50 t)**x**(**t**)**=**sin**(**2**π**50**t**)
* Time vector: t∈[−1,1]t \in [-1, 1]**t**∈**[**−**1**,**1**], step 0.001 s
* Tasks:
  1. Plot **time-domain signal**
  2. Compute  **FFT** , take absolute value
  3. Use `fftshift` to center zero frequency
  4. Plot **frequency-domain representation**

---

## ▶️ MATLAB Code

<pre class="overflow-visible!" data-start="574" data-end="1117"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>clc; clear all; close all;

</span><span>% Time vector</span><span>
t = </span><span>-1</span><span>:</span><span>0.001</span><span>:</span><span>1</span><span>;

</span><span>% Sine wave: 50 Hz</span><span>
x = </span><span>sin</span><span>(</span><span>2</span><span> * </span><span>pi</span><span> * </span><span>50</span><span> * t);

</span><span>% Time-domain plot (zoomed)</span><span>
subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>1</span><span>);
</span><span>plot</span><span>(t(</span><span>1001</span><span>:</span><span>1200</span><span>), x(</span><span>1001</span><span>:</span><span>1200</span><span>));
grid on;
title(</span><span>'Sin(2\pi50t)'</span><span>);
xlabel(</span><span>'Time (s)'</span><span>);

</span><span>% Frequency-domain plot</span><span>
subplot(</span><span>2</span><span>,</span><span>1</span><span>,</span><span>2</span><span>);
X = </span><span>abs</span><span>(fft(x));         </span><span>% Magnitude of FFT</span><span>
X2 = fftshift(X);        </span><span>% Shift zero frequency to center</span><span>

f = </span><span>-499.9</span><span>:</span><span>1000</span><span>/</span><span>2001</span><span>:</span><span>500</span><span>; </span><span>% Frequency vector</span><span>
</span><span>plot</span><span>(f, X2);
grid on;
title(</span><span>'Frequency-domain representation of Sin(2\pi50t)'</span><span>);
xlabel(</span><span>'Frequency (Hz)'</span><span>);
</span></span></code></div></div></pre>

---

## 📈 Expected Results

* **Time-domain** : A smooth 50 Hz sine wave, zoomed for clarity.
* **Frequency-domain** : Two peaks at ±50 Hz, symmetric around 0 due to `fftshift`.
* FFT magnitude shows how the sine wave energy is concentrated at its fundamental frequency.

---

## 🧠 Key Takeaways

* `fft` computes discrete Fourier transform efficiently.
* `fftshift` centers the zero frequency for visualization.
* Time and frequency resolution depends on **sampling rate** and  **vector length** .
* Useful for analyzing signals in  **communications, audio, and sensor data** .
