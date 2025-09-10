# From Analog to Digital – Signal Simulation in MATLAB

This repository demonstrates the process of converting an **analog signal** into a **digital signal** using MATLAB.  
The simulation includes **analog generation, sampling, quantization, encoding, and digital representation**.

---

## 📊 Steps Implemented

### 1. Analog Signal Generation
- A sine wave of frequency 100 Hz is generated with a very fine step size (`0.0001 s`) to approximate continuous time.
- Plotted using `plot()`.

```bash
t = 0:0.0001:0.01;
f = 100;
x_analog = sin(2*pi*f*t);
plot(t, x_analog);
```

2. Sampling
- The signal is sampled at 1 kHz (Fs = 1000 Hz).
- Sampled values are shown with stem().
- Discussion: According to Nyquist theorem, the sampling frequency must be at least 2 × signal frequency (200 Hz in this case).

```bash
Fs = 1000;
Ts = 1/Fs;
n = 0:Ts:0.01;
x_sampled = sin(2*pi*f*n);
stem(n, x_sampled);
```

3. Quantization

- 4-bit quantization → 2^4=16
- Each sample is rounded to the nearest quantization level.
- More bits = higher accuracy, less distortion.

```bash
bits = 4;
levels = 2^bits;
q_step = (max(x_sampled) - min(x_sampled))/levels;
x_index = round((x_sampled - min(x_sampled))/q_step);
x_quantized = x_index*q_step + min(x_sampled);
stem(n, x_quantized);
```

4. Encoding

- Quantized indices are converted into binary words.
- Example: First 10 encoded samples printed in binary.

```bash
binary_codes = dec2bin(x_index, bits);
disp(binary_codes(1:10,:));
```

5. Digital Bitstream

- Binary words are concatenated into a continuous bitstream (1s and 0s).
- First 40 bits displayed.

```bash
bitstream = reshape(binary_codes.',1,[]);
disp(bitstream(1:40));
```

## 📷 Sample Plots

![Analog sin](<WhatsApp Image 2025-09-10 at 15.31.23_3de9fbcd.jpg>)

![Sample signal](<WhatsApp Image 2025-09-10 at 15.31.44_0538f764.jpg>)

![Quan Signal](<WhatsApp Image 2025-09-10 at 15.32.01_f6c4e33c.jpg>)