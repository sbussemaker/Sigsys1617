% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 1 - Time delay and correlators

%% 1b)
x = rand(1,100);
figure; plot(x);
xlabel('idx'); ylabel('Value');
title('Random signal x'); legend('x');
figure; plot(circorr(x, x));
xlabel('idx'); ylabel('Correlation');
title('Correlation of x with itself'); legend('circorr(x, x)');

%% 1c)
y = rotate(x, 50);
plot(circorr(x, y));
xlabel('idx'); ylabel('Correlation');
title('Correlation of x and y'); legend('circorr(x, y)');

%% 1d)
plot(circpearson(x, y));
xlabel('idx'); ylabel('Pearson correlation');
title('Circular Pearson of x and y'); legend('circpearson(x, y)');

x = rand(1, 10000);
y = rand(1, 10000);
f = @() pearson(x, y);
g = @() circpearson(x, y);
diffRunTime = timeit(g) - timeit(f);

%% 1f)
x = sinusoid2samples(5, 2*pi*5, 0, 100);       % 5 cos (10pi)
y = sinusoid2samples(5, 2*pi*5, -0.5*pi, 100); % 5 sin (10pi - 0.5pi)
plot(circpearson(x, y));
xlabel('idx'); ylabel('Pearson correlation');
title('Circular Pearson of x and y'); legend('circpearson(x, y)');

%% 1g)
x = rand(1,100);
plot(circpearson(x, x));
xlabel('idx'); ylabel('Pearson correlation');
title('Circular Pearson of x with itself'); legend('circpearson(x, x)');
figure;

y = rotate(x, 50);
plot(circpearson(x, y));
xlabel('idx'); ylabel('Pearson correlation');
title('Circular Pearson of x and y'); legend('circpearson(x, y)');

figure;
noise = 2.5;
x = x + noise * 2*(rand(1, length(x)) - 0.5);
plot(x); figure;
plot(circpearson(x, y));
xlabel('idx'); ylabel('Pearson correlation');
title('Circular Pearson of noisy x and y'); legend('circpearson(x, x)');
