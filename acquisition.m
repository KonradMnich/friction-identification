NI = csvread(input_path_NI, 5);
MR = csvread(input_path_MR, 5);

%time
t_NI = NI(:,1);         % [s]
t_MR = MR(:,1)/1000;    % [s]

% force
load_cell_coeff = 200;      % [N/V]
F = NI(:,2);                % [V]
F = F - mean(F(1:10));      % [V]
F = -F * load_cell_coeff;   % [N]

% velocity
rotary2lin = 20/1000/60;    % [(m/s)/(rpm)]
v = -MR(:,2);               % [rpm]
v = v * rotary2lin;         % [m/s]

clear input_path_MR input_path_NI load_cell_coeff NI MR rotary2lin