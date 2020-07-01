function F = friction_model(c, v)

dry = c(1);
viscous = c(2) * v;
F_max = c(3);
v_strib = c(4);
strib = v*(F_max - dry) * exp(1)/v_strib .* exp(-v/v_strib);

F = viscous + dry + strib;

end