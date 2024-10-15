%Programa para resolvder un sistemas de ecuaciones lineales
%Usando la regla de Cramer
function x=cramer(A,b)
n=length(b);
x=zeros(n,1);
for k=1:n
Ak=A;
Ak(:,k)=b;
x(k)=det(Ak)/det(A);
end
