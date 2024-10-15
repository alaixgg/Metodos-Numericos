clc

% Ingresar los datos de los arreglos x e y y el valor de x para cual se desea y.

% Datos del arreglo de x.
x=[0 10 15 20 22.5 30];

% Datos del arreglo de y.
y=[0 227.04 362.78 517.35 602.96 901.67];

% Valor de x para el cual se desea y.
xdesired = 16;

disp(sprintf('\n\n*Datos de Entrada*'))
fprintf('\n');
disp('Arreglo de x:')
x
disp('Arreglo de y:')
y
disp(sprintf('Valor de x para el cual se desea y, xdesired = %g',xdesired))

disp(sprintf('\n*Simulación*'))

% A continuación se consideran los datos de x y y y se seleccionan los dos puntos más
%cercanos a xdesired.

n = numel(x);
comp = abs(x-xdesired);
c=min(comp);

for i=1:n
    if comp(i) == c;
        ci=i;
    end
end

% La siguiente secuencia determina si el valor examinado en el arreglo de x
% es mayor o menor que el valor "xdesired". Una vez que esto se determina,
% las líneas siguientes hallan los puntos necesarios alrededor de la variable "xdesired".

if x(ci) < xdesired
    q=1;

    for i=1:n
        if x(i) > xdesired
            ne(q)=x(i);
            q=q+1;
        end
    end
    b=min(ne);

    for i=1:n
        if x(i)==b
            bi=i;
        end
    end
end

if x(ci) > xdesired
    q=1;

    for i=1:n
        if x(i) < xdesired
            ne(q)=x(i);
            q=q+1;
        end
    end
    b=max(ne);

    for i=1:n
        if x(i)==b
            bi=i;
        end
    end
end

% Si se necesitan mas de dos valores, la siguiente parte del codigo selecciona los valores
% subsecuentes y los pone dentro de una matriz, preservando el orden original de los datos.

for i = 1:n
    A(i,2)=i;
    A(i,1)=comp(i);
end

A=sortrows(A,1);
for i=1:n
    A(i,3)=i;
end

A=sortrows(A,2);
d=A(1:n,3);
if d(bi)~=2
    temp=d(bi);
    d(bi)=1;
    for i=1:n
        if i ~= bi && i ~= ci && d(i) <= temp
            d(i)=d(i)+1;
        end
        d(ci)=1;
    end
end



% ***** INTERPOLACIÓN CUADRÁTICA *****

% Elegimos 3 puntos de datos
datapoints = 3;
p = 1;
for i = 1:n
    if d(i) <= datapoints
        xdata(p) = x(i);
        ydata(p) = y(i);
        p = p + 1;
    end
end


% Configuramos las ecuaciones para hallar los coeficientes del interpolante cuadrático
M = [1 xdata(1) xdata(1)^2;
     1 xdata(2) xdata(2)^2;
     1 xdata(3) xdata(3)^2];

Y = [ydata(1);
     ydata(2);
     ydata(3)];

% Determinamos los coeficientes del interpolante cuadrático
A = inv(M) *Y;
z = sym('z');
a0 = sym('a0');
a1 = sym('a1');
a2 = sym('a2');
fq = a0 + a1*z + a2*z^2;
fq = subs(fq, a0, A(1));
fq = subs(fq, a1, A(2));
fq = subs(fq, a2, A(3));
fxdesired = subs(fq, z, xdesired);
fprev = ydata(1);  % O cualquier valor cercano, por ejemplo
fnew= fxdesired;
ea = abs((fnew - fprev) / fnew) * 100;

if ea >= 5
    sd = 0;
else
    sd = floor(2 - log10(abs(ea) / 0.5));
end

% Presentamos los resultados de la interpolación cuadrática.
disp(sprintf('\nINTERPOLACIÓN CUADRÁTICA:'))
% Mostrar los datos elegidos para x
disp(sprintf('\nDatos elegidos para x: x1 = %g, x2 = %g, x3 = %g', xdata(1), xdata(2), xdata(3)))

% Mostrar los datos elegidos para y
disp(sprintf('\nDatos elegidos para y: y1 = %g, y2 = %g, y3 = %g', ydata(1), ydata(2), ydata(3)))

% Mostrar los coeficientes de la interpolación cuadrática
disp(sprintf('\nCoeficientes de la interpolación cuadrática: a0 = %g, a1 = %g, a2 = %g', A(1), A(2), A(3)))

% Reemplazar los coeficientes en la ecuación cuadrática para obtener el valor de y
% Ejemplo: Velocidad para t=16 segundos
y = A(1) + A(2) *xdesired + A(3)*(xdesired^2)
