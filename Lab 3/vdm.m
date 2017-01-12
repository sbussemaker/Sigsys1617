function [result, V] = vdm(x)
  N = length(x);
  V = zeros(N,N);
  omega  =  -1j*2*pi/N;
  for k = 0:N-1
      for n = 0:N-1
          V(n+1, k+1) = exp(omega*n*k);
      end
  end

  result = x*V;
end