A=[12,3,-5;1,5,3;3,7,13];
b=[1;28;76];
x0=[1;0;1];
tol=0.00101;
itmax=100;
disp('Gauss-Seidel')
[x,error,it]=gaussseidel(A,b,x0,tol,itmax)
