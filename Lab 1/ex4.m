% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
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

function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
  samples = zeros(1,samplerate);
	for i = 0:(samplerate)
		samples(i+1) = amplitude * cos (omega*i/samplerate + phi);
	end
end

%%%%%%% main program starts here %%%%%%%
A   = input("A=? ");
f   = input("f(in Hz)=? ");
phi = input("phi(in radians)=? ");
fs  = input("samples per second=? ");

x = sinusoid2samples(A, 2*pi*f, phi, fs);
phi = samples2phase(2*pi*f, x, fs);
printf("phi=%.2f\n", phi);


%{
Answer here the posed question:
  In order to obtain reliable answers, you need a high samplerate.
  This is needed to make an accurate transform from x[n] to x(t), since t = n/fs.
  The required height of the samplerate is dependant on the frequency of the input signal.
  An higher f needs an higher fs. 
%}
