function c = myconv_ntt(a, b)
  N = length(a);
  
  % Zeropadding
  a = [a zeros(1, N)];
  b = [b zeros(1, N)];

  x = fastNTT(a);
  y = fastNTT(b);
  z = x.*y;
  
  c = fastINTT(z);
  c = c(1:end-1);
end
