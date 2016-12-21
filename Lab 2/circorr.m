% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function z = circorr(x, y)
    N = length(x);                      % each consist of N samples
    z = zeros(1, N);                    % allocate memory for result
    
    for d = 1:N
        for n = 1:N
            k = mod(n-1+d-1, N) + 1;    % apply 'mod' operator, fix index
            z(d) = z(d) + x(n)*y(k);    % add product
        end
    end
end
