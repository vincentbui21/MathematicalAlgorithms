% Define the time vector for continuous signals
t = -5:0.01:5; % Time from -5 to 5 with a step of 0.01

% Unit Impulse Signal
impulse = zeros(size(t)); % Initialize impulse signal
impulse(t == 0) = 1; % Set value at t=0 to 1
figure; % Create a new figure
plot(t, impulse, 'r', 'LineWidth', 2); % Plot impulse signal
title('Unit Impulse Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Unit Step Signal
step = t >= 0; % Step function is 1 for t >= 0
figure; % Create a new figure
plot(t, step, 'b', 'LineWidth', 2); % Plot step signal
title('Unit Step Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Unit Ramp Signal
ramp = t .* (t >= 0); % Ramp function is t for t >= 0
figure; % Create a new figure
plot(t, ramp, 'g', 'LineWidth', 2); % Plot ramp signal
title('Unit Ramp Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Exponential Signal
exponential = exp(t); % Exponential function e^t
figure; % Create a new figure
plot(t, exponential, 'm', 'LineWidth', 2); % Plot exponential signal
title('Exponential Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Signum Signal
signum = sign(t); % Signum function
figure; % Create a new figure
plot(t, signum, 'c', 'LineWidth', 2); % Plot signum signal
title('Signum Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Sinc Signal
sinc_signal = sinc(t); % Sinc function (normalized)
figure; % Create a new figure
plot(t, sinc_signal, 'k', 'LineWidth', 2); % Plot sinc signal
title('Sinc Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

