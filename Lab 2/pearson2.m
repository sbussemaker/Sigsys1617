% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function p = pearson2(x, y)
  N = length(x);  % number of sign samples
  M = length(y);  % number of mask samples
  if (N < M)
    error('pearson2(x,y): mask is longer than signal');
  end

  p = zeros(1, N);
  x2 = [x x(1:M)];      % extend x
  
  Y2 = sqrt(sum(power(y - mean(y),2)));
  for d = 1:N
    x_masked = x2(d:d+M);
    enum  = sum(conv(x_masked, fliplr(y)));
    X2 = sqrt(sum(power(x_masked - mean(x_masked),2)));
    denom = X2 * Y2;

    if (denom == 0)
      p(d) = 0;
    else 
      p(d) = enum / denom;
    end
  end
end
