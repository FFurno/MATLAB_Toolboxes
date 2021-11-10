function PDV_out = PDV_depreciation(depreciation_schedule, discount_factor)
% Author: Francesco Furno
% Created: 20 February 2020
% Last Revision: 20 February 2020
% Goal: Compute the discounted value of any depreciation schedule 
% Input: vector with depreciation schedule, discount factor

    PDV_out = 0;
    for index = 1 : length(depreciation_schedule)
        PDV_aux = discount_factor.^(index - 1) .* depreciation_schedule(index);
        PDV_out = PDV_out + PDV_aux;
    end
end