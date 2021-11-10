function [schedule, delta_pi_approximation] = Approximating_depreciation_HL(depreciation_schedule)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 10 November 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: It produces the approximated DB depreciation schedule of any
% depreciation schedule using the HL.
% Input: vector with depreciation schedule.
% Note: It computes the HL, then recovers the rate, then produces the
% DB depreciation schedule. 
% Validation: Try to approximate DB. There is small approximation error due
% to linear interpolation of half-life. The approximation error is higher
% when the DB-depreciation is very accelerated.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First: Compute Half-Life of Original Depreciation Schedule
HL_original = HL_depreciation(depreciation_schedule);

% Second: Compute Depreciation Rate that Yields same Half-Life in DB
if (HL_original == 0.5)
    delta_pi_approximation = 1;
else
    delta_pi_approximation = 1 - (1 - 0.5).^(1/HL_original);
end

% Third: Generating Approximated Depreciation Schedule
schedule = DB_depreciation(delta_pi_approximation);


end