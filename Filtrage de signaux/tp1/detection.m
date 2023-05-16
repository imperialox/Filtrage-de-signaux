function n0 = detection(x)
%DETECTION Summary of this function goes here
%   Detailed explanation goes here
P=10;% ordre du filtre

[a,sw2] = aryule(x,P);%equations de Yule-Waker résolues avec l'algorithme de Levinson pourdéterminer les coéfficients autorégréssifs et la variance

bruit_model = filter(a,1,x);% création du bruit de la modélisation

zn = filter(fliplr(a),1,bruit_model);% Création du signal avec un RSB(rapport signal à bruit) maximum

seuil = 3*sqrt(sw2*(a*transpose(a)));% Calcule du seuil

abszn = abs(zn);

indice_pos = 1;

for i=1:length(abszn) % détection des position n ayant une amplituque qui dépasse le seuil qui à été calculé
    if abszn(i)>= seuil
        n0(indice_pos)=i-P;
        indice_pos=indice_pos+1;
    end
end
if indice_pos == 1% si il y aucun craquement on retourne un vecteur vide
    n0=[];
end
end

