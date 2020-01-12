sup_lim=0.99;
x = 0:0.001:sup_lim;
%Input membership functions:
% WLSAN
test = -66;
z = Normal_RSSI(test);

FacRedL = 0.8;
FacRedT = (1 + FacRedL)/2;
%Definitions for Upper functions of WLAN RSSI:

RSSI61 = [0 0 0.61 0.62]; %  Trapezoidal - The definition is given by the next measured value boundary
RSSI62 = [0.61 0.62 0.63]; 
RSSI63 = [0.62 0.63 0.67]; 
RSSI67 = [0.63 0.67 0.71]; 
RSSI71 = [0.67 0.71 0.74]; 
RSSI74 = [0.71 0.74 0.75]; 
RSSI75 = [0.74 0.75 0.76 0.77]; % Trapezoidal
RSSI76 = [0.75 0.76 0.77 0.79]; % Trapezoidal
RSSI79 = [0.78 0.79 10 10]; % Trapezoidal

%The difference between Superior and Inferior functions are defined:

RSSIDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSSIDifTC = [-0.005 -0.005 0.005 0.005];%for central trapezoidal functions
RSSIDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions
RSSIDifTr = [-0.005 0 0.005];% for triangular functions

%The difference between T1 and the IT2 functions are defined:

RSSIDifTLT = [0 0 0.005 0.005]/2;%for left trapezoidal functions
RSSIDifTCT = [-0.005 -0.005 0.005 0.005]/2;%for central trapezoidal functions
RSSIDifTRT = [-0.005 -0.005 0 0]/2;%for right trapezoidal functions
RSSIDifTrT = [-0.005 0 0.005]/2;% for triangular functions

%The lower function points are calculated
RSSI61L = RSSI61 - RSSIDifTL; 
RSSI62L = RSSI62 - RSSIDifTr; 
RSSI63L = RSSI63 - RSSIDifTr; 
RSSI67L = RSSI67 - RSSIDifTr; 
RSSI71L = RSSI71 - RSSIDifTr; 
RSSI74L = RSSI74 - RSSIDifTr; 
RSSI75L = RSSI75 - RSSIDifTC; 
RSSI76L = RSSI76 - RSSIDifTC; 
RSSI79L = RSSI79 - RSSIDifTR; 

%The T1 function points are calculated
RSSI61LT = RSSI61 - RSSIDifTLT; 
RSSI62LT = RSSI62 - RSSIDifTrT; 
RSSI63LT = RSSI63 - RSSIDifTrT; 
RSSI67LT = RSSI67 - RSSIDifTrT; 
RSSI71LT = RSSI71 - RSSIDifTrT; 
RSSI74LT = RSSI74 - RSSIDifTrT; 
RSSI75LT = RSSI75 - RSSIDifTCT; 
RSSI76LT = RSSI76 - RSSIDifTCT; 
RSSI79LT = RSSI79 - RSSIDifTRT; 

% Membership functions are calculated
WLS1 = trapmf(x,RSSI61);
WLS2 = trimf(x,RSSI62);
WLS3 = trimf(x,RSSI63);
WLS4 = trimf(x,RSSI67);
WLS5 = trimf(x,RSSI71);
WLS6 = trimf(x,RSSI74);
WLS7 = trapmf(x,RSSI75);
WLS8 = trapmf(x,RSSI76);
WLS9 = trapmf(x,RSSI79);

WLS1L = FacRedL*trapmf(x,RSSI61L);
WLS2L = FacRedL*trimf(x,RSSI62L);
WLS3L = FacRedL*trimf(x,RSSI63L);
WLS4L = FacRedL*trimf(x,RSSI67L);
WLS5L = FacRedL*trimf(x,RSSI71L);
WLS6L = FacRedL*trimf(x,RSSI74L);
WLS7L = FacRedL*trapmf(x,RSSI75L);
WLS8L = FacRedL*trapmf(x,RSSI76L);
WLS9L = FacRedL*trapmf(x,RSSI79L);

WLS1T = FacRedT*trapmf(x,RSSI61LT);
WLS2T = FacRedT*trimf(x,RSSI62LT);
WLS3T = FacRedT*trimf(x,RSSI63LT);
WLS4T = FacRedT*trimf(x,RSSI67LT);
WLS5T = FacRedT*trimf(x,RSSI71LT);
WLS6T = FacRedT*trimf(x,RSSI74LT);
WLS7T = FacRedT*trapmf(x,RSSI75LT);
WLS8T = FacRedT*trapmf(x,RSSI76LT);
WLS9T = FacRedT*trapmf(x,RSSI79LT);


figure(1)
ax1=subplot(4,1,1);
plot(x,WLS1,'k');
axis([0 1 0 1.5])
hold on
plot(x,WLS1L,'k--');
hold on
plot(x,WLS1T,'k-.');
hold on
plot(x,WLS2,'k');
hold on
plot(x,WLS2L,'k--');
hold on
plot(x,WLS2T,'k-.');
hold on
plot(x,WLS3,'k');
hold on
plot(x,WLS3L,'k--');
hold on
plot(x,WLS3T,'k-.');
hold on
plot(x,WLS4,'k');
hold on
plot(x,WLS4L,'k--');
hold on
plot(x,WLS4T,'k-.');
hold on
plot(x,WLS5,'k');
hold on
plot(x,WLS5L,'k--');
hold on
plot(x,WLS5T,'k-.');
hold on
plot(x,WLS6,'k');
hold on
plot(x,WLS6L,'k--');
hold on
plot(x,WLS6T,'k-.');
hold on
plot(x,WLS7,'k');
hold on
plot(x,WLS7L,'k--');
hold on
plot(x,WLS7T,'k-.');
hold on
plot(x,WLS8,'k');
hold on
plot(x,WLS8L,'k--');
hold on
plot(x,WLS8T,'k-.');
hold on
plot(x,WLS9,'k');
hold on
plot(x,WLS9L,'k--');
hold on
plot(x,WLS9T,'k-.');
title(ax1,'Membership Function for WLAN')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%CQI Functions for LTE are singleton, they are not continous


LCIY = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
LCIT = [ 0 0.0666 0.1333 0.2 0.2666 0.3333 0.4 0.4666 0.5333 0.6 0.6666 0.7333 0.8 0.8666 0.9333 1];


ax1=subplot(4,1,2);
stem(LCIT,LCIY,'k');
axis([0 1.05 0 1.5])
title(ax1,'Membership Function for CQI LTE')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%Upper RSRQ Functions for LTE possible serving cell 
RSRQGood = [0 0 0.98 0.99];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99

RSRQBad = [0.98 0.99 10 10];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99

%The difference between Superior and Inferior functions are defined:

RSRQDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSRQDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions

%The difference between T1 and the IT2 functions are defined:
RSRQDifTLT = [0 0 0.005 0.005]/2;%for left trapezoidal functions
RSRQDifTRT = [-0.005 -0.005 0 0]/2;%for right trapezoidal functions

%The Lower function points are calculated
RSRQGoodL = RSRQGood - RSRQDifTL;
RSRQBadL = RSRQBad - RSRQDifTR;

%The T1 function points are calculated
RSRQGoodT = RSRQGood - RSRQDifTLT;
RSRQBadT = RSRQBad - RSRQDifTRT;

% Membership functions are calculated
LRQ1 = trapmf(x,RSRQGood);
LRQ2 = trapmf(x,RSRQBad);

LRQ1L = FacRedL*trapmf(x,RSRQGoodL);
LRQ2L = FacRedL*trapmf(x,RSRQBadL);

LRQ1T = FacRedT*trapmf(x,RSRQGoodT) ;
LRQ2T = FacRedT*trapmf(x,RSRQBadT) ;

ax1=subplot(4,1,3);
plot(x,LRQ1,'k');
axis([0 1 0 1.5])
hold on
plot(x,LRQ1L,'k--');
hold on
plot(x,LRQ1T,'k-.');
hold on
plot(x,LRQ2,'k');
hold on
plot(x,LRQ2L,'k--');
hold on
plot(x,LRQ2T,'k-.');
title(ax1,'Membership Function for RSRQ Possible Serving Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSRQ Functions for LTE possible neighbor cell 

RSRQNGood = [0 0 0.96 0.97];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98 so difference is 0.01 (0.97 - 0.01)

RSRQNBad = [0.96 0.97 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98

%The difference between Superior and Inferior functions are defined:

RSRQNDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSRQNDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions

%The difference between T1 and the IT2 functions are defined:
RSRQNDifTTL = [0 0 0.005 0.005]/2;%for left trapezoidal functions
RSRQNDifTTR = [-0.005 -0.005 0 0]/2;%for right trapezoidal functions

%The lower function points are calculated
RSRQNGoodL = RSRQNGood - RSRQNDifTL;
RSRQNBadL = RSRQNBad - RSRQNDifTR;

%The T1 function points are calculated
RSRQNGoodT = RSRQNGood - RSRQNDifTTL;
RSRQNBadT = RSRQNBad - RSRQNDifTTR;

% Membership functions are calculated
LNRQ1 = trapmf(x,RSRQNGood);
LNRQ2 = trapmf(x,RSRQNBad);
LNRQ1L = FacRedL*trapmf(x,RSRQNGoodL);
LNRQ2L = FacRedL*trapmf(x,RSRQNBadL);
LNRQ1T = FacRedT*trapmf(x,RSRQNGoodT);
LNRQ2T = FacRedT*trapmf(x,RSRQNBadT);

ax1=subplot(4,1,4);
plot(x,LNRQ1,'k');
axis([0 1 0 1.5])
hold on
plot(x,LNRQ1L,'k--');
hold on
plot(x,LNRQ1T,'k-.');
hold on
plot(x,LNRQ2,'k');
hold on
plot(x,LNRQ2L,'k--');
hold on
plot(x,LNRQ2T,'k-.');
title(ax1,'Membership Function for RSRQ Possible Neighbor Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')


%CQI Functions for HSPA are singleton, they are not continous:


LCHY = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
LCHT = [0.0333 0.0666 0.1 0.1333 0.1666 0.2 0.2333 0.2666 0.3 0.3333 0.3666 0.4 0.4333 0.4666 0.5 0.5333 0.5666 0.6 0.6333 0.6666 0.7 0.7333 0.7666 0.8 0.8333 0.8666 0.9 0.9333 0.9666 1];


figure(2)
ax1=subplot(4,1,1);
stem(LCHT,LCHY,'k');
axis([0 1.05 0 1.5])
title(ax1,'Membership Function for CQI HSPA')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSCP Functions for HSPA possible serving  cell 

RSCPSGood = [0 0 0.495 0.505];% this was calculated according to the histeresis
%101 threshold = 0.505 and 99 = 0.495  is 0.01 (0.495 - 0.01)

RCSPSBad = [0.495 0.505 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98

%The difference between Superior and Inferior functions are defined:

RSCPSDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSCPSDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions

%The difference between T1 and the IT2 functions are defined:
RSCPSDifTLT = [0 0 0.005 0.005]/2;%for left trapezoidal functions
RSCPSDifTRT = [-0.005 -0.005 0 0]/2;%for right trapezoidal functions

%The lower function points are calculated
RSCPSGoodL = RSCPSGood - RSCPSDifTL;
RCSPSBadL = RCSPSBad - RSCPSDifTR;

%The T1 function points are calculated
RSCPSGoodT = RSCPSGood - RSCPSDifTLT;
RCSPSBadT = RCSPSBad - RSCPSDifTRT;


% Membership functions are calculated
HSRC1 = trapmf(x,RSCPSGood);
HSRC2 = trapmf(x,RCSPSBad);
HSRC1L  = FacRedL*trapmf(x,RSCPSGoodL);
HSRC2L = FacRedL*trapmf(x,RCSPSBadL);
HSRC1T  = FacRedT*trapmf(x,RSCPSGoodT);
HSRC2T = FacRedT*trapmf(x,RCSPSBadT);

ax1=subplot(4,1,2);
plot(x,HSRC1,'k');
axis([0 1 0 1.5])
hold on
plot(x,HSRC1L,'k--');
hold on
plot(x,HSRC1T,'k-.');
hold on
plot(x,HSRC2,'k');
hold on
plot(x,HSRC2L,'k--');
hold on
plot(x,HSRC2T,'k-.');
title(ax1,'Membership Function for RSCP Possible Serving  Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSCP Functions for HSPA possible neighbor  cell 

RSCPNGood = [0 0 0.485 0.495];% this was calculated according to the histeresis
%101 threshold = 0.505 and 99 = 0.495 

RCSPNBad = [0.485 0.495 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98

%The difference between Superior and Inferior functions are defined:

RSCPNDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSCPNDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions

%The difference between T1 and the IT2 functions are defined:
RSCPNDifTLT = RSCPNDifTL/2;%for left trapezoidal functions
RSCPNDifTRT = RSCPNDifTR/2;%for right trapezoidal functions

%The lower function points are calculated
RSCPNGoodL = RSCPNGood - RSCPNDifTL;
RCSPNBadL = RCSPNBad - RSCPNDifTR;

%The T1 function points are calculated
RSCPNGoodT = RSCPNGood - RSCPNDifTLT;
RCSPNBadT = RCSPNBad - RSCPNDifTRT;

% Membership functions are calculated
HSRC1 = trapmf(x,RSCPNGood);
HSRC2 = trapmf(x,RCSPNBad);
HSRC1L = FacRedL*trapmf(x,RSCPNGoodL);
HSRC2L = FacRedL*trapmf(x,RCSPNBadL);
HSRC1T = FacRedT*trapmf(x,RSCPNGoodT);
HSRC2T = FacRedT*trapmf(x,RCSPNBadT);


ax1=subplot(4,1,3);
plot(x,HSRC1,'k');
axis([0 1 0 1.5])
hold on
plot(x,HSRC1L,'k--');
hold on
plot(x,HSRC1T,'k-.');
hold on
plot(x,HSRC2,'k');
hold on
plot(x,HSRC2L,'k--');
hold on
plot(x,HSRC2T,'k-.');
title(ax1,'Membership Function for RSCP Possible Neighbor Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%Definitions for functions of Zigbee LQI:

LQIBad = [0 0 0.3921 0.4313]; %  Trapezoidal
%the boundary = 100/255 = 0.3921, a distance of 10 for uncertainity is
%defined = 110/255 = 0.4313
LQIMedium = [0.3921 0.4313 0.745 0.7843]; %  Trapezoidal
%the boundaries are defined by the other membership functions
LQIGood = [0.745 0.7843 10 10]; %  Trapezoidal
%the boundary = 190/255 = 0.745, 200/255 = 0.7843 

%The difference between Superior and Inferior functions are defined:
LQIDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
LQIDifTC = [-0.005 -0.005 0.005 0.005];%for central trapezoidal functions
LQIDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions

%The difference between T1 and the IT2 functions are defined:
LQIDifTLT = LQIDifTL/2;%for left trapezoidal functions
LQIDifTCT = LQIDifTC/2;%for central trapezoidal functions
LQIDifTRT = LQIDifTR/2;%for right trapezoidal functions


%The lower function points are calculated
LQIBadL = LQIBad - LQIDifTL;
LQIMediumL = LQIMedium - LQIDifTC;
LQIGoodL = LQIGood - LQIDifTC;

%The T1 function points are calculated
LQIBadT = LQIBad - LQIDifTLT;
LQIMediumT = LQIMedium - LQIDifTCT;
LQIGoodT = LQIGood - LQIDifTCT;

% Membership functions are calculated
LQI1 = trapmf(x,LQIBad);
LQI2 = trapmf(x,LQIMedium);
LQI3 = trapmf(x,LQIGood);
LQI1L = FacRedL*trapmf(x,LQIBadL);
LQI2L = FacRedL*trapmf(x,LQIMediumL);
LQI3L = FacRedL*trapmf(x,LQIGoodL);
LQI1T = FacRedT*trapmf(x,LQIBadT);
LQI2T = FacRedT*trapmf(x,LQIMediumT);
LQI3T = FacRedT*trapmf(x,LQIGoodT);

ax1=subplot(4,1,4);
plot(x,LQI1,'k');
axis([0 1 0 1.5])
hold on
plot(x,LQI1L,'k--');
hold on
plot(x,LQI1T,'k-.');
hold on
plot(x,LQI2,'k');
hold on
plot(x,LQI2L,'k--');
hold on
plot(x,LQI2T,'k-.');
hold on
plot(x,LQI3,'k');
hold on
plot(x,LQI3L,'k--');
hold on
plot(x,LQI3T,'k-.');
title(ax1,'Membership Function for LQI in Zigbee ')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

function[x] = Normal_RSSI(RSSI)
x= (RSSI*-1)/100;

end

function[x] = Normal_RSRQ(RSRQ)
x= (RSRQ*-1)/200;


end

function[x] = Normal_LQI(LQI)
x= LQI/255;
end
