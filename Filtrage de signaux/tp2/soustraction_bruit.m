[e,W] = algo_LMS(x,d,3,10^(-10)); 
%% affichage de l'erreur
figure(2),
plot(e);

Wopt = [1;
        0.5;
        0.25];

erreurCoeff = abs(W-Wopt);

norme = sum(erreurCoeff.^(2));

%% affichage des coefficient de P en fonction du temps
figure(3),
plot(W.'),
legend("bleu = évolution des coeffs de la ligne 1","rouge = évolution des coeffs de la ligne 2","jaune = évolution des coeffs de la ligne 3");
%% affichage des erreurs des coefficients de P
figure(4),
plot(erreurCoeff.'),
legend("bleu = évolution des coeffs de la ligne 1","rouge = évolution des coeffs de la ligne 2","jaune = évolution des coeffs de la ligne 3");

figure(5),
plot(norme),
legend("évolution de la norme 2 au carrée");
soundsc(e);
