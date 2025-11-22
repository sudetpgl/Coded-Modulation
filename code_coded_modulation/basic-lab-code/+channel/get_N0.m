function [N0] = get_N0(snr_type, snr_dB, M, X, coderate)

%In the 'ebn0' we calculate the noise spectral density based on the bit's
%average energy, in the 'esn0' we base it on the symbol's average energy

N0 = 0;
snr = 10^(snr_dB/10);
switch snr_type
    case 'ebn0'
        Eb = 1/M*sum(X.^2)/(log2(M)*coderate);
        N0 = Eb/snr;
    case 'esn0'
        Es = 1/M*sum(X.^2);
        N0 = Es/snr;
    case 'snr'
       N0 = 1/M*sum(X.^2)/snr;
end

end

