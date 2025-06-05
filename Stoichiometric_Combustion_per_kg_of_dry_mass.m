% Biomass names
biomass = {'Wood Chips', 'Rice Husk', 'Bagasse'};

% Elemental composition (%) - on dry basis
% Columns: [C, H, O, N, S]
data = [49.0, 6.0, 44.0, 0.10, 0.01;
        39.0, 5.0, 35.0, 0.40, 0.10;
        45.0, 6.0, 45.0, 0.30, 0.05];

% Preallocate
O2_required = zeros(1, 3);
Air_required = zeros(1, 3);

fprintf('Stoichiometric Combustion Analysis (Per kg of Dry Biomass)\n');
fprintf('----------------------------------------------------------\n');
fprintf('%-12s | O2 Required (kg) | Air Required (kg)\n', 'Biomass');

for i = 1:3
    C = data(i,1);
    H = data(i,2);
    O = data(i,3);
    S = data(i,5);
    
    % Convert % to mass fraction
    C_frac = C / 100;
    H_frac = H / 100;
    O_frac = O / 100;
    S_frac = S / 100;
    
    % Oxygen required per kg fuel (from stoichiometry)
    O2 = 32 * (C_frac / 12 + H_frac / 4 - O_frac / 32 + S_frac / 32);
    
    % Theoretical air required per kg fuel
    Air = O2 / 0.23;

    O2_required(i) = O2;
    Air_required(i) = Air;

    fprintf('%-12s | %16.3f | %17.3f\n', biomass{i}, O2, Air);
end
