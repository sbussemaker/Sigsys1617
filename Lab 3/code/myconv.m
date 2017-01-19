function c = myconv(a, b)
  N = length(a);
  
  % Zeropadding
  a = [a zeros(1, N)];
  b = [b zeros(1, N)];

  % Convolve
  c = real(ifft(fft(a).*fft(b)));
  c = c(1:end-1);
end
