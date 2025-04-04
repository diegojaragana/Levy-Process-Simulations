%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 5 CORRELATED BROWNIAN PROCESS GENERATOR %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function B2 = browniancorr(T, mu, sigma, mu2, sigma2, rho, zero1, zero2)

dt = diff(T);

dW1 = sqrt(dt) .* randn(1, numel(dt));
dB1 = mu .* dt + sigma .* dW1;
B1 = cumsum([0, dB1]);
B1 = B1 - B1(zero1);

dW2 = sqrt(dt) .* randn(1, numel(dt));
dB2 = mu2 .* dt + sigma2 .* (rho .* dW1 + sqrt(1 - rho^2) .* dW2);
B2 = cumsum([0, dB2]);
B2 = B2 - B2(zero2);

assignin('base', 'B1', B1);
assignin('base', 'B2', B2);
end