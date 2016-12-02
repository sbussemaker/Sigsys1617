% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
  samples = zeros(1,samplerate);
	for i = 0:(samplerate)
		samples(i+1) = amplitude * cos (omega*i/samplerate + phi);
	end
end

function phi=samples2phase(omega, x, samplerate)
  [~, t_m] = max(x);          % Find first peak
  t_m = t_m - 1;              % Fix index
  t_m = t_m / samplerate;     % Convert array index to time index
  phi = -omega * t_m;         % Compute phi
  phi = mod(phi, 2*pi);       % Remove multiples of 2pi
  if (phi > pi)               % Translate phi from [0, 2pi)
    phi = phi - 2*pi;         %   to (-pi, pi], so that
  end                         %   -pi < phi <= pi
end

function [amplitude,omega,phi]=samples2sinusoid(x, samplerate)
  % Amplitude
  amplitude = (max(x) - min(x)) / 2;
  
  % Omega
  peaks = find(x == max(x));          % Find all peaks
  peaks = peaks - 1;                  % Find indices
  t_1 = peaks(1); t_2 = peaks(2);

  T = (t_2 - t_1)
  f_hat = 1 / (t_2 - t_1)
  w_hat = f_hat * 2*pi
  T_s = 1 / samplerate
  omega = w_hat / T_s
  
  % Phi
  phi = samples2phase(omega, x, samplerate)
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
.......
%}
