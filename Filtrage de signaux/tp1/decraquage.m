function x_decraq = decraquage(x,fe)
%DECRAQUAGE Summary of this function goes here
%   Detailed explanation goes here
[X,x]=decoupage(x,fe);
m = 15;
P=10;
X_cor=[];
for i=1:length(X)
    newN0=[];
    n0 = detection(X(:,i));
    compt = 1;
    for in0=1:length(n0)
        if n0(in0)>=18 
            % vérification des conditions pour n0 afin de filtrer les craquements qui sont en bordure de trames
            if n0(in0)<=length(X(:,1))-(17+24)
                newN0(compt) = n0(in0);
                compt=compt+1;
            end
        end
    end
    n0
    newN0
    X_cor(:,i) = correction(X(:,i),newN0);% on corrige chaque trame en parcourant toutes les colonnes de X
end
x_decraq = reconstruction(X_cor)
% un fois la correction terminé, on reconstitue un vecteurs colonnes avec toutes les nouvelles trames
end

