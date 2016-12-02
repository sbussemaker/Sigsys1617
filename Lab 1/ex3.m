function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
% implement this function yourself
end

function printSamples(x)
  printf("[");
  nsamples = length(x);
  if nsamples > 0
    printf("%.3f", x(1));
    for i=2:nsamples
      printf(",%.3f", x(i));
    end
  end
  printf("]\n");
end
  
%%%%%%% main program starts here %%%%%%%
A   = input("A=? ");
f   = input("f(in Hz)=? ");
phi = input("phi(in radians)=? ");
fs  = input("samples per second=? ");

x = sinusoid2samples(A, 2*pi*f, phi, fs);

printSamples(x);

% uncomment the next line for a graphical plot,
% but comment it again before you submit it to themis!
%
% plot(x); pause;
