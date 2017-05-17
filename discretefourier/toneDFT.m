function [f,signal_fft_p1]=toneDFT(signal,FS)
% a function to do fourier transformation on an input
% signal
%% input: 
%   signal: The original signal
%   FS: The sampling frequency
%% output:
%   f: the frequency range
%   signal_fft_p1: the first half of the FFT output
%%

[m,n] = size(signal);
l = int32(m/2);
subplot(2,1,1);
signal_fft = abs(fft(signal));
signal_fft_p1 = signal_fft(1:(l+1));
f = FS*(0:l)/m;