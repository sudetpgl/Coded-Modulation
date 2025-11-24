function [N0] = get_N0(snr_type, snr_dB, M, X, coderate)

%In the 'ebn0' we calculate the noise spectral density based on the bit's
%average energy, in the 'esn0' we base it on the symbol's average energy

N0 = 0;
snr = 10^(snr_dB/10);
Es = 1/M*sum(X.^2);
Eb = 1/M*sum(X.^2)/(log2(M)*coderate);
switch snr_type
    case 'ebn0'
        N0 = Eb/snr;
    case 'esn0'
        N0 = Es/snr;
    case 'snr'
       N0 = 10*log(Es)/snr_dB;
end

end

