function [N0] = get_N0(snr_type, snr_dB, M, X, coderate)

N0 = 0;
snr = 10^(snr_dB/10);
if snr_type == 'ebn0'
     Eb = 1/M*sum(X.^2)/(log2(M)*coderate);
     N0 = Eb/snr;
elseif snr_type == 'esn0'
    N0 = 1/M*sum(X.^2)/snr; 
elseif snr_type == 'snr'
    N0 = 1/M*sum(X.^2)/snr;
end

end

