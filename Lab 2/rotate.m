% Vincent de Wit (s3038858)
% Stefan Bussemaker (s2004674)
function rotated = rotate(sig ,n)
%rotate - Rotate signal sig by n elements
%needs 0 <= n <= length(sig)
  rotated = [sig(end-n+1:end) sig(1:end-n)];
end
