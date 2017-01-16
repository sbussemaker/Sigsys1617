function result = myconv_ntt(x, y)
  assert(length(x) == length(y));
  N = length(x);
  
  % Zeropadding
  x = [x zeros(1, N)];
  y = [y zeros(1, N)];

  % DFT
  result = real(myifft_ntt(myfft_ntt(x).*myfft_ntt(y)));
  result = result(1:end-1);
end
