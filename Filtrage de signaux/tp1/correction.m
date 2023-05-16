function x_cor = correction(x_test,n0)
%CORRECTION Summary of this function goes here
%   Detailed explanation goes here
    P=10;
[a,sw2] = aryule(x_test,P);
aflip = fliplr(a);
m=15;

lig = zeros(1,m+P);
col = zeros(1,m+2*P);
for i=1:length(a)
    col(i) = aflip(i);
    % on associe les 11 valeurs du vecteurs des coéfficients au 11 premières valeurs des deux vecteurs
    lig(i) = aflip(i);
end
x_cor = x_test;% on récupère toutes les valeurs du signal original

T = toeplitz(lig,col);

A0 = T(:,1:length(a)-1); 
B = T(:,length(a):length(a)+m-1);% on délimite chaque sous-matrices de la matrice T issue du toeplitz
A1 = T(:,length(a)+m:length(T));

if isempty(n0)% on vérifie que le vecteurs n0 qui contient les positions des craquements n'est pas vide
else
    for i_n0=1:length(n0)% on parcours la listes des échantillons qui sont des craquements 
        ko = n0(i_n0)-(m-1)/2:n0(i_n0)+(m-1)/2+P;
        % on calcule toutes les valeurs de k0 pour l'échantillon correspondant au craquement
        for ik0 = 1:length(ko)% on parcours toutes les valeurs du k0 associées au craquement
            x0= x_test(ko(ik0)-P:ko(ik0)-1);
            x1= x_test(ko(ik0)+m:ko(ik0)+m+P-1);
            %calcul des deux parties x0 et x1 qui sont des morceaux connus du vecteur x
            y_barre = -pinv(B)*(A0*x0 +A1*x1);
            % on calcul l'estimateur de y via les moindres carrées
            for vari = 1:length(y_barre)
                % pour chaque valeurs provenant du vecteur y issue de
                % l'estimateur, on remplace la valeurs du signal corrigés a l'endroit correspondant au craquement 
                x_cor(ko(vari),1) = y_barre(vari,1);
            end    

        end
    end
end

end

