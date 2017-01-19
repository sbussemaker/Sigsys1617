function y = myift(a)
  N = length(a);
  w = exp(1j*2*pi/N);
  
  V_inv = zeros(N);
  for k = 0:N-1
      for n = 0:N-1
          V_inv(k+1, n+1) = (w.^k).^n;
      end
  end
  
  y = (1/N)*a*V_inv;
end
