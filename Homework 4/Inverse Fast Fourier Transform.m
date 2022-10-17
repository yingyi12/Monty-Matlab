% Signals from previous task:
%   signal          noisy signal in time domain
%   spectrum        complete spectrum of time signal calculated with fft command
%   reconSpectrum   complete spectrum of time signal reconstructed from single-sided spectrum
load('SigSpec.mat');

% Your code here
L = length(signal);
reconSignal = ifft(spectrum*L);
diff = signal - reconSignal;
Fs = 1000;

subplot(3,1,1);
x = (1/Fs)*(1:L);
y1 = signal;
plot(x,y1)
title('Original signal')
xlabel('Time[s]')
xlim([0 9])
ylabel('Amplitude')

subplot(3,1,2); 
y2 = reconSignal;
plot(x,y2)
title('Reconstrcuted signal')
xlabel('Time[s]')
xlim([0 9])
ylabel('Amplitude')

subplot(3,1,3); 
y3 = diff;
plot(x,y3)
title('Difference between signals')
xlabel('Time[s]')
xlim([0 9])
ylabel('Amplitude')
% Do not modify the name of the figure
f = figure;