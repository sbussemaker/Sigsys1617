function c = myconv_ntt(a, b)
  assert(length(a) == length(b));
  N = length(a);
  
  % Zeropadding
  a = [a zeros(1, N)];
  b = [b zeros(1, N)];

  [root, prime] = rootsofunity(length(a));
  k = (prime-1)/length(a);
  omega = root^k;

  x = myfft_ntt(a, omega, prime);
  y = myfft_ntt(b, omega, prime);
  z = x.*y;
  
  c = myifft_ntt(z, omega, prime);
  c = c(1:end-1);
end
