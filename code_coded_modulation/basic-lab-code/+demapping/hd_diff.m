function [seq_out] = hd_diff(seq_in,X,label)

%% hd-diff is a hard-decision differential demodulation for PSK
% it takes noisy input symbols, constructs a new complex symbol whose phase
% is the phase difference of two consecutive symbols. Then, with the help of function hd.m we choose the
% closest point in X by Euclidean distance. then we decode the
% corresponding bits. These bits represent, which phase shift was applied
% at the transmitter between two consequtive symbols. These bits are the
% original data bits before differential modulation.

m = size(label,2);
seq_out = zeros(1,length(seq_in)* m );
phase_diff = zeros(1,length(seq_in)-1);

%% Find the phase difference between consequtive symbols
% by multiplying the symbol with its complax conjugate so that we can get: e.g A.B.e ^ phase_k - phase_k-1
j = 1;
for i = 2:length(seq_in)
    ph_norm = seq_in(i) * conj(seq_in(i-1));
    ph_norm = ph_norm/abs(ph_norm); %normalize so only phase matters
    phase_diff(i - 1) = ph_norm;
    j = j + 1;
end

 % Demap each phase difference to the closest constellation point
K = length(phase_diff);
decoded_bits = zeros(1, K * m);
bitpos = 1;
for k = 1:K
    dist2 = abs(phase_diff(k) - X).^2;
    [~, idx] = min(dist2);
    decoded_bits(bitpos : bitpos + m - 1) = label(idx, :);
    bitpos = bitpos + m;
end
seq_out = [zeros(1, m), decoded_bits];

% hd needs komplex input therefore we haven't use angle() function for phase_diff

end

