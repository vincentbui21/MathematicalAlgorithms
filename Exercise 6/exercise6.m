clc;
clear all;
close all;

% Discretize the value of t from -1 to 1 with the increment of 0.001
t = -1:0.001:1;

% write the function x = sin(2π50t) in MATLAB
x = sin(2 * pi * 50 * t);

% Use the subplot function
subplot(2, 1, 1);
plot(t(1001:1200), x(1001:1200));
grid;
title('Sin(2\pi50t)');
xlabel('Time, s');

% Use the subplot function
subplot(2, 1, 2);
% write the matlab code for absolute value of fast Fourier transform of x, and assign it as X
X = abs(fft(x));

% Now find the fftshift of X to get X2
X2 = fftshift(X);

f = -499.9:1000/2001:500;
plot(f, X2);
grid;
title('Frequency domain representation of Sin(2\pi50t)');
xlabel('Frequency, Hz.');