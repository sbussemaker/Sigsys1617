function [x,y] = polar2cart(theta, r)
% implement this function yourself
end

%%%%%%% main program starts here %%%%%%%

theta = input("theta=? ");
r = input("r=? ");
[x,y] = polar2cart(theta,r);
printf("x,y=%.3f,%.3f\n", x,y);
