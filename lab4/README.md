# **Lab 4: Noise and Filtering**

## **Learning Outcomes**

* Model common noise types: Gaussian and salt-and-pepper.
* Measure image quality using Mean-Square Error (MSE) and Signal-to-Noise Ratio (SNR).
* Compare the performance of mean, median, and Gaussian filters for noise reduction.

---

## **1) Add Different Noise Types**

**Goal:** Simulate common noise found in images.

* **Gaussian noise** models sensor or transmission noise with a normal distribution.
* **Salt-and-pepper noise** represents sudden pixel corruption (random black/white dots).

**Code:**

<pre class="overflow-visible!" data-start="775" data-end="976"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>I_gauss = imnoise(I,</span><span>'gaussian'</span><span>,</span><span>0</span><span>,</span><span>0.01</span><span>);
I_sp = imnoise(I,</span><span>'salt & pepper'</span><span>,</span><span>0.05</span><span>);
</span><span>figure</span><span>; montage({I, I_gauss, I_sp},</span><span>'Size'</span><span>,[</span><span>1</span><span></span><span>3</span><span>]);
title(</span><span>'Original | Gaussian noise | Salt & pepper noise'</span><span>);
</span></span></code></div></div></pre>

**Explanation:**

You should see the original image, one with smooth random brightness variations (Gaussian noise), and another with scattered white and black pixels (salt-and-pepper).

---

## **2) Compute Quality Metrics**

**Goal:** Quantify noise level.

<pre class="overflow-visible!" data-start="1240" data-end="1377"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>MSE_gauss = immse(I_gauss, I);
MSE_sp = immse(I_sp, I);
fprintf(</span><span>'MSE Gaussian: %.4f | MSE S&P: %.4f\n'</span><span>, MSE_gauss, MSE_sp);
</span></span></code></div></div></pre>

**Explanation:**

* **MSE (Mean-Square Error)** measures the average squared difference between noisy and original images.
* Higher MSE → greater distortion.

  You can optionally compute **SNR = 10*log10(mean(I(:).^2)/MSE)** to express quality in decibels.

---

## **3) Linear Filtering (Mean and Gaussian)**

**Goal:** Smooth out noise using linear averaging filters.

<pre class="overflow-visible!" data-start="1753" data-end="1991"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>h_avg = fspecial(</span><span>'average'</span><span>,</span><span>3</span><span>);
I_avg_gauss = imfilter(I_gauss,h_avg,</span><span>'replicate'</span><span>);
I_avg_sp = imfilter(I_sp,h_avg,</span><span>'replicate'</span><span>);

h_gauss = fspecial(</span><span>'gaussian'</span><span>,[</span><span>3</span><span></span><span>3</span><span>],</span><span>0.7</span><span>);
I_gauss_gauss = imfilter(I_gauss,h_gauss,</span><span>'replicate'</span><span>);
</span></span></code></div></div></pre>

**Explanation:**

* The **mean filter** averages nearby pixels to reduce Gaussian noise.
* The **Gaussian filter** gives more weight to central pixels for smoother results.

  However, both tend to blur edges and are not very effective on salt-and-pepper noise.

---

## **4) Non-linear Filtering (Median Filter)**

**Goal:** Reduce impulsive noise without strong edge blurring.

<pre class="overflow-visible!" data-start="2377" data-end="2610"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>I_med_gauss = medfilt2(I_gauss,[</span><span>3</span><span></span><span>3</span><span>]);
I_med_sp = medfilt2(I_sp,[</span><span>3</span><span></span><span>3</span><span>]);
</span><span>figure</span><span>; montage({I_avg_sp, I_med_sp, I_avg_gauss, I_med_gauss},</span><span>'Size'</span><span>,[</span><span>2</span><span></span><span>2</span><span>]);
title(</span><span>'Top: Avg vs Median (S&P) | Bottom: Avg vs Median (Gaussian)'</span><span>);
</span></span></code></div></div></pre>

**Explanation:**

* The **median filter** replaces each pixel by the median of its neighbors, effectively removing isolated outliers (salt & pepper).
* It preserves edges better than averaging filters.

---

## **5) Compare Metrics After Filtering**

<pre class="overflow-visible!" data-start="2867" data-end="2984"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-matlab"><span><span>fprintf(</span><span>'After filtering, MSE S&P avg=%.4f, med=%.4f\n'</span><span>, ...
    immse(I_avg_sp,I), immse(I_med_sp,I));
</span></span></code></div></div></pre>

**Example Output:**

<pre class="overflow-visible!" data-start="3006" data-end="3100"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>MSE Gaussian:</span><span></span><span>0.0102</span><span></span><span>|</span><span></span><span>MSE</span><span></span><span>S&P:</span><span></span><span>0.0425</span><span>
</span><span>After</span><span></span><span>filtering,</span><span></span><span>MSE</span><span></span><span>S&P</span><span></span><span>avg=0.0314,</span><span></span><span>med=0.0087</span><span>
</span></span></code></div></div></pre>

**Explanation:**

The median filter significantly reduces MSE for salt-and-pepper noise, showing its superior performance for that noise type.

---

## **6) Reflections**

* **Which noise is best removed by median filter? Why?**

  → Salt-and-pepper noise, because the median ignores extreme pixel values.
* **Why does linear filtering blur edges more?**

  → Averaging mixes values across boundaries, reducing contrast at edges.
* **How could we design adaptive filters to preserve detail?**

  → Use  **adaptive median filters** ,  **bilateral filters** , or **edge-aware smoothing** that vary their kernel size or weight based on local variance.5
