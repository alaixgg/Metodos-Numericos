function varargout = mtl_reg_sim_nonlinearwithout()
% Se definen los arreglos de entrada X y Y. También se da un valor razonable para (b).
X=[0.5,1,3,5,7,9];
Y=[1.648,2.71,20.08,148.4,1096,8103];
initial_value_b=0.1;
% Fin de los datos de entrada
clc

disp(sprintf('\n\nNOTA: Este código muestra el uso de Octave para presentar'))
disp(sprintf('el procedimiento para hacer la regresión de un conjunto de datos dado un modelo exponencial no lineal'))
disp(sprintf('sin linealización de los datos, es decir de la forma, y=a*exp(b*x)'))
disp(sprintf('\n\n******************************************************* Introduction ****************************************************'))
disp(sprintf('Usando la suma de los residuales cuadrados y minimizando con respecto'))
disp(sprintf('a (a) y (b) obtenemos dos ecuaciones no lineales simultáneas.'))
disp(sprintf('Afortunadamente, las dos ecuaciones no lineales simultáneas pueden ser reducidas a'))
disp(sprintf('una ecuación no lineal en (b). Una vez solucionada, (a) puede ser hallada directamente.'))
disp(sprintf('\nLos arreglos de entrada X y Y son:'))
X
Y

disp(sprintf('\n\n************** Exponencial ************** Exponencial *************** Exponencial *********************'))
disp(sprintf('Datos (x1,y1),(x2,y2),...,(xn,yn), mejor ajuste de y=a*exp(b*x) para los datos.'))

n=length(X);
z=zeros(1,n);

% Hallamos el valor de (b) primero.
b_value=fzero(@(b)(f(b,X,Y,n)),initial_value_b);

% Llamar fzero con una función anónima de un argumento que captura el valor de (a) y llama a myfun con dos argumentos:
% Calculamos el valor de (a)
sum_yex=0;
sum_e2x=0;
for i=1:n
    sum_yex=sum_yex+Y(i)*exp(b_value*X(i));
    sum_e2x=sum_e2x+exp(2*b_value*X(i));
end
a_value=sum_yex/sum_e2x;
% Presentamos los valores de (a) y (b)
a_value
b_value
disp(sprintf('\nEl modelo sin la linealización de datos se describe como\n               y=%5g',a_value))

disp(sprintf('b=%5g',b_value))
disp(sprintf('\b*x)                (4)'))


% Dibujamos la figura de x*exp(b*x) y los puntos de datos.
xp=(0:0.001:max(X));
yp=zeros(1,length(xp));

for i=1:length(xp)
    yp(i)=a_value*exp(b_value*xp(i));
end
plot(xp,yp)
title('Modelo exponencial sin linealización de datos, y vs. x')
xlabel('x')
ylabel('y=a*exp(b*x)')
hold on
plot(X,Y,'bo','MarkerFaceColor','b')
hold off
end

% Usando fzero se halla la raíz de la ecuación
function eqn1 = f(b,X,Y,n)
sum_yxex=0;
sum_yex=0;
sum_ex2=0;
sum_xex2=0;
for i=1:n
    sum_yxex=sum_yxex+Y(i)*X(i)*exp(b*X(i));
    sum_yex=sum_yex+Y(i)*exp(b*X(i));
    sum_xex2=sum_xex2+X(i)*exp(2*b*X(i));
    sum_ex2=sum_ex2+exp(2*b*X(i));
end
eqn1 = sum_yxex-sum_yex/sum_ex2*sum_xex2;

end

