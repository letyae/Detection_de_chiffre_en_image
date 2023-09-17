##Normalisation
function D=Normalise(P)
mindata = min(min(P));
maxdata = max(max(P));
normalised = ((P-mindata)/((maxdata)-mindata));
display(normalised);
endfunction
