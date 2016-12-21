% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 3 - Correlation in 2D (Images)

%% 3
A = imread('data/page.pgm');
B = imread('data/maskM.pgm');
imshow(A);

%% Noise
threshold = 0.865;
noises = 0:0.01:1;
total = 67;

results = zeros(1, length(noises));
for idx = 1:length(noises)
    noise = noises(idx);
    x2 = imnoise(A,'salt & pepper', noise);
    y2 = normxcorr2(B, x2);
 
    results(idx) =  sum(sum(abs(y2) > threshold)) / 67;
end

plot(noises, results);
xlabel('Noise level'); ylabel('Recognition rate');
title('Recognition rate versus noise level'); legend('Recognition rate');
