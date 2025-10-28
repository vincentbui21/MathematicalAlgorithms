# Lab 1: Image as a 2D Signal

### Sampling, Quantization, Histograms, and Enhancement

This MATLAB lab demonstrates how images can be treated as two-dimensional discrete signals.
It explores the effects of **sampling**, **quantization**, **contrast stretching**, **gamma correction**, and **aliasing**, helping visualize key digital image processing concepts.

---

## 🧩 Overview

The lab script performs the following steps:

1. **Load and Inspect an Image**

   - Loads `peppers.png` (or `cameraman.tif` as a fallback)
   - Converts RGB to grayscale
   - Displays image information (class, range, dimensions)
2. **Quantization and Dynamic Range**

   - Simulates lower bit-depths (~6-bit, ~4-bit)
   - Demonstrates visible banding and loss of detail from reduced quantization levels
3. **Histogram and Contrast Stretching**

   - Displays original histogram
   - Normalizes image to [0,1] using `mat2gray`
   - Applies contrast stretching with `imadjust`
   - Shows how pixel intensity distribution changes
4. **Gamma Correction**

   - Applies nonlinear intensity transformations with γ=0.6 and γ=1.6
   - Illustrates how gamma < 1 brightens and gamma > 1 darkens the image
5. **Sampling and Aliasing**

   - Downsamples and upsamples the image using nearest-neighbor interpolation
   - Demonstrates aliasing artifacts caused by undersampling (violating the Nyquist rate)
   - Optional: compare with bilinear interpolation to show smoother results
6. **(Optional) Moiré Pattern Demonstration**

   - Suggested experiment with high-frequency textured images to visualize interference effects
7. **Reflection Questions**
   Include short written answers in your lab report:

   - How does reduced bit depth cause visible banding/posterization?
   - How does contrast stretching affect the histogram and visibility of details?
   - Why does aggressive downsampling cause aliasing? (Hint: Nyquist sampling theorem)

---

## 🧠 Learning Objectives

By completing this lab, you will:

- Understand how **quantization** affects image quality
- Visualize **histogram equalization** and **contrast enhancement**
- Recognize **gamma correction** as a nonlinear intensity transformation
- Observe **aliasing artifacts** resulting from spatial undersampling
- Relate image processing to signal processing principles (sampling theory)

---

## 🧰 Requirements

- MATLAB R2020b or later
- Image Processing Toolbox
- Example images: `peppers.png`, `cameraman.tif` (bundled with MATLAB)

---

## ▶️ How to Run

1. Place `code.m` in your working directory
2. Open MATLAB and navigate to the folder
3. Run:
   ```matlab
   >> code.m
   ```


4. Observe the generated figures and note your observations for the report.

---

## 📂 Output

The script produces:

* Grayscale and RGB image displays
* Quantization comparison montage
* Original and contrast-stretched histograms
* Gamma correction montage
* Downsampling and aliasing examples

Each section automatically opens in a new figure window.
