function SS_delta = SS_percent_change(SS_new, SS_old)
% Author: Francesco Furno
% Created: 16 March 2020
% Last Revision: 16 March 2020
% Goal: This function computes the percentage change from two steady-states
% Note: Number of fields in SS has to be same
% Note: Variable in old steady-state but not new --> Ignored
% Note: Variable in new steady-state but not old --> Error

vars_name_new = fields(SS_new);
vars_name_old = fields(SS_old);
N_vars_new  = size(vars_name_new, 1);
N_vars_old = size(vars_name_old, 1);

if ( N_vars_new ~= N_vars_old )
    N_vars_new
    N_vars_old
    error('Steady-States of different size')
end

for index = 1 : N_vars_new
    variable_aux = vars_name_new{index};
    SS_delta.(variable_aux) = 100 * (SS_new.(variable_aux) / SS_old.(variable_aux) - 1);
end



end