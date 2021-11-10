function [Transition_level, Transition_deviations, SS_new, SS_old] = Transition_extractor(exo_start, exo_end, T)
% Author: Francesco Furno
% Created: 07 March 2021
% Last Revision: 08 March 2021
% Goal: This function computes the Transition Path from One SS to Another
% Instructions: Set Shocks as VAREXO, and then input values of shocks
% before (exo_start) and after (exo_end);

%%%%%%%%%%%%%%%%%%%%%%%
global options_ oo_ M_
options_.periods = T;


%%%%%%%%%%%%%%%%%%%%%%%
% Sanity Checks First
if ( min((size(exo_start) == size(exo_end))) < 1 )
    error('Start and End have different size!')
end

if isempty(oo_.exo_steady_state)
    error('No VAREXO in the model!');
end


if ( min(size(exo_start(:)) == size(oo_.exo_steady_state(:))) < 1 )
    error('Input for VAREXO does not match the model!')
end


%%%%%%%%%%%%%%%%%%%%%%%%
% Add Text Showing What is Set to What (TO DO)


%%%%%%%%%%%%%%%%%%%%%%%
% End Steady-State
oo_.exo_steady_state = exo_end(:);
oo_.exo_simul = exo_end(:)';
steady;
SS_end_endo = oo_.steady_state;
SS_end_exo = oo_.exo_steady_state;

%%%%%%%%%%%%%%%%%%%%%%%
% Initial Steady-State
oo_.exo_steady_state = exo_start(:);
oo_.exo_simul = exo_start(:)';
steady;
SS_start_endo = oo_.steady_state;
SS_start_exo = oo_.exo_steady_state;

%%%%%%%%%%%%%%%%%%%%%%%
% Running Perfect Foresigh Setup (Initializes Objects)
perfect_foresight_setup;

oo_.exo_simul(1, :) = SS_start_exo';
oo_.exo_simul(2:end, :) = repmat(SS_end_exo', T+1, 1);

oo_.endo_simul(:, 1) = SS_start_endo;
oo_.endo_simul(:, 2:end) = repmat(SS_end_endo, 1, T+1);



options_.simul.maxit = 1500;
perfect_foresight_solver;


%%%%%%%%%%%%%%%%%%%%%%
% Endogenous Variables
SS_aux = SS_start_endo;
var_list = M_.endo_names;
N_vars = size(var_list, 1);


for j = 1 : N_vars
    var_list_aux = convertCharsToStrings(var_list(j, :));
    var_list_aux = strsplit(var_list_aux);
    var_list_ready{j} = var_list_aux{1};    
end

for index = 1 : size(var_list_ready, 2)
    Transition_level.(var_list_ready{index}) = (oo_.endo_simul(index, :))';
    Transition_deviations.(var_list_ready{index}) = 100 * ( ( oo_.endo_simul(index, :)' ./ SS_aux(index, 1) ) - 1 );
end


SS_new = SS_end_endo;
SS_old = SS_start_endo;
