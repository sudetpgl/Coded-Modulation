function [X,label] = get_psk(M)
%GET_PSK Initialization of M-Phase-Shift-Keying (M-PSK) constellation.
%Outputs the points and the labels of an M-PSK constellation with unit
%average power.
%
% Inputs:
%   M:  Number of symbols in the PSK constellation
%
% Outputs:
%   X:      Vector of dimension 1xM containing the M symbols of the PSK
%           constellation
%   label:  Matrix of size Mxm containing the binary labels of the M PSK
%           symbols where m=log2(M)

X = zeros(1,M);
label = zeros(M,log2(M));

% use exp to find the symbols
% e^jθ=cosθ+jsinθ is used for rotation

for i = 0:M-1
    phase = ((2*pi)/M)*i;
    X(i+1) = 1*exp(1j*phase); % the amlitude for PSK is always 1
end
    
label = +modulation.get_gray_label(log2(M));
end