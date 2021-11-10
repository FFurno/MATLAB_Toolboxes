function [SS, SS_exo] = SS_extractor(oo_, M_)
% Author: Francesco Furno
% Created: 14 March 2020
% Last Revision: 07 March 2021
% Goal: This function extracts the steady-state of the model in a structure
% with fields equals to the variables names


%%%%%%%%%%%%%%%%%%%%%%
% Endogenous Variables
SS_aux = oo_.steady_state;
var_list = M_.endo_names;
N_vars = size(var_list, 1);


for j = 1 : N_vars
    var_list_aux = convertCharsToStrings(var_list(j, :));
    var_list_aux = strsplit(var_list_aux);
    var_list_ready{j} = var_list_aux{1};    
end

SS_ready = num2cell(SS_aux);
SS = cell2struct(SS_ready, var_list_ready,1);
clear var_list_ready

%%%%%%%%%%%%%%%%%%%%%
% Exogenous Variables
if isempty(oo_.exo_steady_state)
    SS_exo = [];
    warning('No VAREXO in the Model');
else
    SS_exo_aux = oo_.exo_steady_state;
    var_list_exo = M_.exo_names;
    N_vars_exo = size(var_list_exo, 1);
    for j = 1 : N_vars_exo
        var_list_aux = convertCharsToStrings(var_list_exo(j, :));
        var_list_aux = strsplit(var_list_aux);
        var_list_ready{j} = var_list_aux{1};    
    end
    
    SS_exo_ready = num2cell(SS_exo_aux);
    SS_exo = cell2struct(SS_exo_ready, var_list_ready,1);
end


end