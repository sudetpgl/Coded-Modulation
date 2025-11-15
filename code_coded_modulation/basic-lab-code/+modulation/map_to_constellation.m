function [seq_out] = map_to_constellation(seq_in,X,label)
%MAP_TO_CONSTELLATION This function maps a binary input sequence to a
%sequence of symbols from a given constellation using a specified label.
%
% Inputs: 
%   seq_in: binary input sequence of length n given as a 1xn vector of type
%           uint8.
%   X:      vector of size 1xM containing the M-symbols of the given
%           constellation.
%   label:  matrix of size Mxm containing the binary labels of the M
%           symbols. Note that the input length n is always defined as a
%           multiple of m
%
% Outputs:
%   seq_out: vector of size 1x(n/m) containing the output sequence

seq_out = zeros(1,length(seq_in)/size(label,2));
m = size(label,2);
no_symb = length(seq_in)/m;
bits = seq_in(1:1+m-1); 
for i = 1:size(label,1)
    idx = find(ismember(label, bits,'rows'));
end
seq_out(1) = X(idx); 
count = 1;
for i = 1+m:m:length(seq_in) 
    bits = seq_in(i:i+m-1); 
    idx = find(ismember(label, bits,'rows'));
    seq_out(i-count) = X(idx);   
    count = count + 1;
end      
end
