% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function p = circpearson(x, y)
  lenx = length(x);  % number of samples
  if (lenx ~= length(y))
    error('pearson(x,y): x and y are not of the same shape');
  end
  
  meanx = sum(x)/lenx;
  meany = sum(y)/lenx;
  p = zeros(lenx, 1);
	for d = 1:lenx
		enum = 0; X2 = 0; Y2 = 0;
		for i = 1:lenx
      X = x(i) - meanx;
      Y = y(mod( ( ( i-1 ) + ( d-1 ) ) ,lenx) + 1 )-meany;
      enum  = enum  + X * Y;
      X2 = X2 + X * X;
      Y2 = Y2 + Y * Y;
    end
    denom = sqrt(X2) * sqrt(Y2);		
    
		if ( denom == 0)
			p(d) = 0;
		else 
			p(d) = enum / ( denom );
		end
	end
end
