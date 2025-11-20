function seq_out = repetition(seq_in, n, k)
%REPETITION Summary of this function goes here
%   Detailed explanation goes here

R = k/n;
nr = 1/R;
seq_out =[];
for i = 1:nr
    seq_out = [seq_out; seq_in];
end
seq_out = seq_out(:).';

end

