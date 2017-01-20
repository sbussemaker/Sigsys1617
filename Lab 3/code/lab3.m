% Test cases
a0 = [2 5 2  0  0 1  3 7];        % Signal 0 of length 2^3, given by TAs
r0 = [3 5 1 12 11 7 10 1];        % NTT coefficients of a0, for testing
f0 = fft(a0);                     % FFT coefficients of a0, for testing

a1 = [6 9  0 14  8 1 11 13 12  2 12 13 0 12 12 11];
r1 = [0 7 13  1 14 9 14  6  3 11 10 13 2  8  3 16];
f1 = fft(a1);

b0 = randi([0 10],1,length(a0));  % Random signal, same length as a0
b1 = randi([0 10],1,length(a1));  % Random signal, same length as a1

tol = eps(1e10); % Tolerance for equality testing of floats, from:
                 % https://mathworks.com/help/matlab/ref/eq.html#bt2klek-3

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a function myconv(x,y) that returns the convolution of the signals 
% x and y

c1 = conv(a0, b0);    c2 = myconv(a0, b0);
c3 = conv(a1, b1);    c4 = myconv(a1, b1);

assert(all(abs(c1-c2) < tol), 'Ex1: myconv fails for a0, b0');
assert(all(abs(c3-c4) < tol), 'Ex1: myconv fails for a0, b0');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Make a (very slow) DFT by constructing a vanderMonde matrix, and 
% multiplying the input with this matrix. Compare your result with the 
% built-in function FFT. Make also the inverse IFT

y0 = slowDFT(a0);       c0 = slowIFT(y0);
y1 = slowDFT(a1);       c1 = slowIFT(y1);

assert(all(abs(y0-f0) < tol), 'Ex2: slowDFT fails for a0');
assert(all(abs(c0-a0) < tol), 'Ex2: slowDFT+slowIFT fail for a0');
assert(all(abs(y1-f1) < tol), 'Ex2: slowDFT fails for a1');
assert(all(abs(c1-a1) < tol), 'Ex2: slowDFT+slowIFT fail for a1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the previous exercise using prime numbers and roots of unity.

y0 = slowNTT(a0);   c0 = slowINTT(y0);
y1 = slowNTT(a1);   c1 = slowINTT(y1);

assert(isequal(y0, r0), 'Ex3: slowNTT fails for a0');
assert(isequal(c0, a0), 'Ex3: slowNTT+slowINTT fail for a0');
assert(isequal(y1, r1), 'Ex3: slowNTT fails for a1');
assert(isequal(c1, a1), 'Ex3: slowNTT+slowINTT fail for a1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Implement the FFT and IFFT yourself (use a recursive impementation: see
% slide 36 of lecture 5). Compare with the built-in FFT.

y0 = fastDFT(a0);       c0 = fastIFT(y0);
y1 = fastDFT(a1);       c1 = fastIFT(y1);

assert(all(abs(y0-f0) < tol), 'Ex4: fastDFT fails for a0');
assert(all(abs(c0-a0) < tol), 'Ex4: fastDFT+fastIFT fail for a0');
assert(all(abs(y1-f1) < tol), 'Ex4: fastDFT fails for a1');
assert(all(abs(c1-a1) < tol), 'Ex4: fastDFT+fastIFT fail for a1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Modify the code of the previous exercise to implement the NTT and its 
% inverse.

y0 = fastNTT(a0);   c0 = fastINTT(y0);
y1 = fastNTT(a1);   c1 = fastINTT(y1);

assert(isequal(y0, r0), 'Ex5: fastNTT fails for a0');
assert(isequal(c0, a0), 'Ex5: fastNTT+fastINTT fail for a0');
assert(isequal(y1, r1), 'Ex5: fastNTT fails for a1');
assert(isequal(c1, a1), 'Ex5: fastNTT+fastINTT fail for a1');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% Repeat the first exercise (myconv), but now using NTTs.

c1 = conv(a0, b0);    c2 = myconv_ntt(a0, b0);  % Answer still in mod p!
c3 = conv(a1, b1);    c4 = myconv_ntt(a1, b1);  % Answer still in mod p!

assert(all(abs(c1-c2) < tol), 'Ex6: myconv_ntt fails for a0, b0');
assert(all(abs(c3-c4) < tol), 'Ex6: myconv_ntt fails for a1, b1');

