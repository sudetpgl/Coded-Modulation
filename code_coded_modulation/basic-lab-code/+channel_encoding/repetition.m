function seq_out = repetition(seq_in, n, k)
%REPETITION Repets each bits how many times it is required to equally fill
%seq_out.

R = k/n;
nr = 1/R;
seq_out =[];
for i = 1:nr
    seq_out = [seq_out; seq_in];
end
seq_out = seq_out(:).';

end

