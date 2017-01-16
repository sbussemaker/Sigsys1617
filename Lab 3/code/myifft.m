function a = myifft(y, w)
  % Input:  A vector y of values of the polynomial for a at the nth roots
  %         of unity and a primitive nth root of unity w, where n is a 
  %         power of 2
  % Output: An n-length coefficient vector a = [a0, a1, ..., a(n-1)]
  
  N = length(y);
  
  a = zeros(1, N);
  for k = 0:N-1
    y2 = zeros(1, N);
    for n = 0:N-1
      y2(n+1) = y(n+1)*power(w, -n*k);
    end
    a(k+1) = (1/N)*sum(y2);
  end
end
