% Biomass types
biomass = {'Wood Chips', 'Rice Husk', 'Bagasse'};

% Theoretical values (as-received) from your first code
HHV_ar = [13.82, 12.39, 12.92];  % MJ/kg
LHV_ar = [12.77, 11.43, 11.83];  % MJ/kg

% Real-world efficiencies (as decimal)
efficiency = [0.28, 0.22, 0.25];

% Real output = HHV_ar * efficiency
Real_output = HHV_ar .* efficiency;

% Combine all data for bar plot
data_matrix = [HHV_ar; LHV_ar; Real_output]';

% Plotting
figure;
bar(data_matrix);
set(gca, 'XTickLabel', biomass, 'FontSize', 12);
xlabel('Biomass Type', 'FontSize', 12);
ylabel('Energy Output (MJ/kg)', 'FontSize', 12);
title('Theoretical vs Real Energy Output (As-Received)', 'FontSize', 14);
legend({'HHV (As-Received)', 'LHV (As-Received)', 'Real Output'}, 'Location', 'northeast');
grid on;
