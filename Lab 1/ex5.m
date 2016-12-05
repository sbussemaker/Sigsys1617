% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
  % From exercise 3
  samples = zeros(1,samplerate);
	for i = 0:(samplerate)
		samples(i+1) = amplitude * cos (omega*i/samplerate + phi);
	end
end

function phi=samples2phase(omega, x, samplerate)
  % From exercise 4, returns the phase, given a signal, omega and samplerate
  [~, t_m] = max(x);
  t_m = t_m - 1;
  t_m = t_m / samplerate;
  phi = -omega * t_m;
  phi = mod(phi, 2*pi);
  if (phi > pi)
    phi = phi - 2*pi;
  end
end

function [mins, maxs]=findLocalMinMax(x)
  % Given a signal x, return the local minima and local maxima
  mins = []; maxs = [];
  for idx = 2:length(x)-1
    if (x(idx-1) < x(idx) && x(idx) > x(idx+1))
      maxs = [maxs idx];
    elseif (x(idx-1) > x(idx) && x(idx) < x(idx+1))
      mins = [mins idx];
    end
  end
end

function [amplitude,omega,phi]=samples2sinusoid(x, samplerate)
  % Amplitude
  amplitude = (max(x) - min(x)) / 2;
  
  % Omega
  [mins maxs] = findLocalMinMax(x);   % Find first peak and first lowest
  t_1 = maxs(1); t_2 = mins(1);       %   to find half period

  T = abs(t_2 - t_1) * 2;             % Period (in D domain)
  w_hat = 2*pi / T;                   % omega (in D domain)
  omega = w_hat * samplerate;         % omega (in A domain)
  
  % Phi
  phi = samples2phase(omega, x, samplerate);
end

%%%%%%% main program starts here %%%%%%%
A   = input("A=? ");
f   = input("f(in Hz)=? ");
phi = input("phi(in radians)=? ");
fs  = input("samples per second=? ");
x = sinusoid2samples(A, 2*pi*f, phi, fs);

[ampl, omega, phase]= samples2sinusoid(x, fs);

printf("x(t)=%.2f*cos(2*pi*%.2f*t + %.2f)\n", ampl, omega/(2*pi), phase); 

%{
Answer here the posed questions:
 In this case, we need 2 values from the sampled signal in order to 
 determine omega. Therefore it is even more important than with exercise 4,
 where one value was needed to compute phi, to have a high sampling rate. 
 In order to get reliable results for frequencies 2pi <= omega < 200pi, 
 a sampling rate of fs = 100000 is needed.
%}
