#Distance de Euclidienne
function D=dist_Eucl(p,q)
  D=0;
  for i=1:length(q)
    D=D+(p(i)-q(i))^2;
  endfor
  D=sqrt(D);
endfunction
