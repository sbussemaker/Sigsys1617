function [omega2,A2,phi2] = addSinusoids(omega, A0, phi0, A1, phi1)
% implement this function yourself
end

%%%%%%% main program starts here %%%%%%%
f    = input("frequency (in Hz)=? ");
A0   = input("A0=? ");
phi0 = input("phi0=? "); 
A1   = input("A1=? ");
phi1 = input("phi1=? "); 

[omega2,A2,phi2] = addSinusoids(f*2*pi, A0, phi0, A1, phi1);
printf("x(t)=%.2f*cos(2*pi*%.2f*t + %.2f)\n", A2, omega2/(2*pi), phi2); 
