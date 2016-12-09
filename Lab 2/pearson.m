function pc = pearson(x, y)
  lenx = length(x);  % number of samples
  if (lenx ~= length(y))
    error('pearson(x,y): x and y are not of the same shape');
  end
  x = x - sum(x)/length(x);
  y = y - sum(y)/length(y);
  denom = norm(x)*norm(y);
  y = y(end:-1:1);    % reverse of y
  % use convolution theorem: pc=conv(x,y)
  pc = real(ifft(fft(x).*fft(y)));
  pc = [pc(lenx), pc(1:lenx-1)] / denom;
end
