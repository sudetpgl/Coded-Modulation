function [seq_out] = map_to_constellation(seq_in,X,label)

m = size(label,2);
no_symb = length(seq_in)/m;
bits = seq_in(1:1+m-1); 
for i = 1:size(label,1)
    idx = find(ismember(label, bits,'rows'));
end
seq_out(1) = X(idx); 
for i = 1+m:m:length(seq_in) 
    bits = seq_in(i:i+m-1); 
    idx = find(ismember(label, bits,'rows'));
    seq_out(i-(m-1)) = X(idx);    
end      
end
