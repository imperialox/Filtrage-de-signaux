function [X,x] = decoupage(x,fe)
%DECOUPAGE Summary of this function goes here
%   Detailed explanation goes here
N=length(x);
Nbe = floor(0.02*fe);%nombre d'échantillons pour 1 trame
Nbt = floor(N/Nbe); %nombre de trames entières
Nbet = Nbe*Nbt;%nombre d'élements de x qui constitue des trames entières
X = reshape(x(1:Nbet,1),Nbe,Nbt);
end

