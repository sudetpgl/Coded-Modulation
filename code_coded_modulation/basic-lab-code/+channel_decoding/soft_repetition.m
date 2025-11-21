function [seq_out] = soft_repetition(seq_in,n,k)
%SOFT_REPETITION Summary of this function goes here
%   Detailed explanation goes here

seq_out = uint8(zeros(1,k));
nr = n / k; 
for i = 1:k
    block = seq_in((i-1)*nr + (1:nr));
    llr_sum = sum(block);
    if llr_sum >= 0
        seq_out(i) = 0;
    else
        seq_out(i) = 1;
    end
end

end

