function [seq_out] = hard_repetition(seq_in,n,k)
%HARD_REPETITION Take blocks of bits that represent one input bit and
%checks which has the highest occurance (0 or 1) and reconstruct the input
%sequence.

seq_out = uint8(zeros(1,k));
nr = n/k;
for i = 1:k
    block = seq_in((i-1)*nr + (1:nr));
    seq_out(i) = sum(block) >= (nr/2);
end


end

