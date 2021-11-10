function schedule = SL2_depreciation(delta_1, delta_2, T_1, T_2)
% Author: Francesco Furno
% Created: 04 February 2021
% Last Revision: 05 February 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Generate a Straight-Line Depreciation with Two Rates

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding additional zeros to the depreciation schedule
Extra_periods = 5;

% Sometimes the time-horizon is non-integer, let's round it
T_1 = round(T_1, 0);
T_2 = round(T_2, 0);

schedule = [ones(T_1, 1) .* delta_1; ones(T_2, 1) .* delta_2;  zeros(Extra_periods, 1)];    


% Sanity Check on depreciation schedule
tol = 0.01;

if ( (sum(schedule)-1) > tol )
    warning('Amount of deductions differs from 100%')
    disp(strcat('Total Depreciation Deductions (No Discount) = ', string(sum(schedule))))
end

end
