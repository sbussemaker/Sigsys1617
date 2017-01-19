function y = mydft_ntt(a)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  N = length(a);

  [g, p] = rootsofunity(N);
  k = (p-1)/N;
  w = g.^k;
  
  % Make Vandermonde matrix
  V     = ones(N);
  M = zeros(1, p-1);
  for l = 0:p-2;
      M(l+1) = mod(w^l, p);
  end

  for k = 0:N-1
      for n = 0:N-1
        dingen = 1;
        for i = 1:n
            dingen = mod(dingen*M(k+1), p);
        end
        V(k+1, n+1) = dingen;
      end
  end

  y = mod(a*V, p);
end