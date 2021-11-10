function schedule = DBSL_depreciation(delta_db, delta_sl, T_db, T_sl)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 04 February 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Generate a Declining-Balance Depreciation Schedule that Switches to Straight-Line 
% Input: DB depreciation rate, SL depreciation rate, Years for DB, Years
% for SL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
schedule = [zeros(T_db + round(T_sl, 0), 1); zeros(5, 1)];

for index_db = 1 : T_db
    schedule(index_db) = delta_db .* (1 - delta_db).^(index_db - 1);
end

for index_sl = (T_db + 1) : (T_db + round(T_sl, 0))
    schedule(index_sl) = delta_sl;
end

% Sanity Check on depreciation schedule
tol = 0.01;

if ( abs(sum(schedule)-1) > tol )
    warning('Amount of deductions differs from 100%')
    disp(strcat('Total Depreciation Deductions (No Discount) = ', string(sum(schedule))))
end

end



