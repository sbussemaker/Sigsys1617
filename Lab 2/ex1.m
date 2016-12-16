% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
%
% Exercise 1 - Time delay and correlators

% 1b)
x = rand(1,100);
plot(x);
plot(circorr(x, x));

% 1c)
y = rotate(x, 50);
plot(circorr(x, y));

% 1d)
plot(circpearson(x, y));

% 1f)
% amplitude, omega, phi, samplerate
x = sinusoid2samples(5, 2*pi*5, 0, 100);       % 5 cos (10pi)
y = sinusoid2samples(5, 2*pi*5, -0.5*pi, 100); % 5 sin (10pi)
plot(circpearson(x, y));
% Cosinus over de sinus heen!

% 1g)
x = rand(1,100);
plot(circpearson(x, x));
y = rotate(x, 50);
plot(circpearson(x, y));

% TODO: ROBUSTNESS, add noise