#sistema triangulares
function [x,error,it]=gausssseidel(A,b,x0,tol,itmax)

  [n,n]=size(A);

  it=0;
  error=1000.0;
  D=diag(diag(A));
  E=-tril(A,-1);
  F=-triu(A,+1);
  res = norm(A*x0 - b)

  error = res/norm(b);

  while((it<itmax) && (error>tol))
  it=it+1;
  x=(D-E)\(F*x0+b);

  res= norm(A*x - b);
  error = res/norm(b);
  x0=x;
  end
