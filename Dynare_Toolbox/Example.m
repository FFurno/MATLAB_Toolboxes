%% Dynare Toolbox
% Example

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
clear, close all, clc

% Run Dynare .mod file 
dynare RBC_example.mod
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract Variables Names
var_list_extractor(M_)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract Steady-State
[SS_endogenous_vars, SS_exogenous_vars] = SS_extractor(oo_, M_);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steady-State Scaled by GDP
SS_GDP_Shares(SS_endogenous_vars, SS_endogenous_vars.Y)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract IRF
[IRF_percentage, IRF_levels] = IRF_extractor(oo_, M_); 

figure
hold on
plot([0, IRF_percentage.Y.A_exo], '-o')
plot([0, IRF_percentage.C.A_exo], '-o')
plot([0, IRF_percentage.I.A_exo], '-o')
plot([0, IRF_percentage.K.A_exo], '-o')
plot([0, IRF_percentage.L.A_exo], '-o')
hold off
title('Response to Productivity Shock');
ylabel('Deviation from SS (%)');
legend('Y', 'C', 'I', 'K', 'L');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Percentage Change from Old Steady-State to New Steady-State
set_param_value('alpha', 0.37), steady;
[SS_endogenous_vars_new, ~] = SS_extractor(oo_, M_);
SS_change = SS_percent_change(SS_endogenous_vars_new, SS_endogenous_vars);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute and Extract Transition Permanent Increase in A 
clear, dynare RBC_example.mod, close all 
[Transition_level, Transition_deviations] = Transition_extractor(1, (1+2.9855e-04), 1000);

 

figure
hold on
plot([Transition_deviations.Y], '-o')
plot([Transition_deviations.C], '-o')
plot([Transition_deviations.I], '-o')
plot([Transition_deviations.K], '-o')
plot([Transition_deviations.L], '-o')
hold off
title('Response to Permanent Productivity Increase');
ylabel('Deviation from SS (%)');
legend('Y', 'C', 'I', 'K', 'L');
xlim([0, 100]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning Temporary Files
clean_dynare_output('RBC_example')




