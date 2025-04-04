%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 6 CAUCHY PROCESS GENERATOR %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function C = cauchy3(T, mu, sigma)

dt = diff(T);
dZ = sqrt(dt) .* tan(pi * (rand(1, numel(dt)) - 0.5));

dC = mu .* dt + sigma .* dZ;
C = cumsum([0, dC]);
end