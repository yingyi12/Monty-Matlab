% Signals from previous task:
%   signal          noisy signal in time domain
%   singleSided     one-sided spectrum of the time signal
%   f               frequency domain
load('SigSpec.mat');

% Your code here
sided = singleSided;
singleSided(f>2) = 0;

filtSpectrum = singleSided;

[reconFiltSignal,t] = reconstructSignalFromSingleSided(filtSpectrum);

figure;
g = subplot(211);

y1 = signal;
y2 = reconFiltSignal;
plot(t,y1, t,y2)
title('Time signals')
xlabel('Time[s]')
ylabel('Amplitude')
legend('Signal','Filtered')
hold off


h = subplot(212);
y3 = abs(sided)*2;
y4 = abs(filtSpectrum)*2
plot(f,y3, f,y4)
title('Spectra')
xlabel('Frequency[Hz]')
xlim([0 4])
ylabel('Amplitude')
legend('Signal','Filtered')