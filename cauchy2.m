%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 6 CAUCHY PROCESS GENERATOR %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function C = cauchy2(T)

dt = diff(T);
dZ = sqrt(dt) .* tan(pi * (rand(1, numel(dt)) - 0.5));

C = cumsum([0, dZ]);
end




