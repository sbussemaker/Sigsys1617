% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 2 - A more general Pearson correlator

% 2a)
x = rand(1, 1000);
y = rand(1, 10);
z = pearson2(y, y)
plot(z); pause;
