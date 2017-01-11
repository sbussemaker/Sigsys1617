function result=vdm(x)
  N=length(x);
  vdm=zeros(N,N);
  omega = -1j*2*pi/N;
  for k=0:N-1
      for n=0:N-1
          vdm(n+1, k+1)=exp(omega*n*k);
      end
  end

  result = x*vdm;
end