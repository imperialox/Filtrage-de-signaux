function [e,W] = algo_LMS(x,d,P,mu)
%ALGO_LMS Summary of this function goes here
%% ENTREES
% x et d vecteurs avec x(n) et d(n)
% P coeff réponse impulsionnelle du filtre FIR
% µ pas d'adaptation

%% SORTIES
% e vecteur de l'erreur
% W la matrice contenant la suite de filtre FIR
n = length(x);
W=zeros(P,n);
e=zeros(n,1);
y=zeros(n,1);
xvec=zeros(P,1);

for i = 2:n+1 
    xvec=[x(i-1);xvec(1:P-1)];
    y(i-1) = transpose(W(:,i-1))*xvec;
    e(i-1) = d(i-1)-y(i-1);
    W(:,i) = W(:,i-1) + mu*conj(xvec)*e(i-1);

end

% for i = P+1:n+1 
%     xvec=x(i-1:-1:i-P);
%     y(i-1) = transpose(W(:,i-1))*xvec;
%     e(i-1) = d(i-1)-y(i-1);
%    W(:,i) = W(:,i-1) + mu*conj(xvec)*e(i-1);

%end


end

