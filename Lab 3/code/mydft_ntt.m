function [result, V, V_inv] = mydft_ntt(x)
  % VanderMonde matrix using primes
  N = length(x);

  [g, p] = rootsofunity(N);
  k = (p-1)/N;
  omega = g.^k;
  
  V = zeros(N);
  for k = 0:N-1
      for n = 0:N-1
        V(k+1, n+1) = mod(mod(omega.^k, p).^n, p);
      end
  end
  
  V_inv = zeros(N);
  for k = 0:N-1
      for n = 0:N-1
        V_inv(k+1, n+1) = mod(mod(omega.^k, p).^-n, p);
      end
  end  

  result = mod(x*V, p);
end
