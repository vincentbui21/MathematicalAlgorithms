clc;
clear all;
close all;

% Time vector
t = 0:1/100:10-1/100;   % t = 0:0.01:9.99

% Given signal
x = sin(2*pi*15*t) + sin(2*pi*40*t);

% Plot original signal
subplot(3,1,1);
plot(t,x);
grid on;
title('Given Original Signal');
xlabel('Time, s');

% Compute DFT
y = fft(x);

% Magnitude and Phase
m = abs(y);
p = angle(y);

% Reduce round-off errors by setting small-magnitude components to zero
y(m < 1e-6) = 0;
m(m < 1e-6) = 0;
p(m == 0) = 0;

% Frequency vector
f = (0:length(y)-1)*100/length(y);

% Plot Magnitude
subplot(3,1,2);
plot(f,m);
title('Magnitude');
ax = gca;
ax.XTick = [15 40 60 85];

% Plot Phase in degrees
subplot(3,1,3);
plot(f,p*180/pi);
title('Phase');
ax = gca;
ax.XTick = [15 40 60 85];
