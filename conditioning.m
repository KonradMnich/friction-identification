%//////User input/////////%             
time_shift = -0.004; %[s]
cut_off_freq = 30;  %[Hz]
%/////////////////////////%

%% compensation for the timeshift between the sensors
t_NI = t_NI - time_shift;   %[s]


%% reduce data to the sensor with lower sampling
T_NI = t_NI(2) - t_NI(1); %[s]
T_MR = t_MR(2) - t_MR(1); %[s]

if(T_NI > T_MR)
    v = interp1(t_MR, v, t_NI); %[m/s]
    %remove non numeric entries
    i = ~isnan(v);
    v = v(i);                   %[m/s]
    F = F(i);                   %[N]
    t = t_NI(i);                %[s]
else
    F = interp1(t_NI, F, t_MR); %[N]
    %remove non numeric entries
    i = ~isnan(F);
    F = F(i);                   %[N]
    v = v(i);                   %[m/s]
    t = t_MR(i);                %[s]
end

%% filter out the high frequency noise from data
f = 1/(t(2)-t(1));                      %[Hz]
[b, a] = butter(2, cut_off_freq/(f/2));
F = filter(b,a,F);                      %[N]
v = filter(b,a,v);                      %[m/s]

%%
clear t_MR t_NI T_MR T_NI time_shift i f b a cut_off_freq
    

