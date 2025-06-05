% === 1. Input Data ===
biomass = {'Wood Chips', 'Rice Husk', 'Bagasse'};

% Theoretical Net Energy (LHV as-received) in MJ/kg
LHV_ar = [13.34, 11.36, 12.04];

% Actual energy output based on real-world efficiency (MJ/kg)
Real_output = [4.03, 2.90, 3.29];

% Total energy loss
Total_loss = LHV_ar - Real_output;

% Loss breakdown percentages
moisture_pct = 0.50;
carbon_pct = 0.25;
fluegas_pct = 0.25;

% Losses in MJ/kg
Moisture_loss = Total_loss * moisture_pct;
Carbon_loss = Total_loss * carbon_pct;
Fluegas_loss = Total_loss * fluegas_pct;

% === 2. Combine all into a matrix: each row = [Real, Moisture, Carbon, Flue Gas]
energy_components = [Real_output', Moisture_loss', Carbon_loss', Fluegas_loss'];

% === 3. Create grouped bar plot ===
figure('Color','w','Position',[100 100 900 500]); % Wider figure to fit legend
bar(energy_components, 'grouped');
set(gca, 'XTickLabel', biomass, 'FontSize', 12);

ylabel('Energy (MJ/kg)', 'FontSize', 13, 'FontWeight', 'bold');
xlabel('Biomass Type', 'FontSize', 13, 'FontWeight', 'bold');
title('Energy Yield and Loss Breakdown by Biomass Type', 'FontSize', 14, 'FontWeight', 'bold');

legend({'Actual Output', 'Moisture Loss', 'Unburned Carbon Loss', 'Flue Gas Loss'}, ...
    'Location', 'southoutside', 'Orientation', 'horizontal');

grid on;
ylim([0, max(LHV_ar)*1.1]);
box on;

% === 4. Display data as table ===
T = table(biomass', Real_output', Moisture_loss', Carbon_loss', Fluegas_loss', ...
    'VariableNames', {'Biomass', 'ActualOutput_MJkg', 'MoistureLoss_MJkg', 'CarbonLoss_MJkg', 'FlueGasLoss_MJkg'});
disp(T);
