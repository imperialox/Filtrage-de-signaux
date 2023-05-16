%% importation des signaux
load parole_bruitee.mat;
load decticelle.mat ;
%% affichage des signaux de la voix bruitée et des decticelles
figure(1),
subplot(311),
plot(d),
subplot(312),
plot(x);

%% écoute de la voix et du decticelle
Fe = 8192;
%soundsc(d);
%pause
%soundsc(x);

soustraction_bruit

