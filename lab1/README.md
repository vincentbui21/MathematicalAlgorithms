
# Lab 1: Image as a 2D Signal

### Sampling, Quantization, Histograms, and Enhancement

This MATLAB lab explores how images can be treated as two-dimensional discrete signals.
It demonstrates key concepts in digital image processing, including **quantization**, **histogram analysis**, **gamma correction**, and **sampling theory**, and shows how each affects image appearance and quality.

---

## 🧩 Overview

The lab script performs the following steps:

1. **Load and Inspect an Image**

   - Loads `peppers.png` (or `cameraman.tif` as a fallback)
   - Converts the RGB image to grayscale
   - Prints basic image information (class, range, dimensions)
2. **Quantization and Dynamic Range**

   - Simulates lower bit-depths (~6-bit and ~4-bit)
   - Shows how reduced quantization levels cause visible artifacts and banding
3. **Histogram and Contrast Stretching**

   - Plots the histogram of the original and stretched images
   - Uses `imadjust` to enhance contrast and redistribute intensity values
4. **Gamma Correction**

   - Applies nonlinear intensity transformations with γ = 0.6 and γ = 1.6
   - Demonstrates brightening and darkening effects due to gamma correction
5. **Sampling and Aliasing**

   - Downsamples and upsamples the image using nearest-neighbor interpolation
   - Visualizes aliasing caused by undersampling (violating the Nyquist limit)
6. **(Optional) Moiré Pattern Demonstration**

   - Use a high-frequency striped texture to observe interference (Moiré) patterns
7. **Reflections and Discussion**

   - Answers key conceptual questions about the observed effects

---

## 🧠 Reflection Answers

### 1. How does reduced bit depth cause visible banding/posterization?

Reducing bit depth limits the number of available gray levels in the image.
For example, an 8-bit image has 256 intensity levels, while a 4-bit image only has 16.
When smooth gradients (like skies or shadows) are represented with too few levels, subtle transitions are lost, producing **visible bands or posterization**. This occurs because multiple nearby intensities in the original image are mapped to the same quantized value.

---

### 2. How does contrast stretching affect the histogram and visibility of details?

Contrast stretching expands the range of pixel intensities to fill the full display range (0–255).
In the histogram, this shifts and stretches the distribution toward both ends, increasing contrast between light and dark areas.
As a result, **details in low-contrast or mid-tone regions become more visible**, and the overall image appears clearer and more dynamic. However, if overstretched, it can also amplify noise or clip some details at the extremes.

---

### 3. Why does aggressive downsampling cause aliasing?

According to the **Nyquist sampling theorem**, to accurately represent a signal (or image), the sampling rate must be at least twice the highest frequency present.
When the image is downsampled too much, this condition is violated, and **high-frequency details (edges, textures)** are misinterpreted as lower-frequency patterns, producing **aliasing artifacts** such as jagged edges or false repetitive patterns.
In images, this is often seen as blocky textures or Moiré effects when upscaled again.

---

## 🧰 Requirements

- MATLAB R2020b or later
- Image Processing Toolbox
- Example images: `peppers.png` or `cameraman.tif` (included in MATLAB)

---

## ▶️ How to Run

1. Place `Lab1_Image2D.m` in your MATLAB working directory.
2. Open MATLAB and navigate to the folder.
3. Run the script:
   ```matlab
   >> code
   ```


4. Review the generated figures and note visual differences across processing steps.

---

## 📊 Output Summary

| Section | Output                   | Description                           |
| ------- | ------------------------ | ------------------------------------- |
| 0       | RGB and Grayscale images | Basic inspection                      |
| 1       | Quantized images         | 8-bit, ~6-bit, ~4-bit comparison      |
| 2       | Histogram plots          | Original vs. contrast-stretched       |
| 3       | Gamma correction montage | γ = 0.6 and γ = 1.6 effects         |
| 4       | Downsampling demo        | Aliasing artifacts from undersampling |
