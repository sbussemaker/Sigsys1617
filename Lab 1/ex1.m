% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function [theta,r] = cart2polar(x,y)
	theta = atan2(y, x);
	r = sqrt(x*x + y*y);
end

%%%%%%% main program starts here %%%%%%%
x = input("X=? ");
y = input("Y=? ");
[theta,r] = cart2polar(x,y);
printf("theta,r=%.3f,%.3f\n", theta, r);

