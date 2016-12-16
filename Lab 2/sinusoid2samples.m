function samples = sinusoid2samples(amplitude, omega, phi, samplerate)
	samples = zeros(1,samplerate);
	for i = 0:(samplerate)
		samples(i+1) = amplitude * cos (omega*i/samplerate + phi);
	end
end
