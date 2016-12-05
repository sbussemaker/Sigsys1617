% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function [theta,r] = cart2polar(x,y)
	theta = atan2(y, x);
	r = sqrt(x*x + y*y);
end

function [x,y] = polar2cart(theta, r)
	x = r * cos(theta);
	y = r * sin(theta);
end

function [omega2,A2,phi2] = addSinusoids(omega, A0, phi0, A1, phi1)
  omega2 = omega;                         % Omega stays the same
  [x1, y1] = polar2cart(phi0, A0);        % Convert to cartesian
  [x2, y2] = polar2cart(phi1, A1);        % Convert to cartesian
  [phi2, A2] = cart2polar(x1+x2, y1+y2);  % Add, convert back to polar
end

%%%%%%% main program starts here %%%%%%%
f    = input("frequency (in Hz)=? ");
A0   = input("A0=? ");
phi0 = input("phi0=? "); 
A1   = input("A1=? ");
phi1 = input("phi1=? "); 

[omega2,A2,phi2] = addSinusoids(f*2*pi, A0, phi0, A1, phi1);
printf("x(t)=%.2f*cos(2*pi*%.2f*t + %.2f)\n", A2, omega2/(2*pi), phi2); 
