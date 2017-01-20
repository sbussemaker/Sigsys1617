function a = fastIFT(y, w)
  % Input:  A vector y of values of the polynomial for a at the nth roots
  %         of unity and a primitive nth root of unity w, where n is a 
  %         power of 2
  % Output: An n-length coefficient vector a = [a0, a1, ..., a(n-1)]
  N = length(y);
  if nargin < 2                     % set w first time function is called
    w = exp(1j*2*pi/length(y));     % act as some kind of 'wrapper'
  end                               % is ignored within recursion
  
  if N == 1                          % Base case
    a = y; return 
  end
  
  % Divide Step, which seperates even and odd indices
  x = power(w, 0);
  a_even = y(1:2:end);
  a_odd  = y(2:2:end);
  
  % Recursive Calls, with w^2 as (n/2)th root of unity, by the reduction
  % property
  y_even = fastIFT(a_even, power(w,2));
  y_odd  = fastIFT(a_odd, power(w,2));
  
  % Combine Step, using x = w^i
  a = zeros(1, N);
  for i = 1:N/2
    a(i)     = y_even(i) + x * y_odd(i);
    a(i+N/2) = y_even(i) - x * y_odd(i);    
    x = x*w;
  end

  if nargin < 2           % Perform 1/N at the end, not within the
    a = real((1/N)*a);    % recursion
  end
end
