%--->User input:
reduced_mass = 24.7; %[kg]

%acceleration
a = diff(v)./diff(t);
a = [0; a];
% distance
x = cumtrapz(t, v);

% friction force
F_fric = F - a*reduced_mass;