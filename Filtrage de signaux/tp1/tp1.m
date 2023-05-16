[x, fe] = audioread("enrose.wav");

x = x(:,1);

soundsc(x,fe)
pause

N = length(x);
t = [0:N-1]/fe;
f = [0:N-1]*fe/N; f = f-fe/2;


figure(1),
plot(t,x)
grid
ylabel('Son original')
title('Signal temporel original')

[X,x]=decoupage(x,fe);
x1 = reconstruction(X);

N1 = length(x1);
t1 = [0:N1-1]/fe;

figure(2),
plot(t1,x1)
grid
ylabel('Son reconstruit')
title('Signal temporel reconstruit')

%%bruit blanc gaussien
signal_test

Ny = length(sn);
ty = [0:Ny-1]/fe;

figure(3),
plot(ty,sn)
grid
ylabel('Son filtrer')
title('Signal temporel filter')

Ntest = length(x_test);
ttest = [0:Ntest-1]/fe;

figure(4),
plot(ttest,x_test)
grid
ylabel('Son test avec les craquements')
title('Signal temporel avec des craquements')

n0=detection(x_test);

x_cor = correction(x_test,n0);

plot(x_test)
hold on
plot(x_cor,'r')
hold off

decraq = decraquage(x,fe);

soundsc(decraq,fe)
plot(x)
hold on
plot(decraq,'r')
hold off

audiowrite("decraq.wav",decraq,fe);
% Edith Piaf- la vie en rose 
