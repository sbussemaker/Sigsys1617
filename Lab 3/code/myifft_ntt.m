function a = myifft_ntt(y, w, p)
  % Input:  A vector y of values of the polynomial for a at the nth roots
  %         of unity and a primitive nth root of unity w, where n is a 
  %         power of 2
  % Output: An n-length coefficient vector a = [a0, a1, ..., a(n-1)]
  
  N = length(y);
  
  a = zeros(1, N);
  for k = 0:N-1
    y2 = 0;
    for n = 0:N-1
%       y2(n+1) = rem(y(n+1)*rem(w.^rem(-n*k, p), p) ,p);
%       y2 = y2 + rem(y(n+1)*mod(mod(w.^modinverse(N, p)*k, p).^n, p), p);
      thing = power(w, -n*k)
      y2 = y2 + mod(y(n+1)* thing, p);
    end
    a(k+1) = rem(modinverse(N, p)*y2, p);
  end
end
