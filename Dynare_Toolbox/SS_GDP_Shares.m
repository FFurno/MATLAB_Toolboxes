function Y_shares = SS_GDP_Shares(SS, GDP)
% Author: Francesco Furno
% Created: 07 March 2021
% Last Revision: 07 March 2021
% Goal: This function computes the GDP shares of SS variables

vars_name = fields(SS);
N_vars  = size(vars_name, 1);

for index = 1 : N_vars
    variable_aux = vars_name{index};
    Y_shares.(variable_aux) =  (SS.(variable_aux) / GDP);
end