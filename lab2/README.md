# Lab 2: 2D Convolution & FIR Filters (Blur, Sharpen, Edges)

**Course:** Mathematical Algorithms (DSP) — Image Processing Labs

**Author:** Vincent Bui

This lab demonstrates 2D convolution operations on images, exploring blur, sharpening, edge detection, and the effects of different kernels and boundary handling.

---

## Table of Contents

1. [Delta Image &amp; Impulse Response](#1-delta-image--impulse-response)
2. [Low-pass Filtering: Box vs Gaussian](#2-low-pass-filtering-box-vs-gaussian)
3. [Unsharp Masking (Sharpening)](#3-unsharp-masking-sharpening)
4. [Edge Detection: Sobel &amp; Laplacian](#4-edge-detection-sobel--laplacian)
5. [Correlation vs Convolution](#5-correlation-vs-convolution)
6. [Boundary Handling](#6-boundary-handling)
7. [Reflections &amp; Discussion](#7-reflections--discussion)

---

## 1) Delta Image & Impulse Response

* Created a 101x101 delta image (`delta`) with a single pixel set to 1 in the center.
* Applied a 3x3 average filter to visualize the impulse response.
* **Observation:** The impulse response shows the spatial pattern of the kernel, confirming the averaging effect.

---

## 2) Low-pass Filtering: Box vs Gaussian

* Implemented 3x3 and 7x7 box filters and a separable Gaussian filter (`sigma=1.2`).
* Applied filters using `imfilter` with `'replicate'` boundary handling.
* **Observation:**
  * Box filters blur uniformly but may produce blocky effects with larger kernels.
  * Gaussian filters give smoother blurring due to weighted averaging and better frequency response.
  * **Separable Gaussian:** Reduces computational cost by performing two 1D convolutions instead of a full 2D convolution.

---

## 3) Unsharp Masking (Sharpening)

* Computed a high-frequency mask: `mask = I - I_blur`.
* Enhanced edges: `I_sharp = I + gain*mask`.
* **Observation:** Sharpened image highlights details while preserving the overall image structure.

---

## 4) Edge Detection: Sobel & Laplacian

* Sobel kernels applied to detect horizontal (`Gx`) and vertical (`Gy`) edges.
* Gradient magnitude computed as `Gmag = hypot(Gx, Gy)`.
* Laplacian kernel detects regions of rapid intensity change.
* **Observation:**
  * Sobel emphasizes directional edges.
  * Laplacian emphasizes all edges regardless of direction.

---

## 5) Correlation vs Convolution

* Compared `conv2` and `imfilter` with convolution mode:

<pre class="overflow-visible!" data-start="2532" data-end="2658"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>C1 = conv2(I, h_box3, </span><span>'same'</span><span>);  
C2 = imfilter(I, h_box3, </span><span>'conv'</span><span>, </span><span>'same'</span><span>);  
diff_val = </span><span>max</span><span>(</span><span>abs</span><span>(C1(:) - C2(:)));
</span></span></code></div></div></pre>

* **Result:** `diff_val` is near zero → confirms equivalence.
* **Observation:** Convolution flips the kernel; correlation does not.

---

## 6) Boundary Handling

* Compared `'replicate'`, `'symmetric'`, and `'circular'` modes:
  * **Replicate:** Extends edge pixels.
  * **Symmetric:** Mirrors image at the boundary.
  * **Circular:** Wraps the image around.
* **Observation:** Boundary mode affects corners and edges, especially for large kernels.

---

## 7) Reflections & Discussion

1. **Why is Gaussian preferred over large box low-pass?**
   * Gaussian has a smoother frequency response, reducing ringing and artifacts.
   * Box filters can introduce blocky blur and less natural smoothing.
2. **What does separability do for computational cost?**
   * A 2D separable filter of size NxN requires `2*N` operations per pixel (two 1D passes) instead of `N^2` for a full 2D convolution.
   * This significantly improves efficiency for large kernels.
3. **How do boundary modes change corners/edges?**
   * `'Replicate'` extends edge values → may create flat borders.
   * `'Symmetric'` mirrors content → smoother transitions at borders.
   * `'Circular'` wraps image → can introduce discontinuities if the image edges differ.

---

**Usage:**

* Run `code.m` in MATLAB.
* Each section generates a figure for visual inspection.
* Screenshots of outputs can be added to the GitHub repository for submission.
