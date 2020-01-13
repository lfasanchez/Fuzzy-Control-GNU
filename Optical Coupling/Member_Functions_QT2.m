sup_lim=0.99;
x = 0:0.01:sup_lim;


StdvQ=0.0184;
Stdv16=0.0192;
Stdv64=0.016;
Stdv256=0.0187;

%Se define el factor de reducción de amplitud de la función de pertenencia
%inferior de IT2 FS
LimQ= 0.14;  % El limite de pertenencia de cada funcion - bueno y malo
DistCentQ=StdvQ;
FacRedL=1-10*DistCentQ;
FacRedS=1;
FacRedT1 = (FacRedS + FacRedL)/2;

[SQ1S,SQ1MS,SQ1MI,SQ1I,SQ2S,SQ2MS,SQ2MI,SQ2I,LQ1S,LQ1MS,LQ1MI,LQ1I,LQ2S,LQ2MS,LQ2MI,LQ2I,TQ1S,TQ1MS,TQ1MI,TQ1I,TQ2S,TQ2MS,TQ2MI,TQ2I] = Limits2(LimQ,DistCentQ);

BQSStdv = [SQ1S,SQ1MS,SQ1MI,SQ1I];
MQSStdv = [SQ2S,SQ2MS,SQ2MI,SQ2I];

BQLStdv = [LQ1S,LQ1MS,LQ1MI,LQ1I];
MQLStdv = [LQ2S,LQ2MS,LQ2MI,LQ2I];

BQTStdv = [TQ1S,TQ1MS,TQ1MI,TQ1I];
MQTStdv = [TQ2S,TQ2MS,TQ2MI,TQ2I];

uSQ11 = trapmf(x,BQSStdv);
uSQ12 = trapmf (x,MQSStdv);
uLQ11 = FacRedL*trapmf (x,BQLStdv);
uLQ12 = FacRedL*trapmf (x,MQLStdv);
uTQ11 = FacRedT1*trapmf (x,BQTStdv);
uTQ12 = FacRedT1*trapmf (x,MQTStdv);






Lim216= 0.14;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim116= 0.3716;
DistCent16=Stdv16;
FacRedL16=1-10*DistCent16;
FacRedS16=1;
FacRedT116 = (FacRedS16 + FacRedL16)/2;



[S161S,S161MS,S161MI,S161I,S162S,S162MS,S162MI,S162I,S163S,S163MS,S163MI,S163I,L161S,L161MS,L161MI,L161I,L162S,L162MS,L162MI,L162I,L163S,L163MS,L163MI,L163I, T161S,T161MS,T161MI,T161I,T162S,T162MS,T162MI,T162I,T163S,T163MS,T163MI,T163I] = Limits3(Lim216, Lim116,DistCent16);

B16SStdv = [S161S,S161MS,S161MI,S161I];
R16SStdv = [S162S,S162MS,S162MI,S162I];
M16SStdv = [S163S,S163MS,S163MI,S163I];
 
B16LStdv = [L161S,L161MS,L161MI,L161I];
R16LStdv = [L162S,L162MS,L162MI,L162I];
M16LStdv = [L163S,L163MS,L163MI,L163I];

B16TStdv = [T161S,T161MS,T161MI,T161I];
R16TStdv = [T162S,T162MS,T162MI,T162I];
M16TStdv = [T163S,T163MS,T163MI,T163I];

 
uS1611 = trapmf(x,B16SStdv);
uS1612 = trapmf (x,R16SStdv);
uS1613 = trapmf (x,M16SStdv);
uL1611 = FacRedL16*trapmf (x,B16LStdv);
uL1613 = FacRedL16*trapmf (x,M16LStdv);
uL1612 = FacRedL16*trapmf (x,R16LStdv);
uT1611 = FacRedT116*trapmf (x,B16TStdv);
uT1612 = FacRedT116*trapmf (x,R16TStdv);
uT1613 = FacRedT116*trapmf (x,M16TStdv);

%Luego las variables para el IT2 de 64QAM
Lim264= 0.3716;  % Los limites de pertenencia de cada funcion - bueno y malo
Lim164= 0.4827;
DistCent64=Stdv64;
FacRedL64=1-10*DistCent64;
FacRedS64=1;
FacRedT164 = (FacRedL64 + FacRedS64)/2;

[S641S,S641MS,S641MI,S641I,S642S,S642MS,S642MI,S642I,S643S,S643MS,S643MI,S643I,L641S,L641MS,L641MI,L641I,L642S,L642MS,L642MI,L642I,L643S,L643MS,L643MI,L643I, T641S,T641MS,T641MI,T641I,T642S,T642MS,T642MI,T642I,T643S,T643MS,T643MI,T643I] = Limits3(Lim264, Lim164,DistCent64);
 
B64SStdv = [S641S,S641MS,S641MI,S641I];
R64SStdv = [S642S,S642MS,S642MI,S642I];
M64SStdv = [S643S,S643MS,S643MI,S643I];
 
B64LStdv = [L641S,L641MS,L641MI,L641I];
R64LStdv = [L642S,L642MS,L642MI,L642I];
M64LStdv = [L643S,L643MS,L643MI,L643I];
 
B64TStdv = [T641S,T641MS,T641MI,T641I];
R64TStdv = [T642S,T642MS,T642MI,T642I];
M64TStdv = [T643S,T643MS,T643MI,T643I];
 
 
uS6411 = trapmf(x,B64SStdv);
uS6412 = trapmf (x,R64SStdv);
uS6413 = trapmf (x,M64SStdv);
uL6411 = FacRedL64*trapmf (x,B64LStdv);
uL6413 = FacRedL64*trapmf (x,M64LStdv);
uL6412 = FacRedL64*trapmf (x,R64LStdv);
uT6411 = FacRedT164*trapmf (x,B64TStdv);
uT6412 = FacRedT164*trapmf (x,R64TStdv);
uT6413 = FacRedT164*trapmf (x,M64TStdv);

%Por ultimo  las variables para el IT2 de 256
Lim256= 0.4827;  % El limite de pertenencia de cada funcion - bueno y malo
DistCent256=Stdv256;
FacRedL256=1-10*DistCent256;
FacRedS256=1;
FacRedT1256 = (FacRedL256 + FacRedS256)/2;

[S2561S,S2561MS,S2561MI,S2561I,S2562S,S2562MS,S2562MI,S2562I,L2561S,L2561MS,L2561MI,L2561I,L2562S,L2562MS,L2562MI,L2562I,T2561S,T2561MS,T2561MI,T2561I,T2562S,T2562MS,T2562MI,T2562I] = Limits2(Lim256,DistCent256);
 
B256SStdv = [S2561S,S2561MS,S2561MI,S2561I];
M256SStdv = [S2562S,S2562MS,S2562MI,S2562I];
 
B256LStdv = [L2561S,L2561MS,L2561MI,L2561I];
M256LStdv = [L2562S,L2562MS,L2562MI,L2562I];
 
B256TStdv = [T2561S,T2561MS,T2561MI,T2561I];
M256TStdv = [T2562S,T2562MS,T2562MI,T2562I];
 
uS25611 = trapmf(x,B256SStdv);
uS25612 = trapmf (x,M256SStdv);
uL25611 = FacRedL*trapmf (x,B256LStdv);
uL25612 = FacRedL*trapmf (x,M256LStdv);
uT25611 = FacRedT1*trapmf (x,B256TStdv);
uT25612 = FacRedT1*trapmf (x,M256TStdv);
on1=zeros(1,length(uT25612));
on2=ones(1,length(uT25612));

figure(1)
ax1=subplot(4,1,1);
plot(x,uSQ11,'b--');
axis([0 1 0 1.5])
hold on
plot(x,uSQ12,'b--');
hold on
plot(x,uTQ11,'k');
hold on
plot(x,uTQ12,'k');
hold on
plot(x,uLQ11,'r--');
hold on
plot(x,uLQ12,'r--');
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','','T1MF','', 'LMF','')

ax1=subplot(4,1,2);
plot(x,uS1611,'b--');
axis([0 1 0 1.5])
hold on
plot(x,uS1612,'b--');
hold on
plot(x,uS1613,'b--');
hold on
plot(x,uT1611,'k');
hold on
plot(x,uT1612,'k');
hold on
plot(x,uT1613,'k');
hold on
plot(x,uL1612,'r--');
hold on
plot(x,uL1611,'r--');
hold on
plot(x,uL1613,'r--');
title(ax1,'Membership Function 16QAM')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','','','T1MF','','', 'LMF','','')

ax1=subplot(4,1,3);
plot(x,uS6411,'b--');
axis([0 1 0 1.5])
hold on
plot(x,uS6412,'b--');
hold on
plot(x,uS6413,'b--');
hold on
plot(x,uT6411,'k');
hold on
plot(x,uT6412,'k');
hold on
plot(x,uT6413,'k');
hold on
plot(x,uL6411,'r--');
hold on
plot(x,uL6412,'r--');
hold on
plot(x,uL6413,'r--');
title(ax1,'Membership Function 64QAM')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','','','T1MF','','', 'LMF','','')

ax1=subplot(4,1,4);
plot(x,uS25611,'b--');
axis([0 1 0 1.5])
hold on
plot(x,uS25612,'b--');
hold on
plot(x,uT25611,'k');
hold on
plot(x,uT25612,'k');
hold on
plot(x,uL25611,'r--');
hold on
plot(x,uL25612,'r--');
title(ax1,'Membership Function 256QAM')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF','','T1MF','', 'LMF','')
%}


yQb = [uSQ11;uLQ11;uTQ11];  
yQm = [uSQ12;uLQ12;uTQ12];                             % Create Data (Dependent Variable Matrix)

y16b = [uS1611;uL1611;uT1611];  
y16r = [uS1612;uL1612;uT1612];                             % Create Data (Dependent Variable Matrix)
y16m = [uS1613;uL1613;uT1613];  

y64b = [uS6411;uL6411;uT6411];  
y64r = [uS6412;uL6412;uT6412];                             % Create Data (Dependent Variable Matrix)
y64m = [uS6413;uL6413;uT6413];    

y256b = [uS25611;uL25611;uT25611];  
y256m = [uS25612;uL25612;uT25612];                             % Create Data (Dependent Variable Matrix)
grid
figure(2)

ax1=subplot(4,1,1);

surf([x; x], [yQb(1,:); yQb(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [yQb(2,:);  yQb(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [yQm(1,:); yQm(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [yQm(2,:);  yQm(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
grid on
title(ax1,'Membership Function QPSK')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')
legend('UMF', 'LMF')


ax2=subplot(4,1,2);
surf([x; x], [y16r(1,:); y16r(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y16r(2,:);  y16r(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [y16b(1,:); y16b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y16b(2,:);  y16b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [y16m(1,:); y16m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y16m(2,:);  y16m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
grid on
title(ax2,'Membership Function 16QAM')
xlabel(ax2,'x')
ylabel(ax2,'f(x)')
legend('UMF', 'LMF')

ax3=subplot(4,1,3);
surf([x; x], [y64r(1,:); y64r(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y64r(2,:);  y64r(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [y64b(1,:); y64b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y64b(2,:);  y64b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [y64m(1,:); y64m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y64m(2,:);  y64m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
grid on
title(ax3,'Membership Function 64QAM')
xlabel(ax3,'x')
ylabel(ax3,'f(x)')
legend('UMF', 'LMF')

ax4=subplot(4,1,4);

surf([x; x], [y256b(1,:); y256b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y256b(2,:);  y256b(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
hold on
surf([x; x], [y256m(1,:); y256m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Upper Half Of 3-D Wing Section
hold on
surf([x; x], [y256m(2,:);  y256m(3,:)], [zeros(size(x)); ones(size(x))],'FaceAlpha',0.1)     % Lower Half Of 3-D Wing Section
grid on
title(ax4,'Membership Function 256PSK')
xlabel(ax4,'x')
ylabel(ax4,'f(x)')
legend('UMF', 'LMF')


function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I,T1S,T1MS,T1MI,T1I,T2S,T2MS,T2MI,T2I] = Limits2(Lim,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

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
function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,S3S,S3MS,S3MI,S3I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I,L3S,L3MS,L3MI,L3I,T1S,T1MS,T1MI,T1I,T2S,T2MS,T2MI,T2I,T3S,T3MS,T3MI,T3I] = Limits3(LimI, LimS,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

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
T2I = LimS-y1+DistCent+DistT1;  %los mismos puntos de inicio  y fin 
 
T3S = LimS-y1+DistT1;
T3MS = LimS+DistT1;
T3MI = 1;
T3I = 1;

end