function schedule = SL_depreciation(J)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 05 February 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Generate a Straight-Line Depreciation Schedule over J years
% Input: Number of Depreciation Periods J
% Note: Full recovery by construction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding additional zeros to the depreciation schedule
Extra_periods = 5;

% Sometimes expensing-horizon J is not integer, let's round
J = round(J, 0);


if (J == 0)
    schedule = zeros(Extra_periods, 1);
else
    schedule = [ones(J, 1) / J; zeros(Extra_periods, 1)];
end


end
