function y = myfft(a, w)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  
  N = length(a);
  if nargin < 2
    w = exp(-1j*2*pi/length(a));
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
  y_even = myfft(a_even, power(w,2));
  y_odd  = myfft(a_odd, power(w,2));
  
  y = zeros(1, N);
  % Combine Step, using x = w^i
  for i = 1:N/2
    y(i)     = y_even(i) + x * y_odd(i);
    y(i+N/2) = y_even(i) - x * y_odd(i);    
    x = x*w;
  end  
end
