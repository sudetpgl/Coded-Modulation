unction [seq_out] = map_to_constellation(seq_in,X,label)
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


number_of_symbols = length(seq_in)/size(label,2); % lenght of seq_in / number of bits per symbol
seq_out = zeros(1,number_of_symbols);  

for k = 1:number_of_symbols
    
    %Extract m bits for from seq_in for the current symbol
    bits = seq_in((k-1)*m+1 : k*m);

    % Find the index of the  matching row in the label coloumn vector
    idx = find (all(label = bits),2); % all(A,2) tests the rows of A, find() gives the index

    % Get the corresponding symbol from the row vector X and write it into seq_out in the correponding index
    seq_out(k) = X(idx);
end       


end

