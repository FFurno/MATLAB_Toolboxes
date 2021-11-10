%% Example of FRED_Interface Application

%%%%%%%%%%%%%%%%%
% Cleaning Ops
clear, clc, close all


%%%%%%%%%%%%%%%%%
% Example 1: Several time-series of same length
labels = {'E_mining', 'E_construction', 'E_manuf', 'E_goods_producing'};
series_id = {'USMINE' , 'USCONS', 'MANEMP', 'USGOOD'};
request = containers.Map(labels, series_id);

dataset_1 = FRED_Interface(request);


%%%%%%%%%%%%%%%%%
% Example 2: Two time-series of different length
labels = {'GDP', 'STOCK MARKET'};
series_id = {'GDPA', 'DDEM01KRA156NWDB'};
request = containers.Map(labels, series_id);

dataset_2 = FRED_Interface(request);



%%%%%%%%%%%%%%%%%
% Example 3: Two time-series of different frequency (Returns an Error!)
labels = {'GDP_Q', 'GDP_A'};
series_id = {'GDP' , 'GDPA'};
request = containers.Map(labels, series_id);

dataset = FRED_Interface(request);
