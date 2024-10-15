function p=pf(g,p0,N, tol)
  i=1;
  fprintf('Metodo de punto fijo\n')
  fprintf('   i     p   error\n')
  while i<=N
    p=g(p0);
    fprintf('   %4.0f  %4.5f  %4.6f\n',i,p,abs(p-p0))
    if abs(p-p0)<tol
      fprintf('Se terminaron las iteraciones');
      break
  else
    p0=p;
    i=i+1;
end
end
