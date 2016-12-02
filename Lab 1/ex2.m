% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function [x,y] = polar2cart(theta, r)
	x = r * cos(theta);
	y = r * sin(theta);
end

%%%%%%% main program starts here %%%%%%%

theta = input("theta=? ");
r = input("r=? ");
[x,y] = polar2cart(theta,r);
printf("x,y=%.3f,%.3f\n", x,y);

