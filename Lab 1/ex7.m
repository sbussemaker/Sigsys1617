function [omega2,A2,phi2] = microphoneSignal(omega, x0, y0, A0, phi0, x1, y1, A1, phi1, x2, y2)
% implement this function yourself
end
  
%%%%%%% main program starts here %%%%%%%

x0   = input("x0=? ");
y0   = input("y0=? ");
x1   = input("x1=? ");
y1   = input("y1=? ");
x2   = input("x2=? ");
y2   = input("y2=? ");

f    = input("frequency(in Hz)=? ");
A0   = input("A0=? ");
phi0 = input("phi0=? "); 
A1   = input("A1=? ");
phi1 = input("phi1=? "); 

[omega2,A2,phi2] = microphoneSignal(2*pi*f, x0, y0, A0, phi0, x1, y1, A1, phi1, x2, y2);
printf("x(t)=%.2f*cos(2*pi*%.2f*t + %.2f)\n", A2, omega2/(2*pi), phi2); 
