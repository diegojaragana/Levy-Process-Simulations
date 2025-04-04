%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 2 WEINER PROCESS GENERATOR %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function W1 = wiener(T)

dt = diff(T);
dW = sqrt(dt) .* randn(1, numel(dt));

W1 = cumsum([0, dW]);
end