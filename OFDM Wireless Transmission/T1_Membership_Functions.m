sup_lim=1;
x = 0:0.0002:sup_lim;

StdvQ=0.0375;
Stdv16=0.0255;
Stdv64=0.0375;
Stdv256=0.05;

% Boundaries are defined first
LimQ= 0.15;  % The boundary between good and bad for QPSK 
Lim116= LimQ;  % The boundary for bad in 16QAM
Lim216= 0.25; % The boundary for good in 16QAM
Lim164= Lim216;  % The boundary for bad in 64QAM
Lim264= 0.4; % The boundary for good in 64QAM
Lim256= Lim264;% The boundary between good and bad for 256QAM 

% Distances of the membership sets are established
DistCentQ=StdvQ;
DistCent16=Stdv16;
DistCent64=Stdv64;
DistCent256=Stdv256;

% QPSK
[Q1S,Q1MS,Q1MI,Q1I,Q3S,Q3MS,Q3MI,Q3I] = Limits2(LimQ,DistCentQ);

MQSNR = [Q1S,Q1MS,Q1MI,Q1I];
BQSNR = [Q3S,Q3MS,Q3MI,Q3I];
MMQSNR = trapmf(x,MQSNR);
BBQSNR = trapmf (x,BQSNR);

ax1=subplot(4,1,1);
plot (x,BBQSNR,'k:');
axis([0 sup_lim 0 1.5]);
hold on;
plot (x,MMQSNR,'k--');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('Good Performance','Bad Performance')

[M161S,M161MS,M161MI,M161I,M162S,M162MS,M162MI,M162I,M163S,M163MS,M163MI,M163I] = Limits3(Lim116,Lim216,DistCent16);

MM16SNR = [M161S,M161MS,M161MI,M161I];
RM16SNR = [M162S,M162MS,M162MI,M162I];
BM16SNR = [M163S,M163MS,M163MI,M163I];
M16QAM = trapmf(x,BM16SNR);
I16QAM = trapmf(x,RM16SNR);
B16QAM = trapmf(x,MM16SNR);

ax2=subplot(4,1,2);
plot (x,B16QAM,'k--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I16QAM,'k');
hold on;
plot (x,M16QAM,'k:');
title(ax2,'Membership Function 16QAM')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('Bad Performance','Average Performance', 'Good Performance')


% 64QAM

[M641S,M641MS,M641MI,M641I,M642S,M642MS,M642MI,M642I,M643S,M643MS,M643MI,M643I] = Limits3(Lim164, Lim264,DistCent64);
 
MM64SNR = [M641S,M641MS,M641MI,M641I];
RM64SNR = [M642S,M642MS,M642MI,M642I];
BM64SNR = [M643S,M643MS,M643MI,M643I];
B64QAM = trapmf(x,BM64SNR);
I64QAM = trapmf(x,RM64SNR);
M64QAM = trapmf (x,MM64SNR);

ax3=subplot(4,1,3);
plot (x,M64QAM,'k--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,I64QAM,'k');
hold on;
plot (x,B64QAM,'k:');
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('Bad Performance','Average Performance', 'Good Performance')

% 256QAM

[M2561S,M2561MS,M2561MI,M2561I,M2563S,M2563MS,M2563MI,M2563I] = Limits2(Lim256, DistCent256);
 
MM256SNR = [M2561S,M2561MS,M2561MI,M2561I];
BM256SNR = [M2563S,M2563MS,M2563MI,M2563I];
M256SNR = trapmf(x,BM256SNR);
B256SNR = trapmf (x,MM256SNR);


ax4=subplot(4,1,4);
plot (x,B256SNR,'k--');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,M256SNR,'k:');
title(ax4,'Membership Function 256QAM')
xlabel(ax4,'x')
ylabel(ax4,'f(x)')
legend('Bad Performance','Good Performance')


% Output Memebership functions and Input for Digital Gain

LimDigL= 0.7;  % The boundary for bad in Digital Gain
LimDigH= 0.9; % The boundary for good in Digital Gain
DistGig= (LimDigH-LimDigL)/10;

[MDIG1S,MDIG1MS,MDIG1MI,MDIG1I,MDIG2S,MDIG2MS,MDIG2MI,MDIG2I,MDIG3S,MDIG3MS,MDIG3MI,MDIG3I] = Limits3(LimDigL,LimDigH,DistGig);
 
MMDIGSNR = [MDIG1S,MDIG1MS,MDIG1MI,MDIG1I];
RMDIGSNR = [MDIG2S,MDIG2MS,MDIG2MI,MDIG2I];
BMDIGSNR = [MDIG3S,MDIG3MS,MDIG3MI,MDIG3I];
MDIGQAM = trapmf(x,BMDIGSNR);
IDIGQAM = trapmf(x,RMDIGSNR);
BDIGQAM = trapmf(x,MMDIGSNR);



%%{
figure;
plot (x,MDIGQAM,'k:');
axis([0 sup_lim 0 1.2]);
hold on;
plot (x,IDIGQAM,'k--');
hold on;
plot (x,BDIGQAM,'k');
xlabel('x')
ylabel('f(x)')
legend('Max','Avg',"Min")
%}


function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I] = Limits2(Lim,DistCent)

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

end
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I] = Limits3(LimI, LimS,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites


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





end