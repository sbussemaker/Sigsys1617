function [result, V] = mydft(x)
  N = length(x);
  omega = exp(-1j*2*pi/N);
  
  V = zeros(N);
  for k = 0:N-1
      for n = 0:N-1
          V(k+1, n+1) = (omega.^k).^n;
      end
  end

  result = x*V;
end
