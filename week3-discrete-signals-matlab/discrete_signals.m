% Define the range of n values
n = -10:10;

% Unit Impulse Signal
impulse = (n == 0); % Impulse is 1 at n=0, 0 elsewhere
figure; % Create a new figure
stem(n, impulse, 'filled'); % Plot the impulse signal
title('Unit Impulse Signal');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

% Unit Step Signal
step = (n >= 0); % Step is 1 for n >= 0, 0 elsewhere
figure; % Create a new figure
stem(n, step, 'filled'); % Plot the step signal
title('Unit Step Signal');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

% Unit Ramp Signal
ramp = n .* (n >= 0); % Ramp is n for n >= 0, 0 elsewhere
figure; % Create a new figure
stem(n, ramp, 'filled'); % Plot the ramp signal
title('Unit Ramp Signal');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

% Exponential Signal
exponential = exp(0.1 * n); % Exponential signal e^(0.1*n)
figure; % Create a new figure
stem(n, exponential, 'filled'); % Plot the exponential signal
title('Exponential Signal');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

% Signum Function
signum = sign(n); % Signum function: -1 for n<0, 0 for n=0, 1 for n>0
figure; % Create a new figure
stem(n, signum, 'filled'); % Plot the signum function
title('Signum Function');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

% Sinc Function
sinc_function = sinc(n); % Sinc function: sinc(x) = sin(pi*x)/(pi*x)
figure; % Create a new figure
stem(n, sinc_function, 'filled'); % Plot the sinc function
title('Sinc Function');
xlabel('n');
ylabel('Amplitude');
grid on; % Add grid for better visualization

