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


% Then the reduction factors are calculated:

FacRedQL=1-StdvQ*5; %multplied by 5 to generate a certain degree of uncertainty
FacRedQS=1;
FacRed16L=1-Stdv16*5;
FacRed16S=1;
FacRed64L=1-Stdv64*5;
FacRed64S=1;
FacRed256L=1-Stdv256*5;
FacRed256S=1;


% QPSK
[SQ1S,SQ1MS,SQ1MI,SQ1I,SQ2S,SQ2MS,SQ2MI,SQ2I,LQ1S,LQ1MS,LQ1MI,LQ1I,LQ2S,LQ2MS,LQ2MI,LQ2I] = Limits2(LimQ,DistCentQ);
% Threshold Point for Upper Functions
BQSSNR = [SQ1S,SQ1MS,SQ1MI,SQ1I];
MQSSNR = [SQ2S,SQ2MS,SQ2MI,SQ2I];
 
% Threshold Point for Lower Functions
BQLSNR = [LQ1S,LQ1MS,LQ1MI,LQ1I];
MQLSNR = [LQ2S,LQ2MS,LQ2MI,LQ2I];

SBQSNR = FacRedQS*trapmf(x,BQSSNR);
SMQSNR = FacRedQS*trapmf (x,MQSSNR);
LBQSNR = FacRedQL*trapmf(x,BQLSNR);
LMQSNR = FacRedQL*trapmf (x,MQLSNR);

% 16QAM
[S161S,S161MS,S161MI,S161I,S162S,S162MS,S162MI,S162I,S163S,S163MS,S163MI,S163I,L161S,L161MS,L161MI,L161I,L162S,L162MS,L162MI,L162I,L163S,L163MS,L163MI,L163I] = Limits3(Lim116, Lim216,DistCent16);

% Threshold Point for Upper Functions
B16SSNR = [S161S,S161MS,S161MI,S161I];
R16SSNR = [S162S,S162MS,S162MI,S162I];
M16SSNR = [S163S,S163MS,S163MI,S163I];
 
% Threshold Point for Lower Functions
B16LSNR = [L161S,L161MS,L161MI,L161I];
R16LSNR = [L162S,L162MS,L162MI,L162I];
M16LSNR = [L163S,L163MS,L163MI,L163I];

SB16QAM = FacRed16S*trapmf(x,B16SSNR);
SI16QAM = FacRed16S*trapmf(x,R16SSNR);
SM16QAM = FacRed16S*trapmf (x,M16SSNR);

LB16QAM = FacRed16L*trapmf(x,B16LSNR);
LI16QAM = FacRed16L*trapmf(x,R16LSNR);
LM16QAM = FacRed16L*trapmf(x,M16LSNR);



% 64QAM
[S641S,S641MS,S641MI,S641I,S642S,S642MS,S642MI,S642I,S643S,S643MS,S643MI,S643I,L641S,L641MS,L641MI,L641I,L642S,L642MS,L642MI,L642I,L643S,L643MS,L643MI,L643I] = Limits3(Lim164, Lim264,DistCent64);
 
% Threshold Point for Upper Functions
B64SSNR = [S641S,S641MS,S641MI,S641I];
R64SSNR = [S642S,S642MS,S642MI,S642I];
M64SSNR = [S643S,S643MS,S643MI,S643I];
 
% Threshold Point for Lower Functions
B64LSNR = [L641S,L641MS,L641MI,L641I];
R64LSNR = [L642S,L642MS,L642MI,L642I];
M64LSNR = [L643S,L643MS,L643MI,L643I];

SB64QAM = FacRed64S*trapmf(x,B64SSNR);
SI64QAM = FacRed64S*trapmf(x,R64SSNR);
SM64QAM = FacRed64S*trapmf (x,M64SSNR);

LB64QAM = FacRed64L*trapmf(x,B64LSNR);
LI64QAM = FacRed64L*trapmf(x,R64LSNR);
LM64QAM = FacRed64L*trapmf (x,M64LSNR);

% 256QAM
[S2561S,S2561MS,S2561MI,S2561I,S2562S,S2562MS,S2562MI,S2562I,L2561S,L2561MS,L2561MI,L2561I,L2562S,L2562MS,L2562MI,L2562I] = Limits2(Lim256,DistCent256);
% Threshold Point for Upper Functions
B256SSNR = [S2561S,S2561MS,S2561MI,S2561I];
M256SSNR = [S2562S,S2562MS,S2562MI,S2562I];
 
% Threshold Point for Lower Functions
B256LSNR = [L2561S,L2561MS,L2561MI,L2561I];
M256LSNR = [L2562S,L2562MS,L2562MI,L2562I];

SB256SNR = FacRed256S*trapmf(x,B256SSNR);
SM256SNR = FacRed256S*trapmf (x,M256SSNR);
LB256SNR = FacRed256L*trapmf(x,B256LSNR);
LM256SNR = FacRed256L*trapmf (x,M256LSNR);

%%{
ax1=subplot(4,1,1);
plot (x,SBQSNR,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SMQSNR,'k');
hold on;
plot (x,LBQSNR,'k--');
hold on;
plot (x,LMQSNR,'k--');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','', 'LMF','')



ax2=subplot(4,1,2);
plot (x,SB16QAM,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SM16QAM,'k');
hold on;
plot (x,SI16QAM,'k');
hold on;
plot (x,LB16QAM,'k--');
hold on;
plot (x,LI16QAM,'k--');
hold on;
plot (x,LM16QAM,'k--');
title(ax2,'Membership Function 16QAM')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('UMF','', '','LMF','','')


ax3=subplot(4,1,3);
plot (x,SB64QAM,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SI64QAM,'k');
hold on;
plot (x,SM64QAM,'k');
hold on;
plot (x,LB64QAM,'k--');
hold on;
plot (x,LI64QAM,'k--');
hold on;
plot (x,LM64QAM,'k--');
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('UMF','' ,'','LMF','','')


ax4=subplot(4,1,4);
plot (x,SB256SNR,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SM256SNR,'k');
hold on;
plot (x,LB256SNR,'k--');
hold on;
plot (x,LM256SNR,'k--');
title(ax4,'Membership Function 256QAM')
xlabel(ax4,'x')
ylabel(ax4,'f(x)')
legend('UMF','', 'LMF','')
%}

% Input for Digital Gain

% Boundaries are defined first

LimDigL= 0.7;  % The boundary for bad in Dig Gain
LimDigH= 0.9; % The boundary for good in Dig Gain
DistGig= (LimDigH-LimDigL)/10;
FacRedDIGL=1-(LimDigH-LimDigL);
FacRedDIGS=1;

% DIGQAM
[SDIG1S,SDIG1MS,SDIG1MI,SDIG1I,SDIG2S,SDIG2MS,SDIG2MI,SDIG2I,SDIG3S,SDIG3MS,SDIG3MI,SDIG3I,LDIG1S,LDIG1MS,LDIG1MI,LDIG1I,LDIG2S,LDIG2MS,LDIG2MI,LDIG2I,LDIG3S,LDIG3MS,LDIG3MI,LDIG3I] = Limits3(LimDigL,LimDigH,DistGig);
 
% Threshold Point for Upper Functions
BDIGSSNR = [SDIG1S,SDIG1MS,SDIG1MI,SDIG1I];
RDIGSSNR = [SDIG2S,SDIG2MS,SDIG2MI,SDIG2I];
MDIGSSNR = [SDIG3S,SDIG3MS,SDIG3MI,SDIG3I];
 
% Threshold Point for Lower Functions
BDIGLSNR = [LDIG1S,LDIG1MS,LDIG1MI,LDIG1I];
RDIGLSNR = [LDIG2S,LDIG2MS,LDIG2MI,LDIG2I];
MDIGLSNR = [LDIG3S,LDIG3MS,LDIG3MI,LDIG3I];
 
SBDIGQAM = FacRedDIGS*trapmf(x,BDIGSSNR);
SIDIGQAM = FacRedDIGS*trapmf(x,RDIGSSNR);
SMDIGQAM = FacRedDIGS*trapmf (x,MDIGSSNR);
 
LBDIGQAM = FacRedDIGL*trapmf(x,BDIGLSNR);
LIDIGQAM = FacRedDIGL*trapmf(x,RDIGLSNR);
LMDIGQAM = FacRedDIGL*trapmf(x,MDIGLSNR);


%%{
figure
plot (x,SBDIGQAM,'k');
axis([0 sup_lim 0 1.5])
hold on;
plot (x,SIDIGQAM,'k');
%hold on;
plot (x,SMDIGQAM,'k');
hold on;
plot (x,LBDIGQAM,'k--');
hold on;
plot (x,LIDIGQAM,'k--');
hold on;
plot (x,LMDIGQAM,'k--');
%title('Membership Function Digital Amplitude')
xlabel('x')
ylabel('f(x)')
legend('UMF',"","",'LMF',"","")
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