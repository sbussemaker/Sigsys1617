function result = patternMatch(x, h)
  % matches pattern
  % using a gaussian mask
  N = length(h);
  n = -(N-1)/2:(N-1)/2;
  alpha = 8;

  % w = gausswin(N,alpha);
  stdev = (N-1)/(2*alpha);
  y = exp(-1/2*(n/stdev).^2);
  
  h2 = conv(y, h, 'same');
  result = pearson2(x, h2);
end
