clear all, close all, clc ;
pkg load control
pkg load  image
pkg load  signal
%Entrainement: creation de features et extraction sur les images de train
[Im5,Im9]=Train();
%Test: pour les features developpe puis  extraction sur les images de test
[test_Im5,test_Im9]=Test();


%Nous parcourons chacunes des images 5 du test et nous evaluons leurs distances
%euclidienne par rapport au 16 images du train recuperer dans Im5 et Im9 et nous
%gardons que les k les plus proche de l'image test: la classe la plus presente
%dans parmis les  k correspond à la prediction.

%Nous prenons k=3, 5,7
k=3;
kk=[3,5,7];
tp=0;fp=0;
for t=1:length(kk)
    disp([" ######## Pediction pour k=",num2str(k),"########"]);
    k=kk(t);
    for i=1:length(test_Im5.f1)

     Feature_test=[test_Im5.f1(i),test_Im5.f2(i),test_Im5.f3(i)];

     %Resultats des predictions des 5
     Prediction5(i)=KNN(k,Im5,Im9,Feature_test);
    endfor

    %Predictions des 9
    for i=1:length(test_Im9.f1)
      Feature_test=[test_Im9.f1(i),test_Im9.f2(i),test_Im9.f3(i)];

      %Resultats des predictions des 9
      Prediction9(i)=KNN(k,Im5,Im9,Feature_test);
    endfor

    Prediction5

    Prediction9
    %Calcul des true positif/False positive
    tp=tp+sum(Prediction5==5);
    tp=tp+sum(Prediction9==9);

    fp=fp+sum(Prediction5!=5);
    fp=fp+sum(Prediction9!=9);
    TP(t)=tp/(length(Prediction5)+length(Prediction9));
    FP(t)=fp/(length(Prediction5)+length(Prediction9));
endfor
figure, plot(FP,TP),xlabel("False positive"),ylabel("True positive"),title("Courbe en ROC")
