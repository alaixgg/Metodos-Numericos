%Programa para aplicar la derivacion numerica
% del ejemplo del circuito electrico

t=0:0.1:0.6;
i=[0.,1.97,3.82,5.48,6.89,8.,8.78];
didt=diff(i)./diff(t);
L=0.05;
R=2;
t1=t(1:end-1);
il=i(1:end-1);
El=L*didt+R*il
