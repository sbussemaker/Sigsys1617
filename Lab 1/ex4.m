function phi=samples2phase(omega, x, samplerate)
% implement this function yourself
end

function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
% put here the code from exercise 3
end

%%%%%%% main program starts here %%%%%%%
A   = input("A=? ");
f   = input("f(in Hz)=? ");
phi = input("phi(in radians)=? ");
fs  = input("samples per second=? ");

x = sinusoid2samples(A, 2*pi*f, phi, fs);
phi = samples2phase(2*pi*f, x, samplerate);
printf("phi=%.2f\n", phi);


%{
Answer here the posed question:
......
%}
