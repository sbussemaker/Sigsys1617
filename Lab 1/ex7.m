% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function [theta,r] = cart2polar(x,y)
	theta = atan2(y, x);
	r = sqrt(x*x + y*y);
  % super handige functie
end

function [x,y] = polar2cart(theta, r)
	x = r * cos(theta);
	y = r * sin(theta);
end

function [omega2,A2,phi2] = addSinusoids(omega, A0, phi0, A1, phi1)
  omega2 = omega;
  [x1, y1] = polar2cart(phi0, A0);
  [x2, y2] = polar2cart(phi1, A1);
  [phi2, A2] = cart2polar(x1+x2, y1+y2);
end

function [omega2,A2,phi2] = microphoneSignal(omega, x0, y0, A0, phi0, x1, y1, A1, phi1, x2, y2)
  sound_speed = 343;
  dist0 = norm([x0, y0] - [x2, y2], 2);     % distance from 0 to 2
  dist1 = norm([x1, y1] - [x2, y2], 2);     % distance from 0 to 2
  timediff_0 = dist0 / 343;
  timediff_1 = dist1 / 343;
  phi0 = phi0 - timediff_0 * omega;
  phi1 = phi1 - timediff_1 * omega;
  [omega2, A2, phi2] = addSinusoids(omega, A0, phi0, A1, phi1);
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
