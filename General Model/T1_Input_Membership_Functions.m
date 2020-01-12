sup_lim=0.99;
x = 0:0.001:sup_lim;
%Input membership Functions fors:
% WLAN
test = -66;
z = Normal_RSSI(test);

%Definitions for Functions fors of WLAN RSSI:

RSSI61 = [0 0 0.61 0.62]; %  Trapezoidal - The definition is given by the next measured value boundary
RSSI62 = [0.61 0.62 0.63]; 
RSSI63 = [0.62 0.63 0.67]; 
RSSI67 = [0.63 0.67 0.71]; 
RSSI71 = [0.67 0.71 0.74]; 
RSSI74 = [0.71 0.74 0.75]; 
RSSI75 = [0.74 0.75 0.76 0.77]; % Trapezoidal
RSSI76 = [0.75 0.76 0.77 0.79]; % Trapezoidal
RSSI79 = [0.78 0.79 10 10]; % Trapezoidal

% measure.

WL1 = trapmf(x,RSSI61);
WL2 = trimf(x,RSSI62);
WL3 = trimf(x,RSSI63);
WL4 = trimf(x,RSSI67);
WL5 = trimf(x,RSSI71);
WL6 = trimf(x,RSSI74);
WL7 = trapmf(x,RSSI75);
WL8 = trapmf(x,RSSI76);
WL9 = trapmf(x,RSSI79);

figure(1)
ax1=subplot(4,1,1);
plot(x,WL1,"k");
axis([0 1 0 1.5])
hold on
plot(x,WL2,"k");
hold on
plot(x,WL3,"k");
hold on
plot(x,WL4,"k");
hold on
plot(x,WL5,"k");
hold on
plot(x,WL6,"k");
hold on
plot(x,WL7,"k");
hold on
plot(x,WL8,"k");
hold on
plot(x,WL9,"k");
title(ax1,'Membership Functions for WLAN')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%CQI Functions fors for LTE are singleton, they are not continous


LCIY = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
LCIT = [ 0 0.0666 0.1333 0.2 0.2666 0.3333 0.4 0.4666 0.5333 0.6 0.6666 0.7333 0.8 0.8666 0.9333 1];


ax1=subplot(4,1,2);
stem(LCIT,LCIY,"k");
axis([0 1.05 0 1.5])
title(ax1,'Membership Functions for CQI LTE')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSRQ Functions fors for LTE possible serving cell 

RSRQGood = [0 0 0.98 0.99];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99

RSRQBad = [0.98 0.99 10 10];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99

LRQ1 = trapmf(x,RSRQGood);
LRQ2 = trapmf(x,RSRQBad);

ax1=subplot(4,1,3);
plot(x,LRQ1,"k");
axis([0 1 0 1.5])
hold on
plot(x,LRQ2,"k");
title(ax1,'Membership Functions for RSRQ Possible Serving Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSRQ Functions fors for LTE possible neighbor cell 

RSRQNGood = [0 0 0.96 0.97];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98 so difference is 0.01 (0.97 - 0.01)

RSRQNBad = [0.96 0.97 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98

LNRQ1 = trapmf(x,RSRQNGood);
LNRQ2 = trapmf(x,RSRQNBad);

ax1=subplot(4,1,4);
plot(x,LNRQ1,"k");
axis([0 1 0 1.5])
hold on
plot(x,LNRQ2,"k");
title(ax1,'Membership Functions for RSRQ Possible Neighbor Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')


%CQI Functions fors for HSPA are singleton, they are not continous:


LCHY = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
LCHT = [0.0333 0.0666 0.1 0.1333 0.1666 0.2 0.2333 0.2666 0.3 0.3333 0.3666 0.4 0.4333 0.4666 0.5 0.5333 0.5666 0.6 0.6333 0.6666 0.7 0.7333 0.7666 0.8 0.8333 0.8666 0.9 0.9333 0.9666 1];


figure(2)
ax1=subplot(4,1,1);
stem(LCHT,LCHY,"k");
axis([0 1.05 0 1.5])
title(ax1,'Membership Functions for CQI HSPA')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSCP Functions fors for HSPA possible serving  cell 

RSCPSGood = [0 0 0.495 0.505];% this was calculated according to the histeresis
%101 threshold = 0.505 and 99 = 0.495  is 0.01 (0.495 - 0.01)

RCSPSBad = [0.495 0.505 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98

HSRC1 = trapmf(x,RSCPSGood);
HSRC2 = trapmf(x,RCSPSBad);


ax1=subplot(4,1,2);
plot(x,HSRC1,"k");
axis([0 1 0 1.5])
hold on
plot(x,HSRC2,"k");
title(ax1,'Membership Functions for RSCP Possible Serving  Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%RSCP Functions fors for HSPA possible neighbor  cell 

RSCPNGood = [0 0 0.485 0.495];% this was calculated according to the histeresis
%97 threshold = 0.485 and 99 = 0.495 

RCSPNBad = [0.485 0.495 10 10];% this was calculated according to the histeresis
%97 threshold = 0.485 and 99 = 0.495 

HSRC1 = trapmf(x,RSCPNGood);
HSRC2 = trapmf(x,RCSPNBad);


ax1=subplot(4,1,3);
plot(x,HSRC1,"k");
axis([0 1 0 1.5])
hold on
plot(x,HSRC2,"k");
title(ax1,'Membership Functions for RSCP Possible Neighbor Cell')
xlabel(ax1,'x')
ylabel(ax1,'f(x)')

%Definitions for Functions fors of Zigbee LQI:

LQIBad = [0 0 0.3921 0.4313]; %  Trapezoidal
%the boundary = 100/255 = 0.3921, a distance of 10 for uncertainity is
%defined = 110/255 = 0.4313
LQIMedium = [0.3921 0.4313 0.745 0.7843]; %  Trapezoidal
%the boundaries are defined by the other membership Functions fors
LQIGood = [0.745 0.7843 10 10]; %  Trapezoidal
%the boundary = 190/255 = 0.745, 200/255 = 0.7843 

LQI1 = trapmf(x,LQIBad);
LQI2 = trapmf(x,LQIMedium);
LQI3 = trapmf(x,LQIGood);

ax1=subplot(4,1,4);
plot(x,LQI1,"k");
axis([0 1 0 1.5])
hold on
plot(x,LQI2,"k");
hold on
plot(x,LQI3,"k");
title(ax1,'Membership Functions for LQI in Zigbee ')
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
