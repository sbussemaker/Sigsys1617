function a = fastINTT(y, w, p)
  % Input:  A vector y of values of the polynomial for a at the nth roots
  %         of unity and a primitive nth root of unity w, where n is a 
  %         power of 2
  % Output: An n-length coefficient vector a = [a0, a1, ..., a(n-1)]
  
  N = length(y);
  if nargin < 2
    [g, p] = rootsofunity(N);
    k = (p-1)/N;
    w = g^k;
  end
  
  % Base case
  if N == 1
    a = y;
    return 
  end
  
  % Divide Step, which seperates even and odd indices
  x = power(w, 0);
  a_even = y(1:2:end);
  a_odd  = y(2:2:end);
  
  % Recursive Calls, with w^2 as (n/2)th root of unity, by the reduction
  % property
  y_even = fastINTT(a_even, rem(power(w,2), p), p);
  y_odd  = fastINTT(a_odd, rem(power(w,2), p), p);
  
  a = zeros(1, N);
  % Combine Step, using x = w^i
  for i = 1:N/2
    a(i)     = rem(y_even(i) + rem(x * y_odd(i), p), p);
    a(i+N/2) = rem(y_even(i) - rem(x * y_odd(i), p) + p, p);
    x = rem(x*w, p);
  end
  
  % Mooie comment
  if nargin < 2
    a = rem(real(modinverse(N, p) * a), p);
    a(2:end) = a(end:-1:2);
  end
end
