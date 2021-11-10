function HL = HL_depreciation(depreciation_schedule)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 05 February 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goal: Computes half-life of any depreciation schedule  
% Input: vector containing depreciation schedule
% Note: it uses a linear interpolation

%%%%%%%%%%%%%%%%%%%%%%%
depreciation_RR_aux = sum(depreciation_schedule(:));


%%%%%%%%%%%%%%%%%%%%%%%
% Computing Half-Life

if (depreciation_RR_aux < 0.9 || depreciation_RR_aux > 1.1)
    HL = nan;
    warning('No Full Cost Recovery --> Half-Life Not Calculated')
    
else
    life_after = 1;
    index_after = 0;
    
    while life_after > 0.5
        life_after = life_after - depreciation_schedule(index_after + 1);
        index_after = index_after + 1;
    end
    
    index_before = index_after - 1;
    life_before  = life_after + depreciation_schedule(index_after);
    
    % Linear Interpolation
    delta_aux = life_before - life_after;
    missing_aux = life_before - 0.5;
    HL =  missing_aux/delta_aux + index_before;
end


end
