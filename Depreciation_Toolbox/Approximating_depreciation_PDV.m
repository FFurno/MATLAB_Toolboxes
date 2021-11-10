function [schedule, delta_pi_approximation] = Approximating_depreciation_PDV(depreciation_schedule, discount_factor)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 10 November 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: It produces the approximated DB depreciation schedule of any
% depreciation schedule using the PDV.
% Input: vector with depreciation schedule; discount factor to be used for PDV.
% Note: It computes the PDV, then recovers the rate, then produces the
% DB depreciation schedule. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First: Compute PDV of Original Depreciation Schedule
PDV_aux = PDV_depreciation(depreciation_schedule, discount_factor);

% Second: Compute Depreciation Rate that Yields same PDV in DB
rho_aux = 1 / discount_factor - 1;
delta_pi_approximation = (PDV_aux * rho_aux) ./ (1 + rho_aux - PDV_aux);


% Third: Generating Approximated Depreciation Schedule
schedule = DB_depreciation(delta_pi_approximation);


end