function [test_Im5,test_Im9]=Test()
#Nous allons tester nos features sur de nouvelles images
#test9: repertoire contenant les images des 9 pour le test

disp("#############Phase de Test#############");


filelist9 = dir(['test9','/*','jpg']);

rect1=[813,531,55,80];
rect2=[460,509,185,104];

%%Extraction des ordres 0 et 1, enregistrer dans les repertoires 9Ordre0_test et 9Ordre1_test

for i=1:length(filelist9)
  str=strcat("test9/",filelist9(i).name);
  a=imread(str);
  O1= imcrop (a, rect1);
  str1=strcat("9Ordre0_test/",filelist9(i).name);
  O2= imcrop(a, rect2);
  str2=strcat("9Ordre1_test/",filelist9(i).name);
  imwrite(O1,str1);
  imwrite(O2,str2);
endfor


rect1=[812, 532, 49, 67];
rect2=[949, 517, 163, 95];

#test5: repertoire contenant les images des 5 pour le test
filelist5 = dir(['test5','/*','jpg']);

%%Extraction des ordres 0 et 1, enregistrer dans les repertoires 5Ordre0_test et 5Ordre1_test

for i=1:length(filelist5)
  str=strcat("test5/",filelist5(i).name);
  a=imread(str);
  O1= imcrop (a, rect1);
  str1=strcat("5Ordre0_test/",filelist5(i).name);
  O2= imcrop(a, rect2);
  str2=strcat("5Ordre1_test/",filelist5(i).name);
  imwrite(O1,str1);
  imwrite(O2,str2);
 endfor

%%Extraction de features ds l'espace spectral
#Nous avons choisis l'ordre 1 de gauche que nous regroupons les lignes en une seules

%% 5Ordre1_test repertoire contenant les ordres 1

filelist5=dir(['5Ordre1_test','/*','jpg']);

%%%Spectre image 5
for i=1:length(filelist5)
   str=strcat("5Ordre1_test/",filelist5(i).name);
   a=imread(str);
   Max5(1,i)=max(sum(a));
   Var5(1,i)=var(sum(a));
   Mean5(1,i)=mean(sum(a));
   Ecart5(1,i)=std(sum(a));
   Min5(1,i)=min(sum(a));
endfor


%% Extraction de features ds l'espace spectral
%% 9Ordre1_test repertoire contenant les ordres 1

filelist9 = dir(['9Ordre1_test','/*','jpg']);

%% Spectre image 9
for i=1:length(filelist9)
   str=strcat("9Ordre1_test/",filelist9(i).name);
   a=imread(str);
   Max9(1,i)=max(sum(a));
   Var9(1,i)=var(sum(a));
   Mean9(1,i)=mean(sum(a));
   Ecart9(1,i)=std(sum(a));
   Min9(1,i)=min(sum(a));
endfor

#Normalisation des features
Max5=rescale(Max5);
Min5=rescale(Min5);

Max9=rescale(Max9);
Min9=rescale(Min9);


%figure,plot(Max5,'k')
%hold on
%plot(Max9 ,'b'), title("distibution des Maximum");
#distance de battchatarya des max

%Max_dist_B=distB(Max5,Max9)

Var5=rescale(Var5);
Var9=rescale(Var9);

%figure,plot(Var5,'k')
%hold on
%plot(Var9,'b' ), title("distibution des variances");

#distance de battchatarya des var
%Var_dist_B=distB(Var5,Var9);


Mean5=rescale(Mean5);
Mean9=rescale(Mean9);


%figure,plot(Mean5,'k')
%hold on
%plot(Mean9,'b' ), title("distibution des Moy");


#distance de battchatarya des moy
%Mean_dist_B=distB(Mean5,Mean9);




Ecart5=rescale(Ecart5);
Ecart9=rescale(Ecart9);


%figure,plot(Ecart5,'k')
%hold on
%plot(Ecart9,'b' ), title("distibution des std");
#distance de battchatarya des max
%Ecart_dist_B=distB(Ecart5,Ecart9)



%% Extraction des features ds l'espace spatial

%%% Etude spatial image 5

%% 5Ordre0_test repertoire des 5 contenant les ordres 0

filelist5 = dir(['5Ordre0_test','/*','jpg']);


for i=1:length(filelist5)
   str=strcat("5Ordre0_test/",filelist5(i).name);
   a=imread(str);

   %kurtosis
   Kur_sp5(1,i)= kurtosis(a(:));

   %Moment
   Mom_sp5(1,i)=moment(a(:),1,'all');

   %Variance
   Var_sp5(1,i)=var(a(:));

   %Entropie
   Entropi5(1,i)=entropy(a);

   #Variance sur la somme des lignes
   Var_l5(1,i)=var(sum(a));

   #Variance sur la somme colone
   Var_c5(1,i)=var(sum(a,2));

   #Variance sur la moyenne des colones
   Var_ml5(1,i)=var(mean(a));

   #Variance sur la moyenne colone
   Var_mc5(1,i)=var(mean(a,2));

endfor



%%% Etude spatial image 9

%% 9Ordre0_test repertoire des 9 contenant les ordres 0

filelist9= dir(['9Ordre0_test','/*','jpg']);

for i=1:length(filelist9)
   str=strcat("9Ordre0_test/",filelist9(i).name);
   a=imread(str);

   %kurtosis
   Kur_sp9(1,i)= kurtosis(a(:));

   %Moment
   Mom_sp9(1,i)=moment(a(:),1,'all');

   %Variance
   Var_sp9(1,i)=var(a(:));

   #Entropie
   Entropi9(1,i)=entropy(a);

   #Variance sur la somme des lignes
   Var_l9(1,i)=var(sum(a));

   #Variance sur la somme colones
   Var_c9(1,i)=var(sum(a,2));

    #Variance sur la moy des colones
   Var_ml9(1,i)=var(mean(a));

   #Variance sur la moy colone
   Var_mc9(1,i)=var(mean(a,2));
endfor

%Normalisation

Mom_sp5=rescale(Mom_sp5);
Var_sp5=rescale(Var_sp5);
Kur_sp5=rescale(Kur_sp5);


Entropi5=rescale(Entropi5);
Var_l5=rescale(Var_l5);
Var_c5=rescale(Var_c5);

Var_ml5=rescale(Var_ml5);
Var_mc5=rescale(Var_mc5);

Kur_sp9= rescale(Kur_sp9);
Mom_sp9=rescale(Mom_sp9);
Var_sp9=rescale(Var_sp9);
Entropi9=rescale(Entropi9);
Var_l9=rescale(Var_l9);
Var_c9=rescale(Var_c9);

Var_ml9=rescale(Var_ml9);
Var_mc9=rescale(Var_mc9);



###### Nous représentons nos images de test sous les features acceptable #########

#1
figure, plot3(Var_c9,Var_sp9,Var_l9,'*b');
hold on
plot3(Var_c5,Var_sp5,Var_l5,'*r'),title('Nuage de point des données  pour le test ')
xlabel("Variance colone"),ylabel("Variance"),zlabel("Variance ligne")
h=legend("9","5");
legend(h)

#2
 figure, plot3(Var_mc9,Var_sp9,Var_l9,'*b');
 hold on
 plot3(Var_mc5,Var_sp5,Var_l5,'*r') ,title('Nuage de point des données  pour le test ')
xlabel("Variance moyenne colone"),ylabel("Variance"),zlabel("Variance ligne")
h=legend("9","5");
legend(h)


#3
 figure, plot3(Var_mc9,Var_sp9,Mom_sp9,'*b');
 hold on
 plot3(Var_mc5,Var_sp5,Mom_sp5,'*r'),title('Nuage de point des données  pour le test ')
 xlabel("Variance moyenne colone"),ylabel("Variance"),zlabel("moment")
 h=legend("9","5");
 legend(h)

#4
figure, plot3(Var_l9,Var_c9,Var9,'*b');
hold on
plot3(Var_l5,Var_c5,Var5,'*r'),title('Nuage de point des données  pour le test ')
xlabel("Variance ligne"),ylabel("Variance colone"),zlabel("Variance spectrale")
h=legend("9","5");
legend(h)


##### Les features retenues: les 2 premiers sont spatial le 3eme est spectral
#5
figure, plot3(Var_c9,Var_sp9,Var9,'*b');
hold on
plot3(Var_c5,Var_sp5,Var5,'*r'),title('Nuage de point des données  pour le test ')
xlabel("Variance colone"),ylabel("Variance spatial"),zlabel("Variance spectrale")
h=legend("9","5");
legend(h)


#Nous regroupons les 3 features de chacunes des 8 images de test des 5 dans une structure
test_Im5.f1=Var_c5;
test_Im5.f2=Var_sp5;
test_Im5.f3=Var5;

#Nous regroupons les 3 features de chacunes des 8 images de test des 9 dans une structure
test_Im9.f1=Var_c9;
test_Im9.f2=Var_sp9;
test_Im9.f3=Var9;

endfunction
