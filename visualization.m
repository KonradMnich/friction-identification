%%  Measured force decomposed into frictional and inertial components
hold on
plot(t, F)
plot(t, F_fric)
plot(t, F - F_fric)
xlim([0.03 0.53])
xlabel("t [s]")
ylabel("F [N]")
title("Force decomposition")
legend( "total force",...
        "friction force",...
        "innertial force",...
        "location", "northeast")
box on
x0=10;
y0=10;
width=15;
height=7;
set(gcf,'units','centimeters',...
        'position',[x0,y0,width,height])

saveas(gcf,'output/force_decomposed.fig')
saveas(gcf,'output/force_decomposed.png')
close

%% Model vs measurement
hold on
plot(v(range), F_fric(range))
plot(v(range), F_model)
xlim([0 0.55])
xlabel("v [m/s]")
ylabel("F [N]")
title("Model vs measurement")
legend( "measured force",...
        "model",...
        "location", "southeast")
box on
x0=10;
y0=10;
width=15;
height=7;
set(gcf,'units','centimeters',...
        'position',[x0,y0,width,height])

saveas(gcf,'output/model_vs_measurement.fig')
saveas(gcf,'output/model_vs_measurement.png')
close

%% Share of friction in the total force
a_temp = linspace (0, 5, 100)';
v_temp = linspace (0, 0.83, 100)';
[a2D, v2D] = meshgrid (a_temp, v_temp);

F2D_total = a2D * reduced_mass + friction_model(p, v2D);
F2D_friction = friction_model(p, v2D);

imagesc(a_temp, v_temp, F2D_friction ./ F2D_total)
xlabel ("a [m/s^2]");
ylabel ("v [m/s]");
zlabel ("% F");
ylim ([0 0.83]);
title ("Share of friction in total force");
set(gca,'YDir','normal')
colorbar

saveas(gcf,'output/share_of_friction.fig')
saveas(gcf,'output/share_of_frition.png')
close

clear F2D_friction F2D_total a2D v2D a_temp v_temp

%% Components of friction
v_temp = linspace(0, 0.83, 1000)';
F_dry = p(1) * ones(length(v_temp),1);
F_vis = p(2) * v_temp;
F_str = v_temp *(p(3) - F_dry(1)) * exp(1)/p(4) .* exp(-v_temp / p(4));
F_sum = F_dry + F_vis + F_str;
area(v_temp, [F_dry F_vis F_str] ./ F_sum * 100)

xlabel ("v [m/s]");
ylabel ("%F_{fric} [N]");
xlim([0 max(v_temp)])
ylim([0 100])
title("Friction components")
legend( "Dry friction",...
        "Viscous friction",...
        "Striback friction",...
        "location", "northeast")
box on

x0=10;
y0=10;
width=15;
height=7;
set(gcf,'units','centimeters','position',[x0,y0,width,height])

saveas(gcf,'output/friction_components.fig')
saveas(gcf,'output/friction_components.png')
close

clear v_temp F_dry F_sum F_str

%% measurement summary

subplot(4,1,1)
plot(t, x)
title("Full measurement summary")
ylabel("x [m]")
xlim([0 max(t)])
ylim([0 1.1*max(x)])

subplot(4,1,2)
plot(t, v)
ylabel("v [m/s]")
xlim([0 max(t)])
ylim([0 1.1*max(v)])

subplot(4,1,3)
plot(t, a)
ylabel("a [m/s^2]")
xlim([0 max(t)])
ylim([1.1*min(a) 1.1*max(a)])

subplot(4,1,4)
plot(t, F)
xlabel("t [s]")
xlim([0 max(t)])
ylabel("F [N]")
ylim([1.1*min(F) 1.1*max(F)])

x0=10;
y0=10;
width=15;
height=15;
set(gcf,'units','centimeters','position',[x0,y0,width,height])

saveas(gcf,'output/summary.fig')
saveas(gcf,'output/summary.png')
close

%%
clear y0 x0 width height