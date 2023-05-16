P=3;
rxx=xcorr(x,P-1);
rdx=xcorr(d,x,P-1);

RxxR=rxx(P: -1 : 1);
RxxC=rxx(P: 2*P-1);
Rxx=toeplitz(RxxR,RxxC);

Rdx=rdx(P:2*P-1);

w_LS= (conj(Rxx))^(-1)*Rdx;