#K plu proche voisin K-NN
%function B=KNN(k,Im5,Im9,Im_test)
function Prediction=KNN(k,Im5,Im9,Im_testF)

    for i=1:length(Im5.f3)
         p=[Im5.f1(i),Im5.f2(i),Im5.f3(i)];
         dist(1,i)=dist_Eucl(Im_testF,p);
    endfor

    for j=1:length(Im9)
        p=[Im9.f1(i),Im9.f2(i),Im9.f3(i)];
        dist(1,i+j)=dist_Eucl(Im_testF,p);
    endfor

    dist_temoin=dist;

    %Nous ordonnons les distances du plus petit au plus grd
    dist=sort(dist);
    count5=0;
    count9=0;

    %Nous cherchons la classe ds laquelle appartient  les distances
    %les plus represente parmi les k plus proches voisins.

    %Nous comptons parmis les k distances les k plus proches ceux calculer avec des 5 et
    %ceux calculer avec des  9
    for i=1:k
      for j=1:length(dist_temoin)
          if (dist(i)==dist_temoin(j))
            if (j<=length(dist_temoin)/2)
                  count5+=1;
             elseif ( j>length(dist_temoin)/2)
                  count9+=1;
            endif
          endif
      endfor
    endfor

    %Pour classer l'image tester nous prenons les distances les
    % plus representer parmi les k distances
    if(count5>count9)
     %prediction des 5
      Prediction=5;
    elseif(count5<count9)
    %prediction des 9
      Prediction=9;
    elseif(count5==count9)
      %Pas de prediction
      Prediction=0;
    endif

endfunction
