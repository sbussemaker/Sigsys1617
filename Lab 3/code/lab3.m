% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Lab 3: Signals and Systems

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make a function myconv(x,y) that returns the convolution of the signals x and y

k = 4;
N = power(2, k);
tol = eps(1e10);  % Tolerance for equality testing

% Two signals of length 2^k
x = rand(1, N);
y = rand(1, N);

% Convolution
z1 = conv(x, y);
z2 = myconv(x, y);

assert(sum(abs(z1-z2) < tol)==length(z1));
disp('conv and myconv produced same output');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make a (very slow) DFT by constructing a vanderMonde matrix, and multiplying the input with this
% matrix. Compare your result with the built-in function FFT. 

[a1, V] = vdm(x);
a2 = fft(x);

assert(sum(abs(a1-a2) < tol)==length(a1));
disp('vdm and fft produced same output');

% Make also the inverse IFT
z1 = ivdm(a1, V);
z2 = ifft(a1);

assert(sum(abs(z1-z2) < tol)==length(z1));
disp('ivdm and ifft produced same output');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Repeat the previous exercise using prime numbers and roots of unity.

[a1, V] = vdm2(x);
z1 = ivdm(a1, V);
z2 = ifft(fft(x));

assert(sum(abs(z1-z2) < tol)==length(z1));
disp('fft+ifft and prime_vdm+prime_ivdm produced same output');