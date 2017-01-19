function y = myift_ntt(a)

  N = length(a);
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
        dingen = 1;
        for i = 1:n
            dingen = mod(dingen*M2(k+1), p);
        end
        V_inv(k+1, n+1) = dingen;
      end
  end

  y = mod(modinverse(N, p) * a*V_inv, p);
end
