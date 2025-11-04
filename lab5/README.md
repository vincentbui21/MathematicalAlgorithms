# Lab 5 - Edge Detection and Segmentation

## Learning outcomes

* Relate edges to high-frequency components.
* Apply gradient-based and zero-crossing operators.
* Perform automatic thresholding (Otsu) and simple segmentation.

---

## MATLAB script - `code.m`

```matlab
% Lab 5: Edge Detection and Segmentation
close all; clear; clc;
I = im2double(rgb2gray(imread('peppers.png')));

%% 1) Basic derivative filters (Sobel, Prewitt)
edges_sobel = edge(I,'Sobel');
edges_prewitt = edge(I,'Prewitt');
figure; montage({edges_sobel, edges_prewitt},'Size',[1 2]);
title('Sobel | Prewitt edges');

%% 2) Canny detector (multi-stage)
edges_canny = edge(I,'Canny',[0.05 0.2]);
figure; imshow(edges_canny); title('Canny edges');

%% 3) Laplacian of Gaussian (LoG)
edges_log = edge(I,'log');
figure; imshow(edges_log); title('Laplacian of Gaussian edges');

%% 4) Edge map -> segmentation (Otsu threshold)
level = graythresh(I); % Otsu method
BW = imbinarize(I,level);
figure; montage({I,BW},'Size',[1 2]);
title('Original | Otsu threshold binary mask');

%% 5) Label and visualize regions
[L,num] = bwlabel(BW);
RGB = label2rgb(L);
figure; imshow(RGB); title(['Labeled regions: ',num2str(num)]);

%% 6) Reflections
% - Which operator gives the thinnest, cleanest edges?
% - Why does Canny outperform simple gradient filters?
% - How does Otsu relate to histogram-based thresholding?
```

---

## What screenshots to include

* montage of Sobel and Prewitt edges.
* Canny edges figure.
* LoG edges figure.
* Original and Otsu binary mask montage.
* Colored labeled regions output.

---

## Short explanations for each section

### 1) Basic derivative filters (Sobel, Prewitt)

* **Goal** - Detect edges by approximating image gradients. Both Sobel and Prewitt compute directional derivatives and combine them to form an edge map.
* **What you should observe** - Thin edge responses highlighting object boundaries. Sobel often appears slightly smoother because its kernels weight central pixels more.
* **Why** - Edges correspond to locations of large intensity change - high-frequency components in the image.

### 2) Canny detector (multi-stage)

* **Goal** - Produce robust, thin edges using smoothing, gradient, non-maximum suppression, and hysteresis thresholding.
* **What you should observe** - Cleaner and more continuous edges than simple gradient filters.
* **Why** - Canny first smooths noise, then uses non-maximum suppression to thin edges and uses two thresholds to link strong and weak edges reliably.

### 3) Laplacian of Gaussian (LoG)

* **Goal** - Detect zero-crossings of the second derivative after smoothing - useful for finding edges where intensity curvature changes.
* **What you should observe** - Edge map that highlights transitions; sometimes more broken or wider edges compared to Canny.
* **Why** - LoG responds to second-derivative zero-crossings - it is sensitive to finer curvature changes and can detect edges missed by first-derivative operators.

### 4) Edge map -> segmentation (Otsu threshold)

* **Goal** - Convert grayscale image to a binary mask automatically using Otsu's method.
* **What you should observe** - A binary image separating foreground and background based on the image histogram.
* **Why** - Otsu finds a threshold that minimizes intra-class variance - effectively choosing a cut-point between two dominant peaks in the histogram.

### 5) Label and visualize regions

* **Goal** - Label connected components in the binary mask and visualize them with different colors.
* **What you should observe** - Distinct colored regions and a printed count of labeled regions.
* **Why** - Connected-component labeling groups adjacent foreground pixels into objects - useful for simple object counting and region analysis.

---

## Short answers to reflection questions

* **Which operator gives the thinnest, cleanest edges?**
  * Canny usually produces the thinnest and most continuous edges due to non-maximum suppression and hysteresis linking.
* **Why does Canny outperform simple gradient filters?**
  * Because Canny includes smoothing to reduce noise, non-maximum suppression to thin edges, and double-threshold hysteresis to connect edge segments reliably.
* **How does Otsu relate to histogram-based thresholding?**
  * Otsu is a histogram-based method - it assumes a bimodal intensity distribution and chooses the threshold that minimizes within-class variance (or equivalently maximizes between-class variance).

---
