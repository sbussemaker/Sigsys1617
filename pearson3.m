% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function p = pearson2(x, y)
  N = length(x);  % number of sign samples
  M = length(y);  % number of mask samples
  if (N < M)
    error('pearson2(x,y): mask is longer than signal');
  end

  p = zeros(1, N);
  
  x2 = [x(end-M+1:end); x];      % prepend x
  
  Y2 = sqrt(sum((y - mean(y)).*(y - mean(y))));
  
  d = 1;
  x_masked = x2(d:d+M-1);
  mean_x = mean(x_masked);
  
  for d = 1:N
    
    x_masked = x2(d:d+M-1); 
    x_minus_mean_x = x_masked - mean_x;
    X2 = sqrt(sum(x_minus_mean_x.*x_minus_mean_x));
    denom = X2 * Y2;

    if (denom == 0)
      p(d) = 0;
    else 
      enum  = sum(conv(x_minus_mean_x, fliplr(y) - mean(y),'valid'));
      p(d) = enum / denom;
    end
    mean_x = mean_x - ((x(d)-x2(d+M-1)) / N);
  end
end
