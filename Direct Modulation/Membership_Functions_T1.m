sup_lim=1;
x = 0:0.0002:sup_lim;

StdvQ=0.0562;
Stdv16=0.0511;
Stdv64=0.0207;
Stdv256=0.0048;

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

% QPSK
[Q1S,Q1MS,Q1MI,Q1I,Q3S,Q3MS,Q3MI,Q3I] = Limits2(LimQ,DistCentQ);

BQRMS = [Q1S,Q1MS,Q1MI,Q1I];
MQRMS = [Q3S,Q3MS,Q3MI,Q3I];
BBQRMS = trapmf(x,MQRMS);
MMQRMS = trapmf (x,BQRMS);

% 16QAM

[M161S,M161MS,M161MI,M161I,M162S,M162MS,M162MI,M162I,M163S,M163MS,M163MI,M163I] = Limits3(Lim216,Lim116,DistCent16);

BM16RMS = [M161S,M161MS,M161MI,M161I];
RM16RMS = [M162S,M162MS,M162MI,M162I];
MM16RMS = [M163S,M163MS,M163MI,M163I];
B16QAM = trapmf(x,BM16RMS);
I16QAM = trapmf(x,RM16RMS);
M16QAM = trapmf(x,MM16RMS);

% 64QAM

[M641S,M641MS,M641MI,M641I,M642S,M642MS,M642MI,M642I,M643S,M643MS,M643MI,M643I] = Limits3(Lim264, Lim164,DistCent64);
 
BM64RMS = [M641S,M641MS,M641MI,M641I];
RM64RMS = [M642S,M642MS,M642MI,M642I];
MM64RMS = [M643S,M643MS,M643MI,M643I];
B64QAM = trapmf(x,BM64RMS);
I64QAM = trapmf(x,RM64RMS);
M64QAM = trapmf (x,MM64RMS);

% 256QAM

[M2561S,M2561MS,M2561MI,M2561I,M2563S,M2563MS,M2563MI,M2563I] = Limits2(Lim256, DistCent256);
 
BM256RMS = [M2561S,M2561MS,M2561MI,M2561I];
MM256RMS = [M2563S,M2563MS,M2563MI,M2563I];
B256RMS = trapmf(x,BM256RMS);
M256RMS = trapmf (x,MM256RMS);

ax1=subplot(4,1,1);
plot (x,BBQRMS,'k--');
axis([0 sup_lim 0 1.5]);
hold on;
plot (x,MMQRMS,'k');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('Bad Behavior','Good Behavior')


ax2=subplot(4,1,2);
plot (x,B16QAM,'k--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I16QAM,'k');
hold on;
plot (x,M16QAM,'k-.');
title(ax2,'Membership Function 16QAM')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('Good Behavior','Average Behavior', 'Bad Behavior')



ax3=subplot(4,1,3);
plot (x,B64QAM,'k--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I64QAM,'k');
hold on;
plot (x,M64QAM,'k-.');
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('Good Behavior','Average Behavior', 'Bad Behavior')



ax4=subplot(4,1,4);
plot (x,B256RMS,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,M256RMS,'k--');
title(ax4,'Membership Function 256QAM')
xlabel(ax4,'x')
ylabel(ax4,'f(x)')
legend('Good Behavior','Bad Behavior')

% Output Memebership functions

x1 = 0:0.01:1;
y5c1= 0.125; % QPSK
y5c2= 0.375; % 16QAM
y5c3= 0.625; % 64QAM
y5c4= 0.875; % 256QAM
stdy5 = (y5c2 - y5c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YG1= [0 0 y5c1 y5c1+stdy5]; %  Trapezoidal for having the whole spectrum covered
YG2 = [y5c2-stdy5 y5c2 y5c2+stdy5]; % Triangular
YG3 = [y5c3-stdy5 y5c3 y5c3+stdy5]; % Triangular
YG4 = [y5c4-stdy5 y5c4 10 10]; %  Trapezoidal for having the whole spectrum covered

y11 = trapmf(x1,YG1);
y12 = trimf(x1,YG2);
y13 = trimf(x1,YG3);
y14= trapmf(x1,YG4);

%{
figure;
plot (x1,y11,'k');
axis([0 sup_lim 0 1.2]);
hold on;
plot (x1,y12,'k--');
hold on;
plot (x1,y13,'k-.');
hold on;
plot (x1,y14,'k:');
legend('QPSK','16QAM',"64QAM","256QAM")
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
y1=DistCent;

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