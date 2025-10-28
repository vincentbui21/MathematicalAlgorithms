# FIR Low-Pass Filter Design using sinc Function

This MATLAB script (`ex12_main.m`) demonstrates the design of **Finite Impulse Response (FIR)** low-pass filters using the **ideal sinc function** and compares their magnitude responses for different filter orders.

## Overview

The script performs the following:

1. Designs ideal low-pass FIR filters for different filter lengths (`M = 20` and `M = 64`).
2. Computes the **impulse response** using the sinc function:
   \[
   h_{LP}(n) = \frac{\sin(\omega_c (n - M/2))}{\pi (n - M/2)}
   \]
   with the center value handled separately to avoid division by zero.
3. Computes the **frequency response** using the Fast Fourier Transform (FFT).
4. Plots:
   - The impulse response for each filter order.
   - The magnitude frequency response for each filter order.
   - A comparison plot showing how increasing `M` improves the frequency selectivity.

All figures are saved automatically in the `figures/` directory.

---

## Files

| File            | Description                                                   |
| --------------- | ------------------------------------------------------------- |
| `ex12_main.m` | Main MATLAB script for FIR LPF design and comparison.         |
| `figures/`    | Directory created automatically to store all generated plots. |

---

## Output

After running the script, the following figures are generated:

| File Name           | Description                                                        |
| ------------------- | ------------------------------------------------------------------ |
| `hLP_M20.png`     | Impulse response of low-pass filter with\( M = 20 \)               |
| `hLP_M64.png`     | Impulse response of low-pass filter with\( M = 64 \)               |
| `HLP_M20(1).png`  | Magnitude response of low-pass filter with\( M = 20 \)             |
| `HLP_M64(1).png`  | Magnitude response of low-pass filter with\( M = 64 \)             |
| `HLP_compare.png` | Comparison of magnitude responses for\( M = 20 \) and \( M = 64 \) |

---

## Instructions to Run

1. **Open MATLAB** and navigate to the folder containing `ex12_main.m`.
2. Run the script:
   ```matlab
   ex12_main
   ```

3. MATLAB will:
   * Generate impulse and frequency response plots.
   * Save all figures automatically in a subfolder named `figures`.
   * Display a confirmation message:
     <pre class="overflow-visible!" data-start="2255" data-end="2342"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>✅ </span><span>All</span><span> plots </span><span>generated</span><span></span><span>and</span><span> saved </span><span>in</span><span> the "figures" folder successfully.
     </span></span></code></div></div></pre>

---

## Key Observations

* Increasing the filter order `M` results in:
  * A **narrower transition band** between passband and stopband.
  * **Lower side lobes** in the frequency response.
  * A **more ideal** low-pass filter behavior.
* However, a higher order increases computation and filter delay.

---

## Requirements

* MATLAB R2018b or later (any version supporting `fft`, `stem`, and `plot` functions)
* No additional toolboxes required.
