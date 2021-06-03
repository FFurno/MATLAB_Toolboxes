function dataset =  FRED_Interface(request)
% Author: Francesco Furno
% Created: 29 February 2020
% Last Revision: 3 June 2021
% Version: 1.1
% Description: download multiple series from FRED and combine them into a timetable
% Input: a map (i.e. Matlab dictionary) which contains variable names and
% series id
% Note: it can handle time-series of different lenght, and detects
% frequency mismatch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Desired Format
format compact 
format bank

% Setting Up Connection with FRED
fred_url = fred('https://fred.stlouisfed.org/');
fred_url.DataReturnFormat = 'table';
fred_url.DatetimeType = 'datetime';

% Extracting Values of Request
names = keys(request);
series = values(request);


%%%%%%%%%%%%%%%%%%%%%%%%%
% Frequency Mismatch Check
Frequency_metadata = {};
for index = 1 : request.Count
    data_aux = fetch(fred_url, series{index});
    Frequency_metadata{index, 1} = data_aux.Frequency{1};
end
Frequency_metadata = unique(string(Frequency_metadata));

if length(Frequency_metadata)>1
    error('ERROR: Time-series of different frequencies')
else
    disp(strcat('Frequency of data =', string(Frequency_metadata)))
end

%%%%%%%%%%%%%%%%%%%%%%%%%
% Dataset Creation

% First Variable
data_initialize = fetch(fred_url, series{1});
series_initialize = data_initialize.Data{1};
series_initialize.Properties.VariableNames = {'Date', names{1}};
dataset = table2timetable(series_initialize);

% Other Variables
if request.Count > 1
    for index = 2 : request.Count
    data_aux = fetch(fred_url, series{index});
    series_aux = data_aux.Data{1};
    series_aux.Properties.VariableNames = {'Date', names{index}};
    series_aux = table2timetable(series_aux);
    dataset = synchronize(dataset, series_aux);
    end
end

end