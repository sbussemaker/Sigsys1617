function c = myconv_ntt(a, b)
  N = length(a);
  
  % Zeropadding
  a = [a zeros(1, N)];
  b = [b zeros(1, N)];

  [g, p] = rootsofunity(length(a));
  k = (p-1)/length(a);
  w = g^k;

  x = fastNTT(a, w, p);
  y = fastNTT(b, w, p);
  z = x.*y;
  
  c = fastINTT(z, w, p);
  c = c(1:end-1);
end
