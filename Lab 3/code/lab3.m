% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Lab 3: Signals and Systems

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a function myconv(x,y) that returns the convolution of the signals 
% x and y

k = 4;
N = power(2, k);
tol = eps(1e10);  % Tolerance for equality testing

% Two signals of length 2^k
x = rand(1, N);
y = rand(1, N);

% Convolution
z1 = conv(x, y);
z2 = myconv(x, y);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex1: conv and myconv did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a (very slow) DFT by constructing a vanderMonde matrix, and 
% multiplying the input with this matrix. Compare your result with the 
% built-in function FFT. Make also the inverse IFT

[a1, V] = mydft(x); z1 = myift(a1, V);
a2 = fft(x);        z2 = ifft(a1);

assert(sum(abs(a1-a2) < tol)==length(a1), ...
  'Ex2: mydft and fft did not produce same output');
assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex2: myift and ifft did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the previous exercise using prime numbers and roots of unity.

[a1, V] = mydft_ntt(x); z1 = myift(a1, V);
a2 = fft(x);            z2 = ifft(a2);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex3: fft+ifft and mydft_ntt+myift did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Implement the FFT and IFFT yourself (use a recursive impementation: see 
% slide 36 of lecture 5).
% Compare with the built-in FFT.

w = exp(-1j*2*pi/N);
a1 = fft(x);   a2 = myfft(x, w);
z1 = ifft(a1); z2 = myifft(a2, w);

assert(sum(abs(a1-a2) < tol)==length(a1), ...
  'Ex4: myfft and fft did not produce same output');
assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex4: myfft and myifft did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Modify the code of the previous exercise to implement the NTT and its 
% inverse.

% TODO
a1 = fft(x);   a2 = myfft_ntt(x);
z1 = ifft(a1); z2 = myifft_ntt(a2);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex5: myfft_ntt+myifft_ntt and fft+ifft did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the first exercise (myconv), but now using NTTs.

% TODO
z1 = conv(x, y);
z2 = myconv_ntt(x, y);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex6: conv and myconv_ntt did not produce same output');
