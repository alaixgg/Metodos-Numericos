%Programa para aplicar la derivacion numerica
% del ejemplo de la velocicdad del cohete

t=16:2:18;
v=[392.07,453.02];
dvdt=diff(v)./diff(t);
t1=t(1:end-1);
v1=v(1:end-1);
al=dvdt
