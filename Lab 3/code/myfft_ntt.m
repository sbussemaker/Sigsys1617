function y = myfft_ntt(a, w, prime)
  % Input:  An n-length coefficient vector a = [a0, a1, ..., a(n-1)] and a
  %         primitive nth root of unity w, where n is a power of 2
  % Output: A vector y of values of the polynomial for a at the nth roots
  %         of unity
  
  N = length(a);
  
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
  y_even = myfft_ntt(a_even, mod(power(w,2), prime), prime);
  y_odd  = myfft_ntt(a_odd, mod(power(w,2), prime), prime);
  
  y = zeros(1, N);
  % Combine Step, using x = w^i
  for i = 1:N/2
    y(i)     = mod(y_even(i) + mod(x * y_odd(i), prime), prime);
    y(i+N/2) = rem(y_even(i) - mod(x * y_odd(i), prime) + prime, prime);
    x = mod(x*w, prime);
  end  
end
