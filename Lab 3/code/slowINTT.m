function a = slowINTT(y)
  % Input:  A vector y of values of the polynomial for a at the nth roots
  %         of unity and a primitive nth root of unity w, where n is a 
  %         power of 2
  % Output: An n-length coefficient vector a = [a0, a1, ..., a(n-1)]

  N = length(y);
  [g, p] = rootsofunity(N);
  k = (p-1)/N;
  w = g.^k;
  
  V_inv = ones(N);
  M2 = ones(1, p-1);
  for l = 1:p-2;
      M2(l+1)    = mod(w^(p-(l+1)), p);
  end
  
  for k = 0:N-1
      for n = 0:N-1
        V_inv(k+1, n+1) = powermod(M2(k+1), n, p);
      end
  end

  a = mod(modinverse(N, p) * y*V_inv, p);
end
