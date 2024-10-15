clc

n=3;

A=[12,3,-5;1,5,3;3,7,13];

b=[1;28;76];

x=[1;0;1];

maxit=6;

abs_ea=zeros(n);

for k=1:maxit
  Xold=x;
  for i=1:n

    summ=0;
    for j=1:n

      if(i<j)

        summ=summ+A(i,j)*x(j);
      end
      if (i>j)

        summ=summ+A(i,j)*x(j);
      end
    end
    x(i)=(b(i)-summ)/A(i,i);
  end

    Max_abs_ea=0.0;

    for i=1:n


     abs_ea(i)=abs((x(i)-Xold(i))/x(i))*100.0;

     if abs_ea(i)>Max_abs_ea
       Max_abs_ea=abs_ea(i);

     end
end

    x;
    y=rot90(abs_ea);
    abs_e=y(n,1:n);
    Max_abs_ea;
    end

    x
    abs_e
    Max_abs_ea
