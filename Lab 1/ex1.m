function [theta,r] = cart2polar(x,y)
% implement this function yourself
end

%%%%%%% main program starts here %%%%%%%
x = input("X=? ");
y = input("Y=? ");
[theta,r] = cart2polar(x,y);
printf("theta,r=%.3f,%.3f\n", theta, r);
