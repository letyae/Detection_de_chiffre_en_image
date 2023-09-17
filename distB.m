#Distance de battchattarya
function B=distB(p,q)
  B=0;
  for i=1:length(q)
    B=B+sqrt(p(i)*q(i));
  endfor
endfunction
