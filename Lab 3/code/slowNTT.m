function y = slowNTT(a)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  
  N = length(a);
  [g, p] = rootsofunity(N);
  k = (p-1)/N;
  w = g.^k;
  
  V = ones(N);                          % Make Vandermonde matrix using NTT
  M = repmat(w, 1, p-1);                % Multiplicative group modulo p
  M = mod(M.^[0:p-2], p);               % w ^ n

  for k = 0:N-1
      for n = 0:N-1
        V(k+1, n+1) = powermod(M(k+1), n, p);   % F[i,j] = w^nk
      end
  end

  y = mod(a*V, p);                      % y = F a
end
