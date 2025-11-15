function [X,label] = get_ook()
%GET_OOK Initialization of On-Off-Keying (OOK) constellation. Outputs the
%points and labels of an OOK constellation with unit average power.
%
% Outputs:
%   X:      Vector of dimension 1xM containing the M symbols of the OOK
%           constellation
%   label:  Matrix of size Mxm containing the binary labels of the OOK
%           symbols where m=log2(M)

X = [0, sqrt(2)]; % (0^2 + A^2)/2 = 1 -> unit average power 
label = [0 , 1]'; % [0 ; 1] = [0 , 1]' 

end