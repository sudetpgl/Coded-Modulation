function [seq_out] = hd(seq_in,X,label)
%HD Summary of this function goes here
%   Detailed explanation goes here

seq_out = zeros(1,length(seq_in)*size(label,2));
m = size(label,2);
mapped = [];
for i = 1:length(X)
    for j = 1:length(seq_in)
        diff(j) = abs(X(i)-seq_in(j));
    end
    [~,min_pos] = min(diff);
   seq_out( (min_pos*m-1) : (min_pos*m) ) = label(i,:);
end

end

