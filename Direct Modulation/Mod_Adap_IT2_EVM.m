%Variables to test the system;
x = 0:0.01:0.99;

ModAct = X; % Actual Modulation (Input to the system)  0 - QPSK; 1 - 16QAM; 2 - 64QAM; 3- 256QAM 
EVM=Y; % EVM measured at the receiver and normalized in values from  0 to 1

StdvQ=0.0562;
Stdv16=0.0511;
Stdv64=0.0207;
Stdv256=0.0048;
tic;
% The centers and standard deviation of the output functions are defined
y1c1= 0.125; % QPSK
y1c2= 0.375; % 16QAM
y1c3= 0.625; % 64QAM
y2c4= 0.875; % 256QAM
stddevy1out = (y1c2 - y1c1)/2 ; % Std Dev is calculated as half of the distance of the centers

% Variables needed for the model
aux2=0;
outp1=0;
outp11=zeros(1,length(x));
auxout11=0;
auxout12=0;
out1='0';

% Boundaries are defined first
LimQ= 0.695;  % The boundary between good and bad for QPSK 
Lim116= 0.695;  % The boundary for bad in 16QAM
Lim216= 0.3; % The boundary for good in 16QAM
Lim164= Lim216;  % The boundary for bad in 64QAM
Lim264= 0.13; % The boundary for good in 64QAM
Lim256= Lim264;% The boundary between good and bad for 256QAM 

% Distances of the membership sets are established
DistCentQ=StdvQ;
DistCent16=Stdv16;
DistCent64=Stdv64;
DistCent256=Stdv256;

% Then the reduction factors are calculated:

FacRedQL=1-StdvQ;
FacRedQS=1;
FacRed16L=1-Stdv16;
FacRed16S=1;
FacRed64L=1-Stdv64;
FacRed64S=1;
FacRed256L=1-Stdv256;
FacRed256S=1;

% The boundries for the different UMF and LMF functions are calculated:

% QPSK
[SQ1S,SQ1MS,SQ1MI,SQ1I,SQ2S,SQ2MS,SQ2MI,SQ2I,LQ1S,LQ1MS,LQ1MI,LQ1I,LQ2S,LQ2MS,LQ2MI,LQ2I] = Limits2(LimQ,DistCentQ);
% UMF boundary points:
BQSEVM = [SQ1S,SQ1MS,SQ1MI,SQ1I];
MQSEVM = [SQ2S,SQ2MS,SQ2MI,SQ2I]; 
% LMF boundary points:
BQLEVM = [LQ1S,LQ1MS,LQ1MI,LQ1I];
MQLEVM = [LQ2S,LQ2MS,LQ2MI,LQ2I];

% 16QAM
[S161S,S161MS,S161MI,S161I,S162S,S162MS,S162MI,S162I,S163S,S163MS,S163MI,S163I,L161S,L161MS,L161MI,L161I,L162S,L162MS,L162MI,L162I,L163S,L163MS,L163MI,L163I] = Limits3(Lim216, Lim116,DistCent16);
% UMF boundary points:
B16SEVM = [S161S,S161MS,S161MI,S161I];
R16SEVM = [S162S,S162MS,S162MI,S162I];
M16SEVM = [S163S,S163MS,S163MI,S163I];
% LMF boundary points:
B16LEVM = [L161S,L161MS,L161MI,L161I];
R16LEVM = [L162S,L162MS,L162MI,L162I];
M16LEVM = [L163S,L163MS,L163MI,L163I];



% 64QAM
[S641S,S641MS,S641MI,S641I,S642S,S642MS,S642MI,S642I,S643S,S643MS,S643MI,S643I,L641S,L641MS,L641MI,L641I,L642S,L642MS,L642MI,L642I,L643S,L643MS,L643MI,L643I] = Limits3(Lim264, Lim164,DistCent64);
% UMF boundary points:
B64SEVM = [S641S,S641MS,S641MI,S641I];
R64SEVM = [S642S,S642MS,S642MI,S642I];
M64SEVM = [S643S,S643MS,S643MI,S643I]; 
% LMF boundary points:
B64LEVM = [L641S,L641MS,L641MI,L641I];
R64LEVM = [L642S,L642MS,L642MI,L642I];
M64LEVM = [L643S,L643MS,L643MI,L643I];


% 256QAM
[S2561S,S2561MS,S2561MI,S2561I,S2562S,S2562MS,S2562MI,S2562I,L2561S,L2561MS,L2561MI,L2561I,L2562S,L2562MS,L2562MI,L2562I] = Limits2(Lim256,DistCent256);
% UMF boundary points:
B256SEVM = [S2561S,S2561MS,S2561MI,S2561I];
M256SEVM = [S2562S,S2562MS,S2562MI,S2562I]; 
% LMF boundary points:
B256LEVM = [L2561S,L2561MS,L2561MI,L2561I];
M256LEVM = [L2562S,L2562MS,L2562MI,L2562I];


% The input variables are normalized and fuzzified for the UMF and the LMF:
[us11, us12, us13, us21, us22, us23, us24] = Fuzzy(FacRedQS,FacRed16S,FacRed64S,FacRed256S, EVM, ModAct,BQSEVM,MQSEVM,B16SEVM,R16SEVM,M16SEVM,B64SEVM,R64SEVM,M64SEVM,B256SEVM,M256SEVM);
[ul11, ul12, ul13, ul21, ul22, ul23, ul24] = Fuzzy(FacRedQL,FacRed16L,FacRed64L,FacRed256L, EVM, ModAct,BQLEVM,MQLEVM,B16LEVM,R16LEVM,M16LEVM,B64LEVM,R64LEVM,M64LEVM,B256LEVM,M256LEVM);


%The antecedents of the rules are calculated:
[Ars1, Ars2, Ars3, Ars4, Ars5, Ars6, Ars7, Ars8, Ars9, Ars10]=Antecedentes(us11, us12, us13, us21, us22, us23, us24);
[Arl1, Arl2, Arl3, Arl4, Arl5, Arl6, Arl7, Arl8, Arl9, Arl10]=Antecedentes(ul11, ul12, ul13, ul21, ul22, ul23, ul24);


%  The mandami implication is calculated:
[rs11, rs12, rs13, rs14, rs15, rs16, rs17, rs18, rs19, rs111]= Mandami (Ars1, Ars2, Ars3, Ars4, Ars5, Ars6, Ars7, Ars8, Ars9, Ars10, x);
[rl11, rl12, rl13, rl14, rl15, rl16, rl17, rl18, rl19, rl111]= Mandami (Arl1, Arl2, Arl3, Arl4, Arl5, Arl6, Arl7, Arl8, Arl9, Arl10, x);

%The maximum value of the implications are calculated fopr the UMF and the LMF:
[outps] = Maximo(rs11, rs12, rs13, rs14, rs15, rs16, rs17, rs18, rs19, rs111);
[outpl] = Maximo(rl11, rl12, rl13, rl14, rl15, rl16, rl17, rl18, rl19, rl111);

%{
figure

ax3=plot(x,outps);
hold on
ax3=plot(x,outpl,'r--');
axis([0 1 0 1])
title('Output Function IT2')
xlabel('x')
ylabel('f(x)')
legend('UMF','LMF')

%}


% The  EIASC method is used for defuzzification :
YoutMod = EIASC(outps,outpl,x,1);
toc
pler = toc;
% Output definitions
% New modulation


[New_Mod, NMN]= Out_Final(YoutMod);
%display(New_Mod)

function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I] = Limits2(Lim,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

x1=Lim;
y1=DistCent;


S1S = 0;
S1MS = 0;
S1MI = Lim-y1;
S1I = Lim+y1;


S2S = Lim-y1;
S2MS = Lim+y1;
S2MI = 10;
S2I = 10;

L1S = 0;
L1MS = 0;
L1MI = Lim-y1-DistCent;
L1I = Lim+y1-DistCent;

L2S = Lim+y1-DistCent;
L2MS = Lim+y1+DistCent;
L2MI = 10;
L2I = 10;



end
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I,L3S,L3MS,L3MI,L3I] = Limits3(LimI, LimS,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

x1=LimS-LimI;
y1=DistCent;

S1S = 0;
S1MS = 0;
S1MI = LimI-y1;
S1I = LimI+y1;

S2S = LimI-y1-DistCent;
S2MS = LimI+y1-DistCent;
S2MI = LimS-y1;
S2I = LimS+y1;

S3S = LimS-y1-DistCent;
S3MS = LimS+y1-DistCent;
S3MI = 10;
S3I = 10;

L1S = 0;
L1MS = 0;
L1MI = LimI-y1-DistCent;
L1I = LimI+y1-DistCent;

L2S = LimI-y1;
L2MS = LimI+y1;
L2MI = LimS-y1-DistCent;
L2I = LimS+y1-DistCent;

L3S = LimS-y1;
L3MS = LimS+y1;
L3MI = 1;
L3I = 1;

end
function [u11,u12,u13,u21,u22,u23,u24] = Fuzzy(FacRedQ,FacRed16,FacRed64,FacRed256, EVM, ModAct,MQEVM,BQEVM,M16EVM,R16EVM,B16EVM,M64EVM,R64EVM,B64EVM,M256EVM,B256EVM)
% primero se estiman los valores de pertenencia de cada variable partiendo
% de las funciones de cada variable (entradas)
%u11 = EVM malo
%u12 = EVM Intermedio
%u13 = EVM Bueno
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM

x1=EVM/10;

% Se revisa para cada modulación el valor asociado    

if ModAct == 0
    FacRed = FacRedQ;
    u11 = FacRed*trapmf(x1,BQEVM);
    u12 = 0;
    u13 = FacRed*trapmf(x1,MQEVM);
    u21 = FacRed;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
    u22 = 0;
    u23 = 0;
    u24 = 0;

elseif ModAct == 1
    FacRed = FacRed16;
    u11 = FacRed*trapmf(x1,B16EVM);
    u12 = FacRed*trapmf(x1,R16EVM);
    u13 = FacRed*trapmf(x1,M16EVM);
    u21 = 0;
    u22 = FacRed;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
    u23 = 0;
    u24 = 0;
    
elseif ModAct == 2
    FacRed = FacRed64;
    u11 = FacRed*trapmf(x1,B64EVM);
    u12 = FacRed*trapmf(x1,R64EVM);
    u13 = FacRed*trapmf(x1,M64EVM);
    u21 = 0;
    u22 = 0;
    u23 = FacRed;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
    u24 = 0;
    
else
    FacRed = FacRed256;
    u11 = FacRed*trapmf(x1,B256EVM);
    u12 = 0;
    u13 = FacRed*trapmf(x1,M256EVM);
    u21 = 0;
    u22 = 0;
    u23 = 0;
    u24 = FacRed;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
    
end

end
function [Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10] = Antecedentes(u11, u12, u13, u21, u22, u23, u24)
%u11 = EVM malo
%u12 = EVM Intermedio
%u13 = EVM Bueno
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM

% Reglas con Mod 256-QAM
A1 = [u13 u24];
Ar1 = min(A1);
A2 = [u11 u24];
Ar2 = min(A2);

% Reglas con Mod 64-QAM
A3 = [u13 u23];
Ar3 = min(A3);
A4 = [u12 u23];
Ar4 = min(A4);
A5 = [u11 u23];
Ar5 = min(A5);

% Reglas con Mod 16-QAM
A6 = [u13 u22];
Ar6 = min(A6);
A7 = [u12 u22];
Ar7 = min(A7);
A8 = [u11 u22];
Ar8 = min(A8);

%Reglas con Mod QPSK
A9 = [u13 u21];
Ar9 = min(A9);
A10 = [u11 u21];
Ar10 = min(A10);

end
function [r01, r02, r03, r04, r05, r06, r07, r08, r09, r010] = Mandami(Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10, x)


% se crean las funciones de pertenencia de las funciones de salida
% toda la funcion, ningun punto en especifico
% centro de las funciones de pertenencia de salida
y1c1= 0.20; % QPSK
y1c2= 0.40; % 16-QAM
y1c3= 0.60; % 64-QAM
y1c4= 0.80; % 256-QAM

%Mod nueva 10 - QPSK; 30 - 8PSK; 50 - 16QAM; 70- 32QAM; 90- 64QAM
y11 = gaussmf(x,[0.025 y1c1]);
y12 = gaussmf(x,[0.025 y1c2]);
y13 = gaussmf(x,[0.025 y1c3]);
y14 = gaussmf(x,[0.025 y1c4]);



    %se crean vectores de los valores obtenidos en los antecedentes para poder sacar el minimo de dos vectores
Ar=ones(1,length(x));
Ar11= Ar *Ar1;
Ar22= Ar *Ar2;
Ar33= Ar *Ar3;
Ar44= Ar *Ar4;
Ar55= Ar *Ar5;
Ar66= Ar *Ar6;
Ar77= Ar *Ar7;
Ar88= Ar *Ar8;
Ar99= Ar *Ar9;
Ar10= Ar *Ar10;


        % se calcula el minimo entre el valor y la funcion de salida de
        % cada regla de la nueva mod.
%y11 = QPSK; 
%y12 = 16QAM;
%y13 = 64QAM; 
%y14 = 256QAM;


r01=min(Ar11,y14);
r02=min(Ar22,y13);
r03=min(Ar33,y14);
r04=min(Ar44,y13);
r05=min(Ar55,y12);
r06=min(Ar66,y13);
r07=min(Ar77,y12);
r08=min(Ar88,y11);
r09=min(Ar99,y12);
r010=min(Ar10,y11);

 

end
function [outp1] = Maximo(r11, r12, r13, r14, r15, r16, r17, r18, r19, r111)

aux0 = max(r11,r12);
aux0 = max(aux0,r13);
aux0 = max(aux0,r14);
aux0 = max(aux0,r15);
aux0 = max(aux0,r16);
aux0 = max(aux0,r17);
aux0 = max(aux0,r18);
aux0 = max(aux0,r19);
outp1 = max(aux0,r111);

end
function [yout] = EIASC(Wr,Wl,X,needSort)

Xr=X;
Xl=Xr;
ly=length(Xl); % determina la longitud de la cantidad de puntos
XrEmpty=isempty(Xr);

if max(Wl)==0 % En caso que por en la LMF no haya valores, el valor será el promedio de los valores en el eje X.
    yl=min(Xl); 
    yr=max(Xr);
    yout=(yl+yr)/2;
    l=1; 
    r=ly-1;
    return;
end

index=find(Wr<10^(-10)); %ubica los valores de Wr que son de valores muy pequeños

if length(index)==ly %si todos los valores son muy pequeños se computa directamente el promedio entre el max del UMF y el min del LMF
    yl=min(Xl); 
    yr=max(Xr);
    yout=(yl+yr)/2;
    l=1; 
    r=ly-1;
    return;
end

Xl(index)=[]; 
Xr(index)=[];
Wl(index)=[]; 
Wr(index)=[];

% Compute yl
if needSort [Xl,index]=sort(Xl); % Ordena todos los vectores de manera ascendente
    Xr=Xr(index);
    Wl=Wl(index);
    Wr=Wr(index);
end

Wl2=Wl;
Wr2=Wr;

for i=length(Xl):-1:2 % Hace Xl unico y se va en pasos de -1 hasta llegar al 2
    if Xl(i)==Xl(i-1) % si hay valores repetidos los cambia por la suma del valor anterior
        Wl(i)=Wl(i)+Wl(i-1);
        Wr(i)=Wr(i)+Wr(i-1);
        Xl(i)=[];
        Wl(i-1)=[]; 
        Wr(i-1)=[];
    end
end

ly=length(Xl);
if ly==1
    yl=Xl;
    l=1;
else
    yl=Xl(end); % toma el ultimo valor del eje X
    l=0;
    a=Xl*Wl';%multiplica 
    b=sum(Wl);% calcula la suma de wl
    while yl > Xl(l+1)
        l=l+1;
        a=a+Xl(l)*(Wr(l)-Wl(l));
        b=b+Wr(l)-Wl(l);
        yl=a/b;
    end
end

% Compute yr
if XrEmpty && needSort==1
    [Xr,index]=sort(Xr);
    Wl=Wl2(index); 
    Wr=Wr2(index);
end

if XrEmpty
    for i=length(Xr):-1:2 % Make Xr unique
        if Xr(i)==Xr(i-1)
        Wl(i)=Wl(i)+Wl(i-1);
        Wr(i)=Wr(i)+Wr(i-1);
        Xr(i)=[];
        Wl(i-1)=[];
        Wr(i-1)=[];
        end
    end
end

ly=length(Xr);
if ly==1
    yr=Xr;
    r=1;
else
r=ly; 
yr=Xr(1);
a=Xr*Wl'; 
b=sum(Wl);
    while yr < Xr(r)
        a=a+Xr(r)*(Wr(r)-Wl(r));
        b=b+Wr(r)-Wl(r);
        yr=a/b; 
        r=r-1;
    end
yout=(yl+yr)/2;
end
end
function [New_Mod, NMN]= Out_Final(outnm)

% New Modulation

y1c1= 0.125; % QPSK
y1c2= 0.375; % 16QAM
y1c3= 0.625; % 64QAM
y1c4= 0.875; % 256QAM

a1=[y1c1 y1c2 y1c3 y1c4];
n=outnm;
[val,idx]=min(abs(a1-n));
b5= ["QPSK" "16QAM" "64QAM" "256QAM"];
New_Mod=b5(idx);
NMN = idx-1;


end

