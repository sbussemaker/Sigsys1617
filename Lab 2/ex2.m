% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 2 - A more general Pearson correlator

% 2a)
% see pearson2.m
x = rand(1, 100);
y = rand(1, 10);

% 2b)
x = zeros(1,150); x(50) = 1; x(100) = 1;
h1= zeros(1,70); h1(10) = 1; h1(60) = 1;
h2= zeros(1,70); h2(11) = 1; h2(60) = 1;

z1 = pearson2(x, h1);
plot(z1);
z2 = pearson2(x, h2);
figure();
plot(z2);
pause;
