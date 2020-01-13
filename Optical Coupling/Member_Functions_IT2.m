sup_lim=1;
x = 0:0.0001:sup_lim;

StdvQ=0.0184;
Stdv16=0.0192;
Stdv64=0.016;
Stdv256=0.0187;

%Primero las variables para el IT2 de QPSK
LimQ= 0.14;  % El limite de pertenencia de cada funcion - bueno y malo
DistCentQ=StdvQ;
FacRedQL=1-10*DistCentQ;
FacRedQS=1;

%Luego las variables para el IT2 de 16QAM
Lim216= 0.14;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim116= 0.3716;
DistCent16=Stdv16;
FacRed16L=1-10*DistCent16;
FacRed16S=1;

%Luego las variables para el IT2 de 64QAM
Lim264= 0.3716;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim164= 0.4827;
DistCent64=Stdv64;
FacRed64L=1-10*DistCent64;
FacRed64S=1;

%Por ultimo  las variables para el IT2 de 256
Lim256= 0.4827;  % El limite de pertenencia de cada funcion - bueno y malo
DistCent256=Stdv256;
FacRed256L=1-10*DistCent256;
FacRed256S=1;

% QPSK
[SQ1S,SQ1MS,SQ1MI,SQ1I,SQ2S,SQ2MS,SQ2MI,SQ2I,LQ1S,LQ1MS,LQ1MI,LQ1I,LQ2S,LQ2MS,LQ2MI,LQ2I] = Limits2(LimQ,DistCentQ);
% Puntos limites para las Funciones Superiores
BQSRMS = [SQ1S,SQ1MS,SQ1MI,SQ1I];
MQSRMS = [SQ2S,SQ2MS,SQ2MI,SQ2I];
 
% Puntos limites para las Funciones Inferiores
BQLRMS = [LQ1S,LQ1MS,LQ1MI,LQ1I];
MQLRMS = [LQ2S,LQ2MS,LQ2MI,LQ2I];

SBQRMS = FacRedQS*trapmf(x,BQSRMS);
SMQRMS = FacRedQS*trapmf (x,MQSRMS);
LBQRMS = FacRedQL*trapmf(x,BQLRMS);
LMQRMS = FacRedQL*trapmf (x,MQLRMS);

% 16QAM
[S161S,S161MS,S161MI,S161I,S162S,S162MS,S162MI,S162I,S163S,S163MS,S163MI,S163I,L161S,L161MS,L161MI,L161I,L162S,L162MS,L162MI,L162I,L163S,L163MS,L163MI,L163I] = Limits3(Lim216, Lim116,DistCent16);

% Puntos limites para las Funciones Superiores
B16SRMS = [S161S,S161MS,S161MI,S161I];
R16SRMS = [S162S,S162MS,S162MI,S162I];
M16SRMS = [S163S,S163MS,S163MI,S163I];
 
% Puntos limites para las Funciones Inferiores
B16LRMS = [L161S,L161MS,L161MI,L161I];
R16LRMS = [L162S,L162MS,L162MI,L162I];
M16LRMS = [L163S,L163MS,L163MI,L163I];

SB16QAM = FacRed16S*trapmf(x,B16SRMS);
SI16QAM = FacRed16S*trapmf(x,R16SRMS);
SM16QAM = FacRed16S*trapmf (x,M16SRMS);

LB16QAM = FacRed16L*trapmf(x,B16LRMS);
LI16QAM = FacRed16L*trapmf(x,R16LRMS);
LM16QAM = FacRed16L*trapmf(x,M16LRMS);


% 64QAM
% 64QAM
[S641S,S641MS,S641MI,S641I,S642S,S642MS,S642MI,S642I,S643S,S643MS,S643MI,S643I,L641S,L641MS,L641MI,L641I,L642S,L642MS,L642MI,L642I,L643S,L643MS,L643MI,L643I] = Limits3(Lim264, Lim164,DistCent64);
 
% Puntos limites para las Funciones Superiores
B64SRMS = [S641S,S641MS,S641MI,S641I];
R64SRMS = [S642S,S642MS,S642MI,S642I];
M64SRMS = [S643S,S643MS,S643MI,S643I];
 
% Puntos limites para las Funciones Inferiores
B64LRMS = [L641S,L641MS,L641MI,L641I];
R64LRMS = [L642S,L642MS,L642MI,L642I];
M64LRMS = [L643S,L643MS,L643MI,L643I];

SB64QAM = FacRed64S*trapmf(x,B64SRMS);
SI64QAM = FacRed64S*trapmf(x,R64SRMS);
SM64QAM = FacRed64S*trapmf (x,M64SRMS);

LB64QAM = FacRed64L*trapmf(x,B64LRMS);
LI64QAM = FacRed64L*trapmf(x,R64LRMS);
LM64QAM = FacRed64L*trapmf (x,M64LRMS);

% 256QAM
[S2561S,S2561MS,S2561MI,S2561I,S2562S,S2562MS,S2562MI,S2562I,L2561S,L2561MS,L2561MI,L2561I,L2562S,L2562MS,L2562MI,L2562I] = Limits2(Lim256,DistCent256);
% Puntos limites para las Funciones Superiores
B256SRMS = [S2561S,S2561MS,S2561MI,S2561I];
M256SRMS = [S2562S,S2562MS,S2562MI,S2562I];
 
% Puntos limites para las Funciones Inferiores
B256LRMS = [L2561S,L2561MS,L2561MI,L2561I];
M256LRMS = [L2562S,L2562MS,L2562MI,L2562I];

SB256RMS = FacRed256S*trapmf(x,B256SRMS);
SM256RMS = FacRed256S*trapmf (x,M256SRMS);
LB256RMS = FacRed256L*trapmf(x,B256LRMS);
LM256RMS = FacRed256L*trapmf (x,M256LRMS);


ax1=subplot(4,1,1);
plot (x,SBQRMS,'b');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SMQRMS,'b');
hold on;
plot (x,LBQRMS,'r--');
hold on;
plot (x,LMQRMS,'r--');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','', 'LMF','')



ax3=subplot(4,1,2);
plot (x,SB16QAM,'b');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SM16QAM,'b');
hold on;
plot (x,SI16QAM,'b');
hold on;
plot (x,LB16QAM,'r--');
hold on;
plot (x,LI16QAM,'r--');
hold on;
plot (x,LM16QAM,'r--');
title(ax3,'Membership Function 16QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('UMF','', '','LMF','','')


ax3=subplot(4,1,3);
plot (x,SB64QAM,'b');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SI64QAM,'b');
hold on;
plot (x,SM64QAM,'b');
hold on;
plot (x,LB64QAM,'r--');
hold on;
plot (x,LI64QAM,'r--');
hold on;
plot (x,LM64QAM,'r--');
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('UMF','' ,'','LMF','','')


ax3=subplot(4,1,4);
plot (x,SB256RMS,'b');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SM256RMS,'b');
hold on;
plot (x,LB256RMS,'r--');
hold on;
plot (x,LM256RMS,'r--');
title(ax3,'Membership Function 256QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('UMF','', 'LMF','')

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