// RBC Model
// Surprise Productivity Shocks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var Y, profit, D, P, I, A, C, L, K, MPK, MPL;

varexo A_exo;

parameters beta, delta, phi, sigma, alpha, rho;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Calibration %%%%%%

% Household Parameters
beta  = 0.99;
delta = 0.025;
phi =   (1)^(-1); 
sigma = (1)^(-1);

% Firm Parameters
alpha = 0.33;
rho = 0.97;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model;

% Euler Equation for Capital Investment
C^(-sigma) = beta * C(+1)^(-sigma) * (1 + MPK(+1) - delta) ;

% Euler Equation for Stock Investment
C^(-sigma) = beta * C(+1)^(-sigma) * ( ( P(+1) + D(+1) )/ P ) ;

% Labor Supply
L^(phi) = C^(-sigma) * MPL;

% Resources Constraint
C + K = K(-1) * (1 + MPK - delta) + MPL * L;

% Capital Law of Motion
K = (1 - delta) * K(-1) + I;

% Definition of Accounting-Profit
D = profit;
profit = Y - MPL * L - I;

% Production Function
Y = A * K(-1)^(alpha) * L^(1-alpha);
MPL = A * (1 - alpha) * L^(-alpha) * K(-1)^(alpha);
MPK = A * alpha * K(-1)^(alpha - 1) * L^(1 - alpha);


% Productivity Process 
A = A_exo * A(-1)^rho;


end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initval;

// Exogenous Vars
A_exo = 1;

// Endogenous Vars
L = 1;
K = 15;
A = 1;

I = delta * K;
P = K;
Y = A * K^(alpha) * L^(1-alpha);
MPL = A * (1 - alpha) * L^(-alpha) * K^(alpha);
MPK = A * alpha * K^(alpha - 1) * L^(1 - alpha);
C = K * (MPK - delta) + MPL * L;
profit = Y - MPL * L - I;
D = profit;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
shocks;
var A_exo = 1;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
steady;
stoch_simul(order=1);






