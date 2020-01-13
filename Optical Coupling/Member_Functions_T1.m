sup_lim=1;
x = 0:0.0002:sup_lim;

StdvQ=0.0184;
Stdv16=0.0192;
Stdv64=0.016;
Stdv256=0.0187;

%Primero las variables para el IT2 de QPSK
LimQ= 0.14;  % El limite de pertenencia de cada funcion - bueno y malo
DistCentQ=StdvQ;


%Luego las variables para el IT2 de 16QAM
Lim216= 0.14;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim116= 0.3716;
DistCent16=Stdv16;

%Luego las variables para el IT2 de 64QAM
Lim264= 0.3716;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim164= 0.4827;
DistCent64=Stdv64;


%Por ultimo  las variables para el IT2 de 256
Lim256= 0.4827;  % El limite de pertenencia de cada funcion - bueno y malo
DistCent256=Stdv256;

% QPSK
[Q1S,Q1MS,Q1MI,Q1I,Q3S,Q3MS,Q3MI,Q3I] = Limits2(LimQ,DistCentQ);

MQRMS = [Q1S,Q1MS,Q1MI,Q1I];
BQRMS = [Q3S,Q3MS,Q3MI,Q3I];
BBQRMS = trapmf(x,MQRMS);
MMQRMS = trapmf (x,BQRMS);


% 16QAM

[M161S,M161MS,M161MI,M161I,M162S,M162MS,M162MI,M162I,M163S,M163MS,M163MI,M163I] = Limits3(Lim216,Lim116,DistCent16);

MM16RMS = [M161S,M161MS,M161MI,M161I];
RM16RMS = [M162S,M162MS,M162MI,M162I];
BM16RMS = [M163S,M163MS,M163MI,M163I];
B16QAM = trapmf(x,BM16RMS);
I16QAM = trapmf(x,RM16RMS);
M16QAM = trapmf (x,MM16RMS);

% 64QAM

[M641S,M641MS,M641MI,M641I,M642S,M642MS,M642MI,M642I,M643S,M643MS,M643MI,M643I] = Limits3(Lim264, Lim164,DistCent64);
 
MM64RMS = [M641S,M641MS,M641MI,M641I];
RM64RMS = [M642S,M642MS,M642MI,M642I];
BM64RMS = [M643S,M643MS,M643MI,M643I];
B64QAM = trapmf(x,BM64RMS);
I64QAM = trapmf(x,RM64RMS);
M64QAM = trapmf (x,MM64RMS);

% 256QAM

[M2561S,M2561MS,M2561MI,M2561I,M2563S,M2563MS,M2563MI,M2563I] = Limits2(Lim256, DistCent256);
 
MM256RMS = [M2561S,M2561MS,M2561MI,M2561I];
BM256RMS = [M2563S,M2563MS,M2563MI,M2563I];
B256RMS = trapmf(x,BM256RMS);
M256RMS = trapmf (x,MM256RMS);


ax1=subplot(4,1,1);
plot (x,BBQRMS,'r--');
axis([0 sup_lim 0 1.5]);
hold on;
plot (x,MMQRMS,'b');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('Bad Behavior','Good Behavior')



ax3=subplot(4,1,2);
plot (x,B16QAM,'b--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I16QAM,'k');
hold on;
plot (x,M16QAM,'r--');
title(ax3,'Membership Function 16QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('Bad Behavior','Average Behavior', 'Good Behavior')



ax3=subplot(4,1,3);
plot (x,B64QAM,'b--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I64QAM,'k'),;
hold on;
plot (x,M64QAM,'r--');
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('Bad Behavior','Average Behavior', 'Good Behavior')



ax3=subplot(4,1,4);
plot (x,B256RMS,'b');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,M256RMS,'r--');
title(ax3,'Membership Function 256QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('Good Behavior','Bad Behavior')

% Funciones de pertenencia de salida

x1 = 0:0.02:1;
y1c1= 0.20; % QPSK
y1c2= 0.40; % 16-QAM
y1c3= 0.60; % 64-QAM
y1c4= 0.80; % 256-QAM

%Mod nueva 10 - QPSK; 30 - 8PSK; 50 - 16QAM; 70- 32QAM; 90- 64QAM
y11 = gaussmf(x1,[0.025 y1c1]);
y12 = gaussmf(x1,[0.025 y1c2]);
y13 = gaussmf(x1,[0.025 y1c3]);
y14 = gaussmf(x1,[0.025 y1c4]);

%{
figure;
plot (x1,y11);
hold on;
plot (x1,y12);
hold on;
plot (x1,y13);
hold on;
plot (x1,y14);
%}


function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I] = Limits2(Lim,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

x1=Lim;
y1=3*DistCent;

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
L1MI = Lim-y1;
L1I = Lim+y1;

L2S = Lim-y1;
L2MS = Lim+y1;
L2MI = 10;
L2I = 10;



end
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I,L3S,L3MS,L3MI,L3I] = Limits3(LimI, LimS,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

x1=LimS-LimI;
y1=3*DistCent;

S1S = 0;
S1MS = 0;
S1MI = LimI-y1;
S1I = LimI+y1;

S2S = LimI-y1;
S2MS = LimI+y1;
S2MI = LimS-y1;
S2I = LimS+y1;

S3S = LimS-y1;
S3MS = LimS+y1;
S3MI = 10;
S3I = 10;

L1S = 0;
L1MS = 0;
L1MI = LimI-y1;
L1I = LimI+y1;

L2S = LimI-y1;
L2MS = LimI+y1;
L2MI = LimS-y1;
L2I = LimS+y1;

L3S = LimS-y1;
L3MS = LimS+y1;
L3MI = 1;
L3I = 1;



end