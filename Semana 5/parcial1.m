fprintf('Ejemplo de Método de Newton - Raphson\n');

fun = '-0.67665*10^(-8)*x^4-0.26689*10^(-5)*x^3+0.12748*10^(-3)*x^2-0.018507';
fun = inline(fun);

der='-2.7066*10^(-8)*x^3-8.0067*10^(-6)*x^2+0.00025496*x';
der=inline(der);

xi=10

error=0.0001

i=1;

function ea = errora(xa,xp)
ea =abs(((xa-xp)/xa)*100);
end
if (der(xi)==0)
fprintf('No es posible hallar la raiz porque su derivada es cero');
else

xn=xi-(fun(xi)/der(xi));

fprintf('___________________________________________________\n');
fprintf("%s\t %s\t\t %s\n*,'ITERACÍON','XN','ERROR ABSOLUTO   ");
fprintf('___________________________________________________\n');
while(errora(xn,xi)>error)

fprintf('%.0f\t\t',i);
fprintf('%.5f\t\t',xn);
fprintf('%.5f\t\t',errora(xn,xi));
fprintf("\n");

xi=xn;
xn=xi-(fun(xi)/der(xi));
i++;
end

fprintf('%.0f\t\t',i);
fprintf('%.5f\t\t',xn);
fprintf('%.5f\t\t',errora(xn,xi));
fprintf("\n");

fprintf("___________________________________________________\n");
fprintf("\n SOLUCIÓN - LA RAÍZ ES:  %.5f\n",xn);
end

x=-0.02:0.01:0.12;
fun= x.^3-0.165*x.^2+0.0003993;
plot(x,fun,'r:d')
grid on
