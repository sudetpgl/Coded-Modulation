function [seq_out] = sd(seq_in,X,label,N0)
%SD Summary of this function goes here
%   Detailed explanation goes here
seq_out = zeros(1,length(seq_in)*size(label,2));
M = length(X);
bpsymb = log2(M);
num_symb = length(seq_in);
for i = 1:num_symb
    y = seq_in(i);
    for b = 1:bpsymb
        X0 = X(label(:,b) == 0);
        X1 = X(label(:,b) == 1);
        d0 = abs(y - X0).^2;
        d1 = abs(y - X1).^2;
        llr = -min(d1)/N0 + min(d0)/N0;
        seq_out((i-1)*bpsymb + b) = llr;
    end
end

end

