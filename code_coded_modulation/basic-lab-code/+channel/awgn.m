function [seq_out] = awgn(seq_in, N0)

% Generate a random normally distributed array that we put over seq_in.

seq_out = zeros(size(seq_in));
if isreal(seq_in)
   noise = randn(size(seq_in))*sqrt(N0/2); %Formula from Mathworks forum
   seq_out = seq_in + noise;
else
    noise = randn(size(seq_in),like=1i)*sqrt(N0);
    seq_out = seq_in + noise;
end


end
