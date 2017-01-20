function y = slowDFT(a)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  N = length(a);
  w = exp(-1j*2*pi/N);  % Omega

  V = zeros(N);         % Make VanderMonde matrix
  for k = 0:N-1
      for n = 0:N-1
          V(k+1, n+1) = (w.^k).^n; % F[i,j] = w^nk
      end
  end

  y = a*V;        % Multiply coefficient vector with matrix to obtain y
end
