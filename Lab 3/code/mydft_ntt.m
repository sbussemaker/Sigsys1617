function [result, V] = mydft_ntt(x)
  % VanderMonde matrix using primes
  N = length(x);
  V = zeros(N,N);
  [root, prime] = rootsofunity(N);
  omega  =  root;
  for k = 0:N-1
      for n = 0:N-1
          V(n+1, k+1) = exp(rem(omega*n*k, prime));
      end
  end

  result = x*V;
end
