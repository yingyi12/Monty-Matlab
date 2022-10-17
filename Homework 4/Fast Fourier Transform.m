% Your code here

load('SigSpec.mat')
Fs = 1000; 
L = length(signal); 
spectrum = fft(signal)/L;

f = Fs*(0:(L/2))/L;

reconSpectrum1 = fliplr(singleSided);
reconSpectrum = [singleSided(1:end-1),conj(reconSpectrum1(1:end-1))]
isEqual = isequal(spectrum, reconSpectrum)