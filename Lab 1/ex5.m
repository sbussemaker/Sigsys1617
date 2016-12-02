function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
% put here the code from exercise 3
end

function [amplitude,omega,phi]=samples2sinusoid(x, samplerate)
%implement this function yourself
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
