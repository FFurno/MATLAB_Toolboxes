function [IRF_scaled, IRF_original] = IRF_extractor(oo_, M_)
% Author: Francesco Furno
% Created: 14 March 2020
% Last Revision: 14 March 2020
% Goal: This function extracts the IRFs (in deviations and in levels) of the model in a structure
% with fields equals to the variables names and subfields for each shock

var_list = M_.endo_names;
shock_list = M_.exo_names;
N_vars = size(var_list, 1);
N_shocks = size(shock_list, 1);

IRF_aux = oo_.irfs;
IRF_names_aux = fields(IRF_aux);
SS_aux = oo_.steady_state;

% The loop converts the variable list into a cell array
for j = 1 : N_vars
    var_list_aux = convertCharsToStrings(var_list(j, :));
    var_list_aux = strsplit(var_list_aux);
    var_list_ready{j} = var_list_aux{1};    
end

% The loop converts the shock list into a cell array
for j = 1 : N_shocks
    shock_list_aux = convertCharsToStrings(shock_list(j, :));
    shock_list_aux = strsplit(shock_list_aux);
    shock_list_ready{j} = shock_list_aux{1};    
end


for shock_index = 1 : N_shocks
    for var_index = 1 : N_vars
        index_aux = var_index + (shock_index - 1) * N_vars;
        IRF_original.(var_list_ready{var_index}).(shock_list_ready{shock_index}) = IRF_aux.(IRF_names_aux{index_aux});
        IRF_scaled.(var_list_ready{var_index}).(shock_list_ready{shock_index}) = IRF_aux.(IRF_names_aux{index_aux}) ./ SS_aux(var_index);
    end
end




end
