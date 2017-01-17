% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Lab 3: Signals and Systems

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a function myconv(x,y) that returns the convolution of the signals 
% x and y

k = 3;
N = power(2, k);
tol = eps(1e10);  % Tolerance for equality testing

% Two signals of length 2^k
x = [2     5     2     0     0     1     3     7];
y = randi([0 10],1,N);

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
a2 = fft(x);

assert(sum(abs(a1-a2) < tol)==length(a1), ...
  'Ex2: mydft and fft did not produce same output');
assert(sum(abs(z1-x) < tol)==length(z1), ...
  'Ex2: mydft+myift did not produce original signal');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the previous exercise using prime numbers and roots of unity.

[a1, V, V_inv] = mydft_ntt(x)
z1 = myift_ntt(a1, V_inv)

assert(sum(abs(z1-x) < tol)==length(z1), ...
  'Ex3: mydft_ntt+myift_ntt did not produce original signal');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Implement the FFT and IFFT yourself (use a recursive impementation: see 
% slide 36 of lecture 5). Compare with the built-in FFT.

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

[root, prime] = rootsofunity(N);
k = (prime-1)/N;
omega  =  root^k;
a1 = fft(x);   a2 = myfft_ntt(x, omega, prime);
z1 = ifft(a1); z2 = myifft_ntt(a2, omega, prime);

i0 = [2     5     2     0     0     1     3     7];
[res] = myfft_ntt(i0, omega, prime)
assert(isequal(mydft_ntt(i0), ...
   [3    5    1   12   11    7   10    1]), ...
   'voorbeeld 1 van TAs gaat niet goed');

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex5: myfft_ntt+myifft_ntt and fft+ifft did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the first exercise (myconv), but now using NTTs.

% TODO
z1 = conv(x, y);
z2 = myconv_ntt(x, y);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
  'Ex6: conv and myconv_ntt did not produce same output');
