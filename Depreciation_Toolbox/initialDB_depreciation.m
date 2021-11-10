function schedule = initialDB_depreciation(delta_first_year, delta_db)
% Author: Francesco Furno
% Created: 04 February 2021
% Last Revision: 10 November 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Generate a schedule with an initial deduction followed by a
% declining-balance schedule on the remaining amount.
% Input: First-year depreciation rate, DB depreciation rate for remainder
% Note: Full-Recovery by construction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
extra_periods = 5;
index = 1;
cum_schedule = 0;
recovery_rate_target = 0.999;

while ((cum_schedule + delta_first_year) < recovery_rate_target) 
    schedule(index, 1) = delta_db .* (1 - delta_db)^(index - 1);
    cum_schedule = sum(schedule);
    index = index + 1;
end


schedule = [delta_first_year; schedule; zeros(extra_periods, 1)];


end



