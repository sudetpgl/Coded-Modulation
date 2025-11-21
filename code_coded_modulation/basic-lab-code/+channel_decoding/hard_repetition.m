function [seq_out] = hard_repetition(seq_in,n,k)
%HARD_REPETITION Summary of this function goes here
%   Detailed explanation goes here

seq_out = uint8(zeros(1,k));
nr = n/k;
for i = 1:k
    block = seq_in((i-1)*nr + (1:nr));
    seq_out(i) = sum(block) >= (nr/2);
end


end

