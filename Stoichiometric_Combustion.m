% Biomass types and their ultimate analysis (dry basis)
biomass = {'Wood Chips', 'Rice Husk', 'Bagasse'};

% Elemental composition: [C, H, O, N, S, Moisture] in %
data = [49, 6, 44, 0.1, 0.01, 20;
        39, 5, 35, 0.4, 0.1, 12;
        45, 6, 45, 0.3, 0.05, 18];

HHV_dry = zeros(1,3);
LHV_dry = zeros(1,3);
HHV_ar = zeros(1,3);
LHV_ar = zeros(1,3);

fprintf('Stoichiometric Energy Estimation (As-Received)\n');
fprintf('--------------------------------------------------\n');
fprintf('%-12s | HHV_dry | LHV_dry | HHV_ar | LHV_ar\n', 'Biomass');

for i = 1:length(biomass)
    C = data(i,1);
    H = data(i,2);
    O = data(i,3);
    S = data(i,5);
    Moisture = data(i,6);

    % HHV (dry)
    HHV = 0.338*C + 1.428*(H - O/8) + 0.095*S;
    
    % LHV (dry)
    LHV = HHV - 2.443 * 9 * (H/100);

    % Moisture adjustment
    HHV_m = HHV * (1 - Moisture/100);
    LHV_m = LHV * (1 - Moisture/100);

    HHV_dry(i) = HHV;
    LHV_dry(i) = LHV;
    HHV_ar(i) = HHV_m;
    LHV_ar(i) = LHV_m;

    fprintf('%-12s | %7.2f | %7.2f | %7.2f | %7.2f\n', biomass{i}, HHV, LHV, HHV_m, LHV_m);
end

% Plotting line graph
x = 1:3;

figure;
plot(x, HHV_dry, '-o', 'LineWidth', 2);
hold on;
plot(x, LHV_dry, '-s', 'LineWidth', 2);
plot(x, HHV_ar, '--o', 'LineWidth', 2);
plot(x, LHV_ar, '--s', 'LineWidth', 2);
hold off;

xticks(x);
xticklabels(biomass);
xlabel('Biomass Type', 'FontSize', 12);
ylabel('Energy Value (MJ/kg)', 'FontSize', 12);
title('HHV and LHV Comparison (Dry vs As-Received)', 'FontSize', 14);
legend({'HHV Dry', 'LHV Dry', 'HHV As-Received', 'LHV As-Received'}, 'Location', 'northeast');
grid on;
