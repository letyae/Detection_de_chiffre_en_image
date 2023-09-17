# Détection_de_chiffres_en_image

L'objectif de ce TP est de réaliser une classification d'images à l'aide de l'apprentissage automatique. Nous disposons d'un ensemble d'images représentant les chiffres 5 ou 9, éclairés alternativement par une LED ou une source thermique. Ces scènes sont capturées à l'aide d'un spectro-imageur qui enregistre une image des chiffres à l'ordre 0 et le spectre diffracté de ces chiffres dans les ordres 1. Nous aborderons ce TP en trois étapes.

Dans cette première étape, nous avons automatiquement segmenté l'ordre 0 et les ordres 1 de diffraction dans l'ensemble de ces images. Pour ce faire, nous avons utilisé ImageJ pour déterminer les rectangles englobant les différents ordres. À partir de ces rectangles, nous avons extrait les images correspondantes.

La deuxième étape consiste à développer des descripteurs (features) nous permettant de distinguer la différence entre les chiffres 5 et 9. L'ordre 0 fournit des informations spatiales, tandis que l'ordre 1 fournit des informations spectrales. Pour les features spectrales, nous avons utilisé des grandeurs statistiques telles que la variance, le maximum, le minimum, l'écart-type et la moyenne, qui permettent de caractériser l'écriture des chiffres 5 et 9. En ce qui concerne les features spatiales, nous avons également utilisé des grandeurs statistiques telles que l'entropie, la variance sur la somme des lignes et des colonnes, la variance sur la moyenne des lignes et des colonnes, le moment et le kurtosis.

Après avoir analysé les représentations des nuages de points avec les images d'entraînement dans l'espace des features, nous avons choisi d'utiliser deux features spatiales : la variance des colonnes et la variance globale de l'image, ainsi qu'une feature spectrale : la variance du spectre. Ces features ont permis une séparation presque optimale des classes des chiffres 5 et 9. Nous avons ensuite appliqué ces features à l'ensemble des images de test.

Etape 3 : Application de l'algorithme KNN (k plus proches voisins).
Après représentation des images par leur features dans des espaces 3D, nous avons calculé les k plus proches voisins par rapport aux nuages de points d'entraînement. La classe la plus fréquemment représentée parmi ces k voisins est celle qui a été prédite.
