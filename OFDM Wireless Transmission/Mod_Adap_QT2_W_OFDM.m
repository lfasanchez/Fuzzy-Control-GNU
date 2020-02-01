%Variables to test the system;
x = 0:0.001:0.99;

ModAct =  2;% Actual Modulation (Input to the system)  0 - QPSK; 1 - 16QAM; 2 - 64QAM; 3- 256QAM 
Dig_Gain = 0.8;% Digital Gain given by the transmitter
SNR = 45; %SNR Measured

SNRQ=0.0375;
SNR16=0.0255;
SNR64=0.0375;
SNR256=0.05;

% Boundaries are defined first
LimQ= 0.15;  % The boundary between good and bad for QPSK 
Lim116= LimQ;  % The boundary for bad in 16QAM
Lim216= 0.25; % The boundary for good in 16QAM
Lim164= Lim216;  % The boundary for bad in 64QAM
Lim264= 0.4; % The boundary for good in 64QAM
Lim256= Lim264;% The boundary between good and bad for 256QAM 

% Distances of the membership sets are established
DistCentQ=SNRQ;
DistCent16=SNR16;
DistCent64=SNR64;
DistCent256=SNR256;

% Then the reduction factors are calculated:
FacRedQL=1-SNRQ*5; %multplied by 5 to generate a certain degree of uncertainty
FacRedQT=1-SNRQ*2.5;
FacRedQS=1;
FacRed16L=1-SNR16*5;
FacRed16T=1-SNR16*2.5;
FacRed16S=1;
FacRed64L=1-SNR64*5;
FacRed64T=1-SNR64*2.5;
FacRed64S=1;
FacRed256L=1-SNR256*5;
FacRed256T=1-SNR256*2.5;
FacRed256S=1;

% Input for Digital Gain

% Boundaries are defined first
LimDigL= 0.7;  % The boundary for bad in Dig Gain
LimDigH= 0.9; % The boundary for good in Dig Gain
DistGig= (LimDigH-LimDigL)/10;
FacRedDIGL=1-(LimDigH-LimDigL);
FacRedDIGT=1-(LimDigH-LimDigL)/2;
FacRedDIGS=1;

% Output Memebership functions and Input for Digital Gain

LimDigLOut= 0.7;  % The boundary for bad in Dig Gain
LimDigHOut= 0.9; % The boundary for good in Dig Gain
DistGigOut= (LimDigHOut-LimDigLOut)/10;

tic;
%The boundries for the different UMF and LMF functions are calculated:
% QPSK
[SQ1S,SQ1MS,SQ1MI,SQ1I,SQ2S,SQ2MS,SQ2MI,SQ2I,LQ1S,LQ1MS,LQ1MI,LQ1I,LQ2S,LQ2MS,LQ2MI,LQ2I,TQ1S,TQ1MS,TQ1MI,TQ1I,TQ2S,TQ2MS,TQ2MI,TQ2I] = Limits2(LimQ,DistCentQ);

MQSSNR = [SQ1S,SQ1MS,SQ1MI,SQ1I];
BQSSNR = [SQ2S,SQ2MS,SQ2MI,SQ2I];

MQLSNR = [LQ1S,LQ1MS,LQ1MI,LQ1I];
BQLSNR = [LQ2S,LQ2MS,LQ2MI,LQ2I];

MQTSNR = [TQ1S,TQ1MS,TQ1MI,TQ1I];
BQTSNR = [TQ2S,TQ2MS,TQ2MI,TQ2I];

%16QAM
[S161S,S161MS,S161MI,S161I,S162S,S162MS,S162MI,S162I,S163S,S163MS,S163MI,S163I,L161S,L161MS,L161MI,L161I,L162S,L162MS,L162MI,L162I,L163S,L163MS,L163MI,L163I, T161S,T161MS,T161MI,T161I,T162S,T162MS,T162MI,T162I,T163S,T163MS,T163MI,T163I] = Limits3(Lim116, Lim216,DistCent16);

M16SSNR = [S161S,S161MS,S161MI,S161I];
R16SSNR = [S162S,S162MS,S162MI,S162I];
B16SSNR = [S163S,S163MS,S163MI,S163I];
 
M16LSNR = [L161S,L161MS,L161MI,L161I];
R16LSNR = [L162S,L162MS,L162MI,L162I];
B16LSNR = [L163S,L163MS,L163MI,L163I];

M16TSNR = [T161S,T161MS,T161MI,T161I];
R16TSNR = [T162S,T162MS,T162MI,T162I];
B16TSNR = [T163S,T163MS,T163MI,T163I];

%64QAM
[S641S,S641MS,S641MI,S641I,S642S,S642MS,S642MI,S642I,S643S,S643MS,S643MI,S643I,L641S,L641MS,L641MI,L641I,L642S,L642MS,L642MI,L642I,L643S,L643MS,L643MI,L643I, T641S,T641MS,T641MI,T641I,T642S,T642MS,T642MI,T642I,T643S,T643MS,T643MI,T643I] = Limits3(Lim164, Lim264,DistCent64);
 
M64SSNR = [S641S,S641MS,S641MI,S641I];
R64SSNR = [S642S,S642MS,S642MI,S642I];
B64SSNR = [S643S,S643MS,S643MI,S643I];
 
M64LSNR = [L641S,L641MS,L641MI,L641I];
R64LSNR = [L642S,L642MS,L642MI,L642I];
B64LSNR = [L643S,L643MS,L643MI,L643I];
 
M64TSNR = [T641S,T641MS,T641MI,T641I];
R64TSNR = [T642S,T642MS,T642MI,T642I];
B64TSNR = [T643S,T643MS,T643MI,T643I];
 
%256QAM
[S2561S,S2561MS,S2561MI,S2561I,S2562S,S2562MS,S2562MI,S2562I,L2561S,L2561MS,L2561MI,L2561I,L2562S,L2562MS,L2562MI,L2562I,T2561S,T2561MS,T2561MI,T2561I,T2562S,T2562MS,T2562MI,T2562I] = Limits2(Lim256,DistCent256);
 
M256SSNR = [S2561S,S2561MS,S2561MI,S2561I];
B256SSNR = [S2562S,S2562MS,S2562MI,S2562I];
 
M256LSNR = [L2561S,L2561MS,L2561MI,L2561I];
B256LSNR = [L2562S,L2562MS,L2562MI,L2562I];
 
M256TSNR = [T2561S,T2561MS,T2561MI,T2561I];
B256TSNR = [T2562S,T2562MS,T2562MI,T2562I];

% DIG GAIN
[SDIG1S,SDIG1MS,SDIG1MI,SDIG1I,SDIG2S,SDIG2MS,SDIG2MI,SDIG2I,SDIG3S,SDIG3MS,SDIG3MI,SDIG3I,LDIG1S,LDIG1MS,LDIG1MI,LDIG1I,LDIG2S,LDIG2MS,LDIG2MI,LDIG2I,LDIG3S,LDIG3MS,LDIG3MI,LDIG3I, TDIG1S,TDIG1MS,TDIG1MI,TDIG1I,TDIG2S,TDIG2MS,TDIG2MI,TDIG2I,TDIG3S,TDIG3MS,TDIG3MI,TDIG3I] = Limits3(LimDigL,LimDigH,DistGig);
 
MDIGSSNR = [SDIG1S,SDIG1MS,SDIG1MI,SDIG1I];
RDIGSSNR = [SDIG2S,SDIG2MS,SDIG2MI,SDIG2I];
BDIGSSNR = [SDIG3S,SDIG3MS,SDIG3MI,SDIG3I];
 
MDIGLSNR = [LDIG1S,LDIG1MS,LDIG1MI,LDIG1I];
RDIGLSNR = [LDIG2S,LDIG2MS,LDIG2MI,LDIG2I];
BDIGLSNR = [LDIG3S,LDIG3MS,LDIG3MI,LDIG3I];
 
MDIGTSNR = [TDIG1S,TDIG1MS,TDIG1MI,TDIG1I];
RDIGTSNR = [TDIG2S,TDIG2MS,TDIG2MI,TDIG2I];
BDIGTSNR = [TDIG3S,TDIG3MS,TDIG3MI,TDIG3I];

%Digital Gain Output Points
[MDIG1S,MDIG1MS,MDIG1MI,MDIG1I,MDIG2S,MDIG2MS,MDIG2MI,MDIG2I,MDIG3S,MDIG3MS,MDIG3MI,MDIG3I] = Limits3Out(LimDigLOut,LimDigHOut,DistGigOut);
 
MMDIGOut = [MDIG1S,MDIG1MS,MDIG1MI,MDIG1I];
RMDIGOut = [MDIG2S,MDIG2MS,MDIG2MI,MDIG2I];
BMDIGOut = [MDIG3S,MDIG3MS,MDIG3MI,MDIG3I];

% Output functions are calculated
[y11,y12,y13,y14,y21,y22,y23] = Output_Functions(x,MMDIGOut,RMDIGOut,BMDIGOut);

% The input variables are normalized and fuzzified for the UMF, LMF and the T1 MF:
[us11,us12,us13,us21,us22,us23,us24,us31,us32,us33] = Fuzzy(FacRedQS,...
    FacRed16S,FacRed64S,FacRed256S, FacRedDIGS,SNR,ModAct,Dig_Gain,...
    BQSSNR,MQSSNR,B16SSNR,R16SSNR,M16SSNR,B64SSNR,R64SSNR,M64SSNR,B256SSNR,...
    M256SSNR,MDIGSSNR,RDIGSSNR,BDIGSSNR);
[ul11,ul12,ul13,ul21,ul22,ul23,ul24,ul31,ul32,ul33] = Fuzzy(FacRedQL,...
    FacRed16L,FacRed64L,FacRed256L, FacRedDIGL,SNR,ModAct,Dig_Gain,...
    BQLSNR,MQLSNR,B16LSNR,R16LSNR,M16LSNR,B64LSNR,R64LSNR,M64LSNR,B256LSNR,...
    M256LSNR,MDIGLSNR,RDIGLSNR,BDIGLSNR);
[ut11,ut12,ut13,ut21,ut22,ut23,ut24,ut31,ut32,ut33] = Fuzzy(FacRedQT,...
    FacRed16T,FacRed64T,FacRed256T, FacRedDIGT,SNR,ModAct,Dig_Gain,...
    BQTSNR,MQTSNR,B16TSNR,R16TSNR,M16TSNR,B64TSNR,R64TSNR,M64TSNR,B256TSNR,...
    M256TSNR,MDIGTSNR,RDIGTSNR,BDIGTSNR);

%The antecedents of the rules are calculated:
[Ars1, Ars2, Ars3, Ars4, Ars5, Ars6, Ars7, Ars8, Ars9, Ars10, Ars11, Ars12, ...
    Ars13, Ars14, Ars15, Ars16, Ars17, Ars18, Ars19, Ars20, Ars21, Ars22, Ars23, Ars24,...
    Ars25, Ars26, Ars27, Ars28, Ars29, Ars30]=Antecedents(us11,us12,us13,us21,us22,us23,us24,us31,us32,us33);

[Arl1, Arl2, Arl3, Arl4, Arl5, Arl6, Arl7, Arl8, Arl9, Arl10, Arl11, Arl12, ...
    Arl13, Arl14, Arl15, Arl16, Arl17, Arl18, Arl19, Arl20, Arl21, Arl22, Arl23, Arl24,...
    Arl25, Arl26, Arl27, Arl28, Arl29, Arl30]=Antecedents(ul11,ul12,ul13,ul21,ul22,ul23,ul24,ul31,ul32,ul33);

[Art1, Art2, Art3, Art4, Art5, Art6, Art7, Art8, Art9, Art10, Art11, Art12, ...
    Art13, Art14, Art15, Art16, Art17, Art18, Art19, Art20, Art21, Art22, Art23, Art24,...
    Art25, Art26, Art27, Art28, Art29, Art30]=Antecedents(ut11,ut12,ut13,ut21,ut22,ut23,ut24,ut31,ut32,ut33);

% The mandami implication is calculated:
[rs101, rs102, rs103, rs104, rs105, rs106, rs107, rs108, rs109, rs110,...
    rs111, rs112, rs113, rs114, rs115, rs116, rs117, rs118, rs119, rs120,rs121, rs122,...
    rs123, rs124, rs125, rs126, rs127, rs128, rs129, rs130,rs201, rs202, rs203, rs204,...
    rs205, rs206, rs207, rs208, rs209, rs210, rs211, rs212, rs213, rs214, rs215, rs216,...
    rs217, rs218, rs219, rs220,rs221, rs222, rs223, rs224, rs225, rs226, rs227, rs228,...
    rs229, rs230] = Mandami(Ars1, Ars2, Ars3, Ars4, Ars5, Ars6, Ars7, Ars8, Ars9, ...
    Ars10, Ars11, Ars12, Ars13, Ars14, Ars15, Ars16, Ars17, Ars18, Ars19, Ars20,...
    Ars21, Ars22, Ars23, Ars24, Ars25, Ars26, Ars27, Ars28, Ars29, Ars30, x, y11,...
    y12, y13, y14, y21, y22, y23);

[rl101, rl102, rl103, rl104, rl105, rl106, rl107, rl108, rl109, rl110,...
    rl111, rl112, rl113, rl114, rl115, rl116, rl117, rl118, rl119, rl120,rl121, rl122,...
    rl123, rl124, rl125, rl126, rl127, rl128, rl129, rl130,rl201, rl202, rl203, rl204,...
    rl205, rl206, rl207, rl208, rl209, rl210, rl211, rl212, rl213, rl214, rl215, rl216,...
    rl217, rl218, rl219, rl220,rl221, rl222, rl223, rl224, rl225, rl226, rl227, rl228,...
    rl229, rl230] = Mandami(Arl1, Arl2, Arl3, Arl4, Arl5, Arl6, Arl7, Arl8, Arl9, ...
    Arl10, Arl11, Arl12, Arl13, Arl14, Arl15, Arl16, Arl17, Arl18, Arl19, Arl20,...
    Arl21, Arl22, Arl23, Arl24, Arl25, Arl26, Arl27, Arl28, Arl29, Arl30, x, y11,...
    y12, y13, y14, y21, y22, y23);

[rt101, rt102, rt103, rt104, rt105, rt106, rt107, rt108, rt109, rt110,...
    rt111, rt112, rt113, rt114, rt115, rt116, rt117, rt118, rt119, rt120,rt121, rt122,...
    rt123, rt124, rt125, rt126, rt127, rt128, rt129, rt130,rt201, rt202, rt203, rt204,...
    rt205, rt206, rt207, rt208, rt209, rt210, rt211, rt212, rt213, rt214, rt215, rt216,...
    rt217, rt218, rt219, rt220,rt221, rt222, rt223, rt224, rt225, rt226, rt227, rt228,...
    rt229, rt230] = Mandami(Art1, Art2, Art3, Art4, Art5, Art6, Art7, Art8, Art9, ...
    Art10, Art11, Art12, Art13, Art14, Art15, Art16, Art17, Art18, Art19, Art20,...
    Art21, Art22, Art23, Art24, Art25, Art26, Art27, Art28, Art29, Art30, x, y11,...
    y12, y13, y14, y21, y22, y23);

%The maximum value of the implications are calculated for all the MFs:
[outs1, outs2] = Maximo(rs101, rs102, rs103, rs104, rs105, rs106, rs107, rs108, rs109,...
    rs110, rs111, rs112, rs113, rs114, rs115, rs116, rs117, rs118, rs119, rs120,rs121, rs122,...
    rs123, rs124, rs125, rs126, rs127, rs128, rs129, rs130,rs201, rs202, rs203, rs204,...
    rs205, rs206, rs207, rs208, rs209, rs210, rs211, rs212, rs213, rs214, rs215, rs216,...
    rs217, rs218, rs219, rs220,rs221, rs222, rs223, rs224, rs225, rs226, rs227, rs228,...
    rs229, rs230);
[outl1, outl2] = Maximo(rl101, rl102, rl103, rl104, rl105, rl106, rl107, rl108, rl109,...
    rl110, rl111, rl112, rl113, rl114, rl115, rl116, rl117, rl118, rl119, rl120,rl121, rl122,...
    rl123, rl124, rl125, rl126, rl127, rl128, rl129, rl130,rl201, rl202, rl203, rl204,...
    rl205, rl206, rl207, rl208, rl209, rl210, rl211, rl212, rl213, rl214, rl215, rl216,...
    rl217, rl218, rl219, rl220,rl221, rl222, rl223, rl224, rl225, rl226, rl227, rl228,...
    rl229, rl230);
[outt1, outt2] = Maximo(rt101, rt102, rt103, rt104, rt105, rt106, rt107, rt108, rt109,...
    rt110, rt111, rt112, rt113, rt114, rt115, rt116, rt117, rt118, rt119, rt120,rt121, rt122,...
    rt123, rt124, rt125, rt126, rt127, rt128, rt129, rt130,rt201, rt202, rt203, rt204,...
    rt205, rt206, rt207, rt208, rt209, rt210, rt211, rt212, rt213, rt214, rt215, rt216,...
    rt217, rt218, rt219, rt220,rt221, rt222, rt223, rt224, rt225, rt226, rt227, rt228,...
    rt229, rt230);

%{
ax1=subplot(2,1,1);
plot(x,outs1,"k");
hold on
plot(x,outt1,"k--");
hold on
plot(x,outl1,"k:");
axis([0 1 0 1])
%title('Output Function T1')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('New Modulation - Output UMF','New Modulation - Output T1-MF','New Modulation - Output LMF' )

ax2=subplot(2,1,2);
plot(x,outs2,"k");
hold on
plot(x,outt2,"k--");
hold on
plot(x,outl2,"k:");
axis([0 1 0 1])
%title('Output Function T1')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('New Gain - Output UMF','New Gain - Output T1-MF','New Gain - Output LMF' )
%}

% The type 1 MF output set is defuzzified by centroid:
% The output is defuzzified by the centroid method:
[outnmT] = Defuzzy(outt1, x);
[outnDGT] = Defuzzy(outt2, x);

% The  EIASC method is used for defuzzification of the UMF and LMF :
[outnmTl, outnmTr] = EIASC(outs1, outl1, x, 1);
[outNDGl, outNDGr] = EIASC(outs2, outl2, x, 1);

%The final output from the EIASC and centroid processing is then evaluated
%by triangulation:

outnm = (outnmT+outnmTl+outnmTr)/3;
outnDG = (outnDGT+outNDGl+outNDGr)/3;
toc
pler = toc;

% Output definitions
% New modulation
[New_Mod, NDG]= Out_Final(outnm,outnDG);
display(New_Mod);
display(NDG);


function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,L1S,L1MS,L1MI,L1I,L2S,L2MS,...
    L2MI,L2I,T1S,T1MS,T1MI,T1I,T2S,T2MS,T2MI,T2I] = Limits2(Lim,DistCent)

% Values are estimated for  the trapezoidal functions 
% according to the distance between the boundaries

x1=Lim;
y1=DistCent;
DistT1 = DistCent/2;

S1S = 0;
S1MS = 0;
S1MI = Lim-y1;
S1I = Lim+y1;


S2S = Lim-y1;
S2MS = Lim;
S2MI = 10;
S2I = 10;

L1S = 0;
L1MS = 0;
L1MI = Lim-y1-DistCent;
L1I = Lim+y1-DistCent;

L2S = Lim-y1+DistCent;
L2MS = Lim+DistCent;
L2MI = 10;
L2I = 10;

T1S = 0;
T1MS = 0;
T1MI = Lim-y1-DistT1;
T1I = Lim+y1-DistT1;
 
 
T2S = Lim-y1+DistT1;
T2MS = Lim+DistT1;
T2MI = 1;
T2I = 1;

end
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I,L1S,L1MS,...
    L1MI,L1I,L2S,L2MS,L2MI,L2I,L3S,L3MS,L3MI,L3I,T1S,T1MS,T1MI,T1I,T2S,...
    T2MS,T2MI,T2I,T3S,T3MS,T3MI,T3I] = Limits3(LimI, LimS,DistCent)

% Values are estimated for  the trapezoidal functions 
% according to the distance between the boundaries

x1=LimS-LimI;
y1=DistCent;
DistT1 = DistCent/2;

S1S = 0;
S1MS = 0;
S1MI = LimI-y1;
S1I = LimI+y1;

S2S = LimI-y1;
S2MS = LimI;
S2MI = LimS-y1;
S2I = LimS+y1;

S3S = LimS-y1;
S3MS = LimS;
S3MI = 10;
S3I = 10;

L1S = 0;
L1MS = 0;
L1MI = LimI-y1-DistCent;
L1I = LimI+y1-DistCent;
 
L2S = LimI;
L2MS = LimI+DistCent;
L2MI = LimS-y1-DistCent;
L2I = LimS-y1+DistCent;
 
L3S = LimS-y1+DistCent;
L3MS = LimS+DistCent;
L3MI = 1;
L3I = 1;

T1S = 0;
T1MS = 0;
T1MI = LimI-y1-DistT1;
T1I = LimI+y1-DistT1;
 
T2S = LimI-y1+DistT1;
T2MS = LimI+DistT1;
T2MI = LimS-y1-DistT1;
T2I = LimS-y1+DistCent+DistT1;  %same points for starting and end
 
T3S = LimS-y1+DistT1;
T3MS = LimS+DistT1;
T3MI = 1;
T3I = 1;

end
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I] = ...
    Limits3Out(LimI, LimS,DistCent)

% Values are estimated for  the trapezoidal functions 
% according to the distance between the boundaries

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
function [y11,y12,y13,y14,y21,y22,y23] = Output_Functions(x,MMDIG,RMDIG,BMDIG)

y5c1= 0.125; % QPSK
y5c2= 0.375; % 16QAM
y5c3= 0.625; % 64QAM
y5c4= 0.875; % 256QAM
stdy5 = (y5c2 - y5c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YG1= [0 0 y5c1 y5c1+stdy5]; %  Trapezoidal for having the whole spectrum covered
YG2 = [y5c2-stdy5 y5c2 y5c2+stdy5]; % Triangular
YG3 = [y5c3-stdy5 y5c3 y5c3+stdy5]; % Triangular
YG4 = [y5c4-stdy5 y5c4 10 10]; %  Trapezoidal for having the whole spectrum covered

y11 = trapmf(x,YG1);
y12 = trimf(x,YG2);
y13 = trimf(x,YG3);
y14= trapmf(x,YG4);

y21 = trapmf(x,MMDIG);
y22 = trapmf(x,RMDIG);
y23 = trapmf(x,BMDIG);

end

function [u11,u12,u13,u21,u22,u23,u24,u31,u32,u33] = Fuzzy(FacRedQ,FacRed16,...
    FacRed64,FacRed256,FacRedDIG,SNR,ModAct,Dig_Gain,BQSNR,MQSNR,BM16SNR,RM16SNR,...
    MM16SNR,BM64SNR,RM64SNR,MM64SNR,BM256SNR,MM256SNR,MMDIG,RMDIG,BMDIG)
%First the membership functions are obtained for each  input
%u11 = Bad SNR
%u12 = Average SNR
%u13 = Good SNR
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM
%u31 = Low Digital Gain
%u32 = Medium Digital Gain
%u33 = High Digital Gain

x1=SNR/100;
   
    if ModAct == 0
        FacRed = FacRedQ;
        u11 = FacRed*trapmf (x1,MQSNR);
        u12 = 0;
        u13 = FacRed*trapmf(x1,BQSNR);
        u21 = FacRed;%Since there are no two simoultaneous modulations, only one point is seleceted
        u22 = 0;
        u23 = 0;
        u24 = 0;



    elseif ModAct == 1
        FacRed = FacRed16;
        u11 = FacRed*trapmf (x1,MM16SNR);
        u12 = FacRed*trapmf (x1,RM16SNR);
        u13 = FacRed*trapmf(x1,BM16SNR);
        u21 = 0;
        u22 = FacRed;%Since there are no two simoultaneous modulations, only one point is seleceted
        u23 = 0;
        u24 = 0;

    elseif ModAct ==2
        FacRed = FacRed64;
        u11 = FacRed*trapmf (x1,MM64SNR);
        u12 = FacRed*trapmf (x1,RM64SNR);
        u13 = FacRed*trapmf(x1,BM64SNR);
        u21 = 0;
        u22 = 0;
        u23 = FacRed;%Since there are no two simoultaneous modulations, only one point is seleceted
        u24 = 0;

    else
        FacRed = FacRed256;
        u11 = FacRed*trapmf (x1,MM256SNR);
        u12 = 0;
        u13 = FacRed*trapmf(x1,BM256SNR);
        u21 = 0;
        u22 = 0;
        u23 = 0;
        u24 = FacRed;%Since there are no two simoultaneous modulations, only one point is seleceted

    end

%u31 = Low Digital Gain
%u32 = Medium Digital Gain
%u33 = High Digital Gain

u31 = FacRedDIG*trapmf(Dig_Gain,MMDIG);
u32 = FacRedDIG*trapmf(Dig_Gain,RMDIG);
u33 = FacRedDIG*trapmf(Dig_Gain,BMDIG);   

end

function [Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10, Ar11, Ar12, ...
    Ar13, Ar14, Ar15, Ar16, Ar17, Ar18, Ar19, Ar20, Ar21, Ar22, Ar23, Ar24,...
    Ar25, Ar26, Ar27, Ar28, Ar29, Ar30] = Antecedents(u11,u12,u13,u21,u22,...
    u23,u24,u31,u32,u33)
%u11 = Bad SNR
%u12 = Average SNR
%u13 = Good SNR
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM
%u31 = Low Digital Gain
%u32 = Medium Digital Gain
%u33 = High Digital Gain

% Rules with 256-QAM
A1 = [u13 u24 u33];
Ar1 = min(A1);
A2 = [u13 u24 u32];
Ar2 = min(A2);
A3 = [u13 u24 u31];
Ar3 = min(A3);
A4 = [u11 u24 u33];
Ar4 = min(A4);
A5 = [u11 u24 u32];
Ar5 = min(A5);
A6 = [u11 u24 u31];
Ar6 = min(A6);

% Rules with 64-QAM
A7 = [u13 u23 u33];
Ar7 = min(A7);
A8 = [u13 u23 u32];
Ar8 = min(A8);
A9 = [u13 u23 u31];
Ar9 = min(A9);
A10 = [u12 u23 u33];
Ar10 = min(A10);
A11 = [u12 u23 u32];
Ar11 = min(A11);
A12 = [u12 u23 u31];
Ar12 = min(A12);
A13 = [u11 u23 u33];
Ar13 = min(A13);
A14 = [u11 u23 u32];
Ar14 = min(A14);
A15 = [u11 u23 u31];
Ar15 = min(A15);

% Rules with 16-QAM
A16 = [u13 u22 u33];
Ar16 = min(A16);
A17 = [u13 u22 u32];
Ar17 = min(A17);
A18 = [u13 u22 u31];
Ar18 = min(A18);
A19 = [u12 u22 u33];
Ar19 = min(A19);
A20 = [u12 u22 u32];
Ar20 = min(A20);
A21 = [u12 u22 u31];
Ar21 = min(A21);
A22 = [u11 u22 u33];
Ar22 = min(A22);
A23 = [u11 u22 u32];
Ar23 = min(A23);
A24 = [u11 u22 u31];
Ar24 = min(A24);

%Rules with QPSK
A25 = [u13 u21 u33];
Ar25 = min(A25);
A26 = [u13 u21 u32];
Ar26 = min(A26);
A27 = [u13 u21 u31];
Ar27 = min(A27);
A28 = [u11 u21 u33];
Ar28 = min(A28);
A29 = [u11 u21 u32];
Ar29 = min(A29);
A30 = [u11 u21 u31];
Ar30 = min(A30);

end
function [r101, r102, r103, r104, r105, r106, r107, r108, r109, r110,...
    r111, r112, r113, r114, r115, r116, r117, r118, r119, r120,r121, r122,...
    r123, r124, r125, r126, r127, r128, r129, r130,r201, r202, r203, r204,...
    r205, r206, r207, r208, r209, r210, r211, r212, r213, r214, r215, r216,...
    r217, r218, r219, r220,r221, r222, r223, r224, r225, r226, r227, r228,...
    r229, r230] = Mandami(Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, ...
    Ar10, Ar11, Ar12, Ar13, Ar14, Ar15, Ar16, Ar17, Ar18, Ar19, Ar20,...
    Ar21, Ar22, Ar23, Ar24, Ar25, Ar26, Ar27, Ar28, Ar29, Ar30, x, y11,...
    y12, y13, y14, y21, y22, y23)

    %vectors are created  to obtain the minimum of two vectors 
Ar=ones(1,length(x));
Ar_1= Ar *Ar1;
Ar_2= Ar *Ar2;
Ar_3= Ar *Ar3;
Ar_4= Ar *Ar4;
Ar_5= Ar *Ar5;
Ar_6= Ar *Ar6;
Ar_7= Ar *Ar7;
Ar_8= Ar *Ar8;
Ar_9= Ar *Ar9;
Ar_10= Ar *Ar10;
Ar_11= Ar *Ar11;
Ar_12= Ar *Ar12;
Ar_13= Ar *Ar13;
Ar_14= Ar *Ar14;
Ar_15= Ar *Ar15;
Ar_16= Ar *Ar16;
Ar_17= Ar *Ar17;
Ar_18= Ar *Ar18;
Ar_19= Ar *Ar19;
Ar_20= Ar *Ar20;
Ar_21= Ar *Ar21;
Ar_22= Ar *Ar22;
Ar_23= Ar *Ar23;
Ar_24= Ar *Ar24;
Ar_25= Ar *Ar25;
Ar_26= Ar *Ar26;
Ar_27= Ar *Ar27;
Ar_28= Ar *Ar28;
Ar_29= Ar *Ar29;
Ar_30= Ar *Ar30;

        % The minimum between each input rule value and the output function
        % is calculated according to the output rules.

%for new modulation
%y11 = QPSK; 
%y12 = 16QAM;
%y13 = 64QAM; 
%y14 = 256QAM;


r101=min(Ar_1,y14);
r102=min(Ar_2,y14);
r103=min(Ar_3,y14);
r104=min(Ar_4,y13);
r105=min(Ar_5,y14);
r106=min(Ar_6,y14);
r107=min(Ar_7,y13);
r108=min(Ar_8,y13);
r109=min(Ar_9,y14);
r110=min(Ar_10,y13);
r111=min(Ar_11,y13);
r112=min(Ar_12,y13);
r113=min(Ar_13,y12);
r114=min(Ar_14,y13);
r115=min(Ar_15,y13);
r116=min(Ar_16,y12);
r117=min(Ar_17,y12);
r118=min(Ar_18,y13);
r119=min(Ar_19,y12);
r120=min(Ar_20,y12);
r121=min(Ar_21,y12);
r122=min(Ar_22,y11);
r123=min(Ar_23,y12);
r124=min(Ar_24,y12);
r125=min(Ar_25,y11);
r126=min(Ar_26,y11);
r127=min(Ar_27,y12);
r128=min(Ar_28,y11);
r129=min(Ar_29,y11);
r130=min(Ar_30,y11);

%for new digital gain
%y21 = Low Digital Gain; 
%y22 = Average Digital Gain;
%y23 = High Digital Gain


r201=min(Ar_1,y22);
r202=min(Ar_2,y22);
r203=min(Ar_3,y21);
r204=min(Ar_4,y23);
r205=min(Ar_5,y23);
r206=min(Ar_6,y22);
r207=min(Ar_7,y22);
r208=min(Ar_8,y21);
r209=min(Ar_9,y22);
r210=min(Ar_10,y23);
r211=min(Ar_11,y23);
r212=min(Ar_12,y22);
r213=min(Ar_13,y23);
r214=min(Ar_14,y23);
r215=min(Ar_15,y22);
r216=min(Ar_16,y22);
r217=min(Ar_17,y21);
r218=min(Ar_18,y22);
r219=min(Ar_19,y23);
r220=min(Ar_20,y23);
r221=min(Ar_21,y22);
r222=min(Ar_22,y23);
r223=min(Ar_23,y23);
r224=min(Ar_24,y22);
r225=min(Ar_25,y22);
r226=min(Ar_26,y21);
r227=min(Ar_27,y22);
r228=min(Ar_28,y23);
r229=min(Ar_29,y23);
r230=min(Ar_30,y22);
 

end
function [out1, out2] = Maximo(r101, r102, r103, r104, r105, r106, r107,...
    r108, r109, r110, r111, r112, r113, r114, r115, r116, r117, r118,...
    r119, r120,r121, r122,...
    r123, r124, r125, r126, r127, r128, r129, r130,r201, r202, r203, r204,...
    r205, r206, r207, r208, r209, r210, r211, r212, r213, r214, r215, r216,...
    r217, r218, r219, r220,r221, r222, r223, r224, r225, r226, r227, r228,...
    r229, r230)

O1=[r101; r102; r103; r104; r105; r106; r107;...
    r108; r109; r110; r111; r112; r113; r114; r115; r116; r117; r118;...
    r119; r120;r121; r122;...
    r123; r124; r125; r126; r127; r128; r129; r130];

O2=[r201; r202; r203; r204; r205; r206; r207;...
    r208; r209; r210; r211; r212; r213; r214; r215; r216; r217; r218;...
    r219; r220;r221; r222;...
    r223; r224; r225; r226; r227; r228; r229; r230];

out1 = max(O1);
out2 = max(O2);
end
function [outnm] = Defuzzy (outp1, x)
outnm1 = x;
for i = 1:1:length(x)
       outnm1(1,i) = outp1(1,i)*x(1,i);
        i=i+1;
end

outnm=sum(outnm1)/sum(outp1);



end
function [yl,yr] = EIASC(Wr,Wl,X,needSort)

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
end

end
function [New_Mod, NDG]= Out_Final(outnm, outnDG)

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

%New Digital Gain
NDG=outnDG;

end