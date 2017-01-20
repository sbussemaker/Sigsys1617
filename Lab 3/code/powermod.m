function res = powermod(a, b, p)
  % Powermod is a utility function to compute a^b mod p
  % This function is introduced to overcome Matlabs inaccuracy when dealing
  % with powers above 1e^16, see: 
  % http://mathworks.com/matlabcentral/newsreader/view_thread/7898
  res = 1;
  for i = 1:b
      res = mod(res*a, p);
  end
end
