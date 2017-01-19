function y = myift(a)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  
  N = length(a);
  w = exp(1j*2*pi/N); % Omega, without minus in exponent
  
  V_inv = zeros(N);
  for k = 0:N-1
      for n = 0:N-1
          V_inv(k+1, n+1) = (w.^k).^n;  % F[i,j] = w^-nk
      end
  end
  
  y = (1/N)*a*V_inv; % Multiply and divide by N
end
