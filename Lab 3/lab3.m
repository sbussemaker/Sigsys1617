%% Exercise 1 - myconv
k = 3;
N = power(2, k);

% Two signals of length 2^k
x = rand(1, N);
y = rand(1, N);

% Convolution
z1 = conv(x, y);
z2 = myconv(x, y);

assert(sum(round(z1, 5) ~= round(z2, 5)) == 0);


