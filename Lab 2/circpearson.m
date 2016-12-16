% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function p = circpearson(x, y)
  lenx = length(x);  % number of samples
  if (lenx ~= length(y))
    error('pearson(x,y): x and y are not of the same shape');
  end
meanx = sum(x)/lenx
meany = sum(y)/lenx
	for d = 1:lenx
		Z = 0; X2 = 0; Y2 = 0;
		for i = 1:lenx
			X = x(i)-meanx;
			Y = y(mod( ( ( i-1 ) + ( d-1 ) ) ,lenx) + 1 )-meany;
			Z += X * Y;
			X2 += X * X;
			Y2 += Y * Y;
		end
		
		X = sqrt(X2);
		Y = sqrt(Y2);
		
		if ( X * Y == 0)
			p(d) = 0;
		else 
			p(d) = Z / ( X * Y );
		end
	end
end
