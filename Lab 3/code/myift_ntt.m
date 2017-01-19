function result = myift_ntt(a, V_inv)

  N = length(a);
  [~, p] = rootsofunity(N);

  result = rem(modinverse(N, p) * rem(a*V_inv, p), p);
end
