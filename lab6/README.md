# Lab 6 - Mini Project: Image Processing Pipeline

## Goal

Combine all learned DSP-image concepts — filtering, frequency-domain processing, edge detection, and enhancement — into one compact image analysis pipeline.

---

## Learning outcomes

* Integrate spatial and frequency-domain operations in a single workflow.
* Apply appropriate filters for denoising and enhancement.
* Perform feature extraction (edges) and frequency masking.
* Interpret how each stage affects image quality and information.

---

## MATLAB function - `code.m`

```matlab
function image_pipeline()
    % Load your own image (object, face, landscape, etc.)
    I = im2double(rgb2gray(imread('peppers.png')));

    % Pre-process: noise removal
    I_filt = medfilt2(I, [3 3]);

    % Enhance contrast
    I_enh = imadjust(I_filt, [0.2 0.8], [0 1]);

    % Extract features (edges)
    edges = edge(I_enh, 'Canny', [0.1 0.25]);

    % Optional frequency-domain mask
    F = fftshift(fft2(I_enh));
    [M, N] = size(F);
    [u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
    H = double(sqrt(u.^2 + v.^2) < 60);
    I_lp = real(ifft2(ifftshift(F .* H)));

    % Visualization
    figure; 
    montage({I, I_filt, I_enh, edges, I_lp}, 'Size', [1 5]);
    title('Original | Denoised | Enhanced | Edges | LP result');
end
```

---

## Explanation of the pipeline

### Step 1 - Load your image

* **Goal:** Use any grayscale image (object, face, or landscape) for testing.
* **DSP concept:** The image is treated as a 2D signal where pixel intensity represents amplitude.

### Step 2 - Noise removal (Median Filter)

* **Goal:** Reduce salt-and-pepper noise while keeping edges intact.
* **DSP concept:** Non-linear spatial filtering that replaces each pixel with the median of its neighbors, effectively removing isolated outliers.

### Step 3 - Contrast enhancement

* **Goal:** Stretch pixel intensity levels to improve contrast.
* **DSP concept:** Intensity remapping, similar to amplitude scaling in signal processing, enhances the visible range of the signal.

### Step 4 - Feature extraction (Canny Edge Detector)

* **Goal:** Identify strong edges that represent boundaries or structures.
* **DSP concept:** Gradient-based detection highlights high-frequency transitions (sharp intensity changes) in the image.

### Step 5 - Frequency-domain filtering (Low-pass mask)

* **Goal:** Demonstrate low-pass filtering in the frequency domain.
* **DSP concept:** Suppresses high-frequency details using a circular mask in the Fourier domain, resulting in a smoother output after inverse FFT.

### Step 6 - Visualization

* Displays a montage of all processing stages side-by-side:
  1. Original
  2. Denoised
  3. Enhanced
  4. Edge map
  5. Low-pass filtered result

---

## Reflections

* **Pipeline summary:** The process combines noise reduction, contrast enhancement, edge detection, and frequency-domain smoothing.
* **Improvements:** Could integrate adaptive contrast enhancement (CLAHE), or apply region-based segmentation after edge detection.
* **Limitations:** Filter parameters (thresholds, frequency cutoff) are fixed and may not work equally well on different images.
