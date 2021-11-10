%% Depreciation Schedules Toolbox
% Example


%%%%%%%%%%%%%%%%%%%%%
% Simulating Tax Depreciation Schedules

% Generate a 10-year straight-line depreciation schedule
schedule_sl = SL_depreciation(10);

% Generate a 20%-rate declining-balance depreciation schedule
schedule_db = DB_depreciation(0.20);

% Generate a straight-line depreciation schedule with a 20% rate for 3 years, followed by
% another straight-line with a 10% rate for 4 years
schedule_sl2 = SL2_depreciation(0.2, 0.1, 3, 4);



%%%%%%%%%%%%%%%%%%%%%
% Measuring Tax Depreciation Schedules

% Compute the half-life of a depreciation schedule
hl_schedule_sl = HL_depreciation(schedule_sl);

% Compute the PDV of a depreciation schedule using a 90% discount factor
pdv_schedule_sl = PDV_depreciation(schedule_sl, 0.90);




%%%%%%%%%%%%%%%%%%%%%
% Approximating Tax Depreciation Schedules

% Approximate the double straight-line schedule using both the half-life and the
% pdv approach
schedule_sl2_approx_hl = Approximating_depreciation_HL(schedule_sl2);
schedule_sl2_approx_pdv = Approximating_depreciation_PDV(schedule_sl2, 0.90);



figure
set(gcf, 'Color', 'w');
hold on
bar(100 * schedule_sl2)
plot(100 * schedule_sl2_approx_hl, 'o', 'MarkerFaceColor', [0.8500, 0.3250, 0.0980])
plot(100 * schedule_sl2_approx_pdv, 'o',  'MarkerFaceColor', [0.9290, 0.6940, 0.1250])
hold off
xlim([0, 10]);
xlabel('Years since Investment');
ylabel('Deduction Rate');
legend('Original Schedule', 'Approximation with Half-Life', 'Approximation with PDV');
ytickformat('percentage');


















