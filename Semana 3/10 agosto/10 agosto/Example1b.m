%Programa para aplicar la derivacion numerica
% del ejemplo de la retina

t = [0.1, 0.15];
v = [0.011928, 0.017839];
dvdt = diff(v) ./ diff(t);
t1 = t(1:end-1);
v1 = v(1:end-1);
al = dvdt

