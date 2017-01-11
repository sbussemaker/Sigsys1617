function result = myconv(x, y)
  result = real(ifft(fft(x).*fft(y)));
end
