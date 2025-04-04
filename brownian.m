%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 3 BROWNIAN PROCESS GENERATOR %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function B = brownian(T, mu, sigma)

dt = diff(T);
dW = sqrt(dt) .* randn(1, numel(dt));

dB = mu .* dt + sigma .* dW;
B = cumsum([0, dB]);

end