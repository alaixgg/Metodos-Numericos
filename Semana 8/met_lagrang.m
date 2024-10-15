function p = metodoLagrange
    clear;
    clc;
    x = input('Introduzca los valores de x: '); % [1 4 6]
    y = input('Introduzca los valores de y: '); % [0 1.386294 1.791760]
    a = input('Introduzca un punto a evaluar: '); % 2
    n = length(x);
    syms t; % cargar el paquete pkg load symbolic
    p=0;
    plot(x, y, '*')
    grid on;
    for i= 1:n
       L= 1;
       for j=1:n
         if i~= j
           L=L*(t-x(j))/(x(i)-x(j));
         endif
       endfor
       p=p+L*y(i);
    endfor
p = expand(p)
hold on;
ezplot(p, [0, 10])
t = a;
p = eval(p)
