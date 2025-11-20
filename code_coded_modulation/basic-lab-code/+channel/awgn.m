function [seq_out] = awgn(seq_in, N0)

seq_out = zeros(size(seq_in));
if isreal(seq_in)
   noise = randn(size(seq_in))*sqrt(N0/2);
   seq_out = seq_in + noise;
else
    noise = randn(size(seq_in),like=1i)*sqrt(N0);
    seq_out = seq_in + noise;
end


end
