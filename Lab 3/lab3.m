%% Exercise 1 - myconv
k = 8;
N = power(2, k);

% Two signals of length 2^k
x = rand(N, 1);
y = rand(N, 1);

% Zeropadding
x = [x; zeros(N, 1)];
y = [y; zeros(N, 1)];

assert(length(x) == 2*N);
assert(length(y) == 2*N);

% Convolution
ans1 = conv(x, y)
ans2 = myconv(x, y)

length(ans1)
length(ans2)
