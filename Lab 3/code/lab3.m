% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Lab 3: Signals and Systems

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a function myconv(x,y) that returns the convolution of the signals 
% x and y

% k = 3;
% N = power(2, k);
tol = eps(1e10); % Tolerance for equality testing

% Two signals of length 2^k
x0 = [2 5 2 0 0 1 3 7];
y0 = randi([0 10],1,length(x0));

r0 = [3 5 1 12 11 7 10 1];
x1 = [6 9  0 14  8 1 11 13 12  2 12 13 0 12 12 11];
r1 = [0 7 13  1 14 9 14  6  3 11 10 13 2  8  3 16];

% Convolution
z1 = conv(x0, y0);
z2 = myconv(x0, y0);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
 'Ex1: conv and myconv did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a (very slow) DFT by constructing a vanderMonde matrix, and 
% multiplying the input with this matrix. Compare your result with the 
% built-in function FFT. Make also the inverse IFT

[a0, V] = mydft(x0); z0 = myift(a0, V);
a2 = fft(x0);

assert(sum(abs(a0-a2) < tol)==length(a0), ...
 'Ex2: mydft and fft did not produce same output');
assert(sum(abs(z0-x0) < tol)==length(z0), ...
 'Ex2: mydft+myift did not produce original signal');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the previous exercise using prime numbers and roots of unity.

[a0, V, V_inv] = mydft_ntt(x0);
z0 = myift_ntt(a0, V_inv);

[a1, V, V_inv] = mydft_ntt(x1);
z1 = myift_ntt(a1, V_inv);

assert(isequal(a0, r0), ...
 'Voorbeeld 1 van TAs gaat niet goed');
assert(isequal(a1, r1), ...
 'Voorbeeld 2 van TAs gaat niet goed');
assert(sum(abs(z0-x0) < tol)==length(x0), ...
 'Ex3: myfft_ntt+myifft_ntt did not produce original signal x0');
assert(sum(abs(z1-x1) < tol)==length(x1), ...
 'Ex3: myfft_ntt+myifft_ntt did not produce original signal x1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Implement the FFT and IFFT yourself (use a recursive impementation: see 
% slide 36 of lecture 5). Compare with the built-in FFT.

w = exp(-1j*2*pi/length(x0));
a0 = myfft(x0, w);  z0 = myifft(a2, w);
a2 = fft(x0);       z2 = ifft(a2); 


assert(sum(abs(a0-a2) < tol)==length(a0), ...
 'Ex4: myfft and fft did not produce same output');
assert(sum(abs(z0-z2) < tol)==length(z2), ...
 'Ex4: myfft and myifft did not produce same output');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Modify the code of the previous exercise to implement the NTT and its 
% inverse.

[root, prime] = rootsofunity(length(x0));
k = (prime-1)/length(x0);
omega = root^k;
a0 = myfft_ntt(x0, omega, prime); z0 = myifft_ntt(a0, omega, prime);

[root, prime] = rootsofunity(length(x1));
k = (prime-1)/length(x1);
omega = root^k;
a1 = myfft_ntt(x1, omega, prime); z1 = myifft_ntt(a1, omega, prime);

assert(isequal(a0, r0), ...
 'Voorbeeld 1 van TAs gaat niet goed');
assert(isequal(a1, r1), ...
 'Voorbeeld 2 van TAs gaat niet goed');
assert(sum(abs(z0-x0) < tol)==length(z1), ...
 'Ex5: myfft_ntt+myifft_ntt did not produce original signal x0');
assert(sum(abs(z1-x1) < tol)==length(z1), ...
 'Ex5: myfft_ntt+myifft_ntt did not produce original signal x1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the first exercise (myconv), but now using NTTs.

% TODO
z1 = conv(x0, y0);
z2 = myconv_ntt(x0, y0);

assert(sum(abs(z1-z2) < tol)==length(z1), ...
 'Ex6: conv and myconv_ntt did not produce same output');
