function schedule = DB_depreciation(delta_pi)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 05 February 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Generate a Declining-Balance Depreciation Schedule 
% Input: DB depreciation rate delta_pi
% Note: There is an issue of when to stop simulating the depreciation schedule
% Here, it simulates until at least 0.99 is recovered
% Note2: Full-Recovery by construction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
index = 1;
cum_schedule = 0;
recovery_rate_target = 0.999;


while (cum_schedule < recovery_rate_target)
    schedule(index, 1) = delta_pi .* (1 - delta_pi)^(index - 1);
    cum_schedule = sum(schedule);
    index = index + 1;
end


end
