clc;
clear all;
close all;

% Define the value of t
t = 0:1/1000:2; % Time vector from 0 to 2 seconds with a sampling rate of 1000 Hz

% Write the given expression x in terms of t
x = sin(2*pi*50*t) + sin(2*pi*75*t);

subplot(211);
plot(t(1001:1200), x(1001:1200)); % Adjusted indexing to match the time vector
grid;
title('Sin(2\pi50t)+Sin(2\pi75t)');
xlabel('Time, s');

subplot(212);
% X would be the fft of x
X = fft(x);
% X2 would be shifted function of X
X2 = fftshift(X);
% assign f from -499.9 to 500 with increment of 1000/2001
f = linspace(-500, 500, length(X)); 

plot(f, abs(X2)); % Plot the magnitude of the FFT
grid;
title('Frequency domain representation of Sin(2\pi50t)+ Sin(2\pi75t)');
xlabel('Frequency, Hz.');