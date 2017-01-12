function result = myconv(x, y)
  assert(length(x) == length(y));
  N = length(x);
  
  % Zeropadding
  x = [x zeros(1, N)];
  y = [y zeros(1, N)];

  % DFT
  result = real(ifft(fft(x).*fft(y)));
  result = result(1:end-1);
end
