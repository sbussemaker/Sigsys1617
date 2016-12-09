% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function c = circorr(x,y)
	N = length(x);
	c = zeros(N,1);
	for d = 1:N
		for n = 1:N
			k = mod(n+d, N)+1;
			l = x(n) * y(k);
			c(d) += l;
		end
	end
end