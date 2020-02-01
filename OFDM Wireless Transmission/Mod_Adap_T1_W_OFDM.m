%Variables to test the system;
x = 0:0.001:0.99;

ModAct =  3;% Actual Modulation (Input to the system)  0 - QPSK; 1 - 16QAM; 2 - 64QAM; 3- 256QAM 
Dig_Gain = 0.8;% Digital Gain given by the transmitter
SNR = 45; %SNR Measured

StdvQ=0.0375;
Stdv16=0.0255;
Stdv64=0.0375;
Stdv256=0.05;


% Output Memebership functions and Input for Digital Gain

LimDigL= 0.7;  % The boundary for bad in Digital Gain
LimDigH= 0.9; % The boundary for good in Digital Gain
DistGig = (LimDigH-LimDigL)/10;

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

tic;

% QPSK
[Q1S,Q1MS,Q1MI,Q1I,Q3S,Q3MS,Q3MI,Q3I] = Limits2(LimQ,DistCentQ);

MQSNR = [Q1S,Q1MS,Q1MI,Q1I];
BQSNR = [Q3S,Q3MS,Q3MI,Q3I];


%16QAM

[M161S,M161MS,M161MI,M161I,M162S,M162MS,M162MI,M162I,M163S,M163MS,M163MI,M163I] = Limits3(Lim116,Lim216,DistCent16);

MM16SNR = [M161S,M161MS,M161MI,M161I];
RM16SNR = [M162S,M162MS,M162MI,M162I];
BM16SNR = [M163S,M163MS,M163MI,M163I];

% 64QAM

[M641S,M641MS,M641MI,M641I,M642S,M642MS,M642MI,M642I,M643S,M643MS,M643MI,M643I] = Limits3(Lim164, Lim264,DistCent64);
 
MM64SNR = [M641S,M641MS,M641MI,M641I];
RM64SNR = [M642S,M642MS,M642MI,M642I];
BM64SNR = [M643S,M643MS,M643MI,M643I];


% 256QAM

[M2561S,M2561MS,M2561MI,M2561I,M2563S,M2563MS,M2563MI,M2563I] = Limits2(Lim256, DistCent256);
 
MM256SNR = [M2561S,M2561MS,M2561MI,M2561I];
BM256SNR = [M2563S,M2563MS,M2563MI,M2563I];

%Digital Gain P0ints
[MDIG1S,MDIG1MS,MDIG1MI,MDIG1I,MDIG2S,MDIG2MS,MDIG2MI,MDIG2I,MDIG3S,MDIG3MS,MDIG3MI,MDIG3I] = Limits3(LimDigL,LimDigH,DistGig);
 
MMDIG = [MDIG1S,MDIG1MS,MDIG1MI,MDIG1I];
RMDIG = [MDIG2S,MDIG2MS,MDIG2MI,MDIG2I];
BMDIG = [MDIG3S,MDIG3MS,MDIG3MI,MDIG3I];

% Output functions are calculated
[y11,y12,y13,y14,y21,y22,y23] = Output_Functions(x,MMDIG,RMDIG,BMDIG);

% Then the inputs are normalized and fuzzified:
 [u11,u12,u13,u21,u22,u23,u24,u31,u32,u33] = Fuzzy(SNR,ModAct,Dig_Gain,BQSNR,MQSNR,BM16SNR,RM16SNR,MM16SNR,BM64SNR,RM64SNR,MM64SNR,BM256SNR,MM256SNR,MMDIG,RMDIG,BMDIG);
 
 %The antecedents of the rules are calculated:
[Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10, Ar11, Ar12, ...
    Ar13, Ar14, Ar15, Ar16, Ar17, Ar18, Ar19, Ar20, Ar21, Ar22, Ar23, Ar24,...
    Ar25, Ar26, Ar27, Ar28, Ar29, Ar30]=Antecedents(u11,u12,u13,u21,u22,u23,u24,u31,u32,u33);

% The mandami implication is calculated:
[r101, r102, r103, r104, r105, r106, r107, r108, r109, r110,...
    r111, r112, r113, r114, r115, r116, r117, r118, r119, r120,r121, r122,...
    r123, r124, r125, r126, r127, r128, r129, r130,r201, r202, r203, r204,...
    r205, r206, r207, r208, r209, r210, r211, r212, r213, r214, r215, r216,...
    r217, r218, r219, r220,r221, r222, r223, r224, r225, r226, r227, r228,...
    r229, r230] = Mandami(Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, ...
    Ar10, Ar11, Ar12, Ar13, Ar14, Ar15, Ar16, Ar17, Ar18, Ar19, Ar20,...
    Ar21, Ar22, Ar23, Ar24, Ar25, Ar26, Ar27, Ar28, Ar29, Ar30, x, y11,...
    y12, y13, y14, y21, y22, y23);

%The maximum value of the implications are calculated:
[out1, out2] = Maximo(r101, r102, r103, r104, r105, r106, r107, r108, r109,...
    r110, r111, r112, r113, r114, r115, r116, r117, r118, r119, r120,r121, r122,...
    r123, r124, r125, r126, r127, r128, r129, r130,r201, r202, r203, r204,...
    r205, r206, r207, r208, r209, r210, r211, r212, r213, r214, r215, r216,...
    r217, r218, r219, r220,r221, r222, r223, r224, r225, r226, r227, r228,...
    r229, r230);

%figure
%{
ax1=subplot(2,1,1);
plot(x,out1,"k");
axis([0 1 0 1])
%title('Output Function T1')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('New Modulation - Output Membership Function')

ax2=subplot(2,1,2);
plot(x,out2,"k");
axis([0 1 0 1])
%title('Output Function T1')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('New Gain - Output Membership Function')
%}

% The output is defuzzified by the centroid method:
[outnm] = Defuzzy(out1, x);
[outnDG] = Defuzzy(out2, x);
toc;

pler = toc;

% Output definitions


[New_Mod, NDG]= Out_Final(outnm,outnDG);
display(New_Mod);
display(NDG);

function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I] = Limits2(Lim,DistCent)

% Values are estimated for  the trapezoidal functions 
% according to the distance between the boundaries

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
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I] = ...
    Limits3(LimI, LimS,DistCent)

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
function [u11,u12,u13,u21,u22,u23,u24,u31,u32,u33] = Fuzzy(SNR,ModAct,...
    Dig_Gain,BQSNR,MQSNR,BM16SNR,RM16SNR,MM16SNR,BM64SNR,RM64SNR,MM64SNR,...
    BM256SNR,MM256SNR,MMDIG,RMDIG,BMDIG)
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
        u11 = trapmf (x1,MQSNR);
        u12 = 0;
        u13 = trapmf(x1,BQSNR);
        u21 = 1;%Since there are no two simoultaneous modulations, only one point is seleceted
        u22 = 0;
        u23 = 0;
        u24 = 0;



    elseif ModAct == 1
        u11 = trapmf (x1,MM16SNR);
        u12 = trapmf (x1,RM16SNR);
        u13 = trapmf(x1,BM16SNR);
        u21 = 0;
        u22 = 1;%Since there are no two simoultaneous modulations, only one point is seleceted
        u23 = 0;
        u24 = 0;

    elseif ModAct ==2
        u11 = trapmf (x1,MM64SNR);
        u12 = trapmf (x1,RM64SNR);
        u13 = trapmf(x1,BM64SNR);
        u21 = 0;
        u22 = 0;
        u23 = 1;%Since there are no two simoultaneous modulations, only one point is seleceted
        u24 = 0;

    else
        u11 = trapmf (x1,MM256SNR);
        u12 = 0;
        u13 = trapmf(x1,BM256SNR);
        u21 = 0;
        u22 = 0;
        u23 = 0;
        u24 = 1;%Since there are no two simoultaneous modulations, only one point is seleceted

    end

%u31 = Low Digital Gain
%u32 = Medium Digital Gain
%u33 = High Digital Gain

u31 = trapmf(Dig_Gain,MMDIG);
u32 = trapmf(Dig_Gain,RMDIG);
u33 = trapmf(Dig_Gain,BMDIG);   

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
