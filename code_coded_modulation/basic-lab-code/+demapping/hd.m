function [seq_out] = hd(seq_in,X,label)
% The function calculates the minimum distance between seq_in and
% constellation and puts seq_out the corresponding binary element from
% label.

seq_out = zeros(1,length(seq_in)*size(label,2));
m = size(label,2);
mapped = [];

for i = 1:length(seq_in)
    for j = 1:length(X)
        diff(j) = abs(seq_in(i)-X(j));

    end
    [~, min_pos] = min(diff);
    seq_out((i*m-1):(i*m)) = label(min_pos,:);
end 
end 

