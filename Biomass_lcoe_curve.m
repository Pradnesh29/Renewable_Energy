% Biomass types
biomass = {'Wood Chips', 'Rice Husk', 'Bagasse'}';
x = 1:length(biomass);

% LCOE values in USD/kWh
LCOE = [0.125, 0.100, 0.098]';

% Create and display summary table
LCOE_Table = table(biomass, LCOE, 'VariableNames', {'Biomass', 'LCOE_USD_per_kWh'});
disp('LCOE Summary Table for Biomass Fuels:');
disp(LCOE_Table);

% Create finer x-points for smooth curve
xq = linspace(1, 3, 100);  % 100 smooth points between biomass types
LCOE_smooth = spline(1:3, LCOE', xq);  % Cubic spline interpolation

% Plotting
figure('Color', 'w');
plot(xq, LCOE_smooth, 'b-', 'LineWidth', 2);  % Smooth spline curve
hold on;
plot(x, LCOE, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');  % Original data points
text(x, LCOE + 0.001, compose('%.3f', LCOE), 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

xticks(x);
xticklabels(biomass);
ylabel('LCOE (USD/kWh)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Biomass Type', 'FontSize', 12, 'FontWeight', 'bold');
title('Smooth LCOE Curve for Biomass Fuels', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
box on;
