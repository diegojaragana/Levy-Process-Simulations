clear all

rng(69)

%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 1 %%%%
%%%%%%%%%%%%%%%%%%%%

N = 53;

T = linspace(0, 1, N);

%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 2 %%%%
%%%%%%%%%%%%%%%%%%%%

M = 5;

Plot1 = figure;
hold on;

for m = 1:M
    W1 = wiener(T);
    plot(T, W1);
end

hold off;

xlabel('Time (Years)');
ylabel('Wiener Process');
title('Wiener Process Paths');
grid on;


%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 3 %%%%
%%%%%%%%%%%%%%%%%%%%

mu = 0.1;
sigma = 0.3;

Plot2 = figure;
hold on;

for m = 1:M
    B2 = brownian(T, mu, sigma);
    plot(T, B2);
end

hold off;

xlabel('Time (Years)');
ylabel('Brownian Process');
title('Brownian Process Paths');
grid on;


%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 4 %%%%
%%%%%%%%%%%%%%%%%%%%

M = 1000;

BN = zeros(1, M);

for m = 1:M
    B2 = brownian(T, mu, sigma);
    BN(m) = B2(end);
end

Plot3 = figure;
histogram(BN, 100, 'Normalization','pdf');

hold on;
x = linspace(min(BN), max(BN), 100);
y = normpdf(x, mu, sigma);
plot(x, y, 'r', 'LineWidth', 2);
hold off;

xlabel('Final Position B_N');
ylabel('Probability Density');
title('Empirical Distribution vs. Theoretical Distribution');
legend('Empirical Distribution', 'Theoretical Distribution');
grid on;

%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 5.1 %%%%
%%%%%%%%%%%%%%%%%%%%%%

M = 5;
mu2 = -0.2;
sigma2 = 0.1;
rho = 0.5;
zero1 = 10;
zero2 = 20;


Plot5 = figure;
hold on;

for m = 1:M
    browniancorr(T, mu, sigma, mu2, sigma2, rho, zero1, zero2);
    plot(T, B2);
end

hold off;

xlabel('Time (Years)');
ylabel('Correlated Brownian Process');
title('Correlated Brownian Process Paths (ρ = 0.5)');
grid on;


%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 6.2 %%%%
%%%%%%%%%%%%%%%%%%%%%%

M = 5;

Plot6 = figure;
hold on;

for m = 1:M
    C1 = cauchy2(T);
    plot(T, C1);
end

hold off;

xlabel('Time (Years)');
ylabel('Cauchy Process');
title('Cauchy Process Paths (Wiener)');
grid on;

%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 6.3 %%%%
%%%%%%%%%%%%%%%%%%%%%%

Plot7 = figure;
hold on;

for m = 1:M
    C2 = cauchy3(T, mu, sigma);
    plot(T, C2);
end

hold off;

xlabel('Time (Years)');
ylabel('Cauchy Process');
title('Cauchy Process Paths (Brownian)');
grid on;

%%%%%%%%%%%%%%%%%%%%%%
%%%% QUESTION 6.4 %%%%
%%%%%%%%%%%%%%%%%%%%%%

M = 1000;

CN = zeros(1, M);

for m = 1:M
    C2 = cauchy3(T, mu, sigma);
    CN(m) = C2(end);
end

Plot8 = figure;
histogram(CN, 100, 'Normalization','pdf');

hold on;
x = linspace(min(CN), max(CN), 100);
y = 1./(pi*sigma*(1+((x-mu)./sigma).^2));
plot(x, y, 'r', 'LineWidth', 2);
axis([x(1) x(end) 0 1.1*max(y)]);
hold off;

xlabel('Final Position C_N');
ylabel('Probability Density');
title('Empirical Distribution vs. Theoretical Distribution');
legend('Empirical Distribution', 'Theoretical Distribution');
grid on;