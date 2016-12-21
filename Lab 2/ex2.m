% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 2 - A more general Pearson correlator

%% 2a)
% see pearson2.m
x = rand(100, 1);
y = rand(10, 1);

%% 2b)
x = zeros(150,1); x(50) = 1; x(100) = 1;
h1= zeros(70,1); h1(10) = 1; h1(60) = 1;
h2= zeros(70,1); h2(11) = 1; h2(60) = 1;

z1 = pearson2(x, h1);
figure(1);
plot(z1);
z2 = pearson2(x, h2);
figure(2);
plot(z2);

%% 2c)
z3 = patternMatch(x, h1);
figure(3);
plot(z3);
z4 = patternMatch(x, h2);
figure(4);
plot(z4);

%% 2d)
[y5, ~] = audioread('data/handel.wav');
[h5, ~] = audioread('data/hallelujah.wav');

z5 = patternMatch(y5, h5);
figure(5);
plot(z5);

%% 2e)
[y6, ~] = audioread('data/furelise8kHZ.wav');
[h6, ~] = audioread('data/cropelise8kHz.wav');

z6 = patternMatch(y, h6);
figure(6);
plot(z6);
