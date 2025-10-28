# Lab 3 – Frequency-Domain Filtering with `fft2`

**Course:** Mathematical Algorithms (DSP) — Image Processing Labs

## Overview

In this lab, we explored **frequency-domain filtering** of images using MATLAB’s `fft2` function. The main objectives were:

* To visualize the **magnitude spectrum** of an image.
* To implement **Ideal and Gaussian low-pass filters (LPFs)** in the frequency domain.
* To observe the effects of  **high-pass filtering** .
* To compare **spatial-domain Gaussian filtering** with  **frequency-domain Gaussian filtering** .

Frequency-domain filtering leverages the  **convolution theorem** , where convolution in the spatial domain corresponds to multiplication in the frequency domain.

---

## Sections

### 1. Magnitude Spectrum

* Applied `fft2` to the grayscale image.
* Used `fftshift` to center the zero-frequency component.
* Plotted the **log-magnitude spectrum** to visualize frequency content.

**Observation:**

The central region contains low frequencies, while edges and fine details correspond to high frequencies farther from the center.

---

### 2. Ideal & Gaussian Low-Pass Filters

* Constructed circular  **ideal LPF** : passes frequencies inside radius `D0`.
* Constructed  **Gaussian LPF** : smooth decay of frequency response using `sigma`.

**Observation:**

* Ideal LPF has a  **hard cutoff** , which can cause ringing artifacts (Gibbs phenomenon).
* Gaussian LPF produces  **smoother results** .

---

### 3. Applying LP Filters in Frequency Domain

* Filtered the image by multiplying the FFT with LPF masks, then applied `ifft2` to return to the spatial domain.
* Compared **Ideal LP** vs **Gaussian LP** results using `montage`.

**Observation:**

* Ideal LP shows **ringing** around edges due to sharp frequency cutoff.
* Gaussian LP maintains **smooth transitions** without noticeable ringing.

---

### 4. High-Pass Filter via Complement

* Created **high-pass filter** as `1 - Gaussian LPF`.
* Applied to the image in frequency domain.
* Result highlights  **edges and fine details** , suppressing low-frequency content.

---

### 5. Spatial vs Frequency-Domain Gaussian LP

* Built a **spatial-domain Gaussian kernel** using `fspecial`.
* Applied convolution with `imfilter`.
* Compared with  **frequency-domain Gaussian LP** .

**Observation:**

* The results are nearly identical, confirming  **convolution theorem** .
* Maximum numerical difference was negligible (`≈ 3.33e-16`).

---

### 6. Reflections / Questions

1. **Why does Ideal LP cause ringing (Gibbs phenomenon)?**
   * Ideal LP has an abrupt frequency cutoff. In the spatial domain, this corresponds to  **sinc-like oscillations** , which appear as ringing near edges.
2. **What does `fftshift` do visually?**
   * `fftshift` moves the **zero-frequency component** to the **center** of the image.
   * This makes it easier to visualize frequency content, with low frequencies in the center and high frequencies at the edges.
3. **When is frequency-domain filtering computationally preferable?**
   * For  **large kernels** , frequency-domain filtering is faster because multiplication in frequency domain (`O(N log N)` with FFT) is more efficient than spatial convolution (`O(N^2)` for large kernels).
   * It is especially advantageous for **images with large dimensions** or  **filters with large support** .

---

## Usage / How to Run

1. Make sure `peppers.png` is in the working directory, or the code will fall back to `cameraman.tif`.
2. Run `code.m` in MATLAB.
3. Observe all figures generated: magnitude spectrum, LP/HP filtered images, and spatial vs frequency-domain comparison.
