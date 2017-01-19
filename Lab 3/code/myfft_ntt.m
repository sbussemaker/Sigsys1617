function y = myfft_ntt(a, w, p)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  N = length(a);
  if nargin < 2
    [g, p] = rootsofunity(N);
    k = (p-1)/N;
    w = g^k;
  end
  
  % Base case
  if N == 1
    y = a;
    return 
  end
  
  % Divide Step, which seperates even and odd indices
  x = power(w, 0);
  a_even = a(1:2:end);
  a_odd  = a(2:2:end);
  
  % Recursive Calls, with w^2 as (n/2)th root of unity, by the reduction
  % property
  y_even = myfft_ntt(a_even, rem(power(w,2), p), p);
  y_odd  = myfft_ntt(a_odd, rem(power(w,2), p), p);
  
  y = zeros(1, N);
  % Combine Step, using x = w^i
  for i = 1:N/2
    y(i)     = rem(y_even(i) + rem(x * y_odd(i), p), p);
    y(i+N/2) = rem(y_even(i) - rem(x * y_odd(i), p) + p, p);
    x = rem(x*w, p);
  end  
end
