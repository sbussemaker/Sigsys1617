function [ inverse ] = modinverse( a, prime )
  nw = 1;
  old = 0;
  q = prime;
  pos = 0;
  while (a > 0)
    r = mod(q,a);
    q = fix(q/a);
    h = q*nw + old;
    old = nw;
    nw = h;
    q = a;
    a = r;
    pos = 1-pos;
  end
  if (pos == 1)
      inverse = old;
  else
      inverse = prime - old;
  end
end

