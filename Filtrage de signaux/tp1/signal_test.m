%% Bruit blanc gaussien
l=600;%longueur d'échantillons
variance = 2;%variance du bruit blanc gaussien
bbg=sqrt(variance)*randn(l,1);%RANDOMISATION du bruit blanc gaussien

P=10;% ordre du modèle autorégrésif
B = 1;
A=[1 -1.6507 0.6711 -0.1807 0.6130 -0.6085 0.3977 -0.6122 0.5410 0.1321 -0.2393];

%% filtrage
sn = filter(B,A,bbg);

%% création des craquements
x_test=sn;
x_test(100)=sn(100)+50;
x_test(200)=sn(200)-50;
x_test(300)=sn(300)+50;
x_test(400)=sn(400)-50;
x_test(500)=sn(500)+50;
