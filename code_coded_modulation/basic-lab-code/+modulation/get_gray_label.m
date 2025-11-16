function [label] = get_gray_label(m)
%GET_GRAY_LABEL This function generates a binary Gray code of length m.
%
% Input:
%   m: length of the binary codeword
%
% Output
%   label: a matrix of size Mxm containing all M codewords of a binary Gray
%   code such that two consecutive rows differ in exactly one position


label = zeros(2^m,m);


A = [0;1];

if m == 1
    label = A;
end 

for i = 2:m
  
   B = flipud(A);
   C = [A; B];
   prefix_0 = zeros(2^(i-1),1);
   prefix_1 = ones(2^(i-1),1);
   prefix = [prefix_0; prefix_1];
   A = [prefix,C];

end 

label = A;

end





