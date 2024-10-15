%Programa para aplicar la derivacion numerica
% del ejemplo de la retina

t = [0.05, 0.1];
v = [0.0059820, 0.011928];
dvdt = diff(v) ./ diff(t);
t1 = t(1:end-1);
v1 = v(1:end-1);
al = dvdt

