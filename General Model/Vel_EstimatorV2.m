
%{
New_Tech = "LTE Possible Neighbor";
New_Mod = "64-QAM";
New_CR = "0.853";
New_TB = "928";
New_ZBFreq = "868-868.6 Hz";
%}

O1 = New_Tech;
O2 = New_Mod;
O3 = str2double(New_CR);
O4 = str2double(New_TB);
O5 = New_ZBFreq;
O7 = New_TB;
Vel = 0;

if O1 == "WLAN" && O2 == "BPSK" && O3 == 0.5
    Vel=60;
elseif O1 == "WLAN" && O2 == "QPSK" && (O3 == 0.5 || O3 == 0.554...
        || O3 == 0.588|| O3 == 0.602 )%possible code rates
    Vel=120;
elseif O1 == "WLAN" && O2 == "QPSK" && (O3 == 0.75 || O3 == 0.65...
        || O3 == 0.66|| O3 == 0.754)%possible code rates
    Vel=180;
elseif O1 == "WLAN" && O2 == "16-QAM" && (O3 == 0.5 || O3 == 0.554 ...
        || O3 == 0.588 || O3 == 0.602 )%possible code rates
    Vel=240;
elseif O1 == "WLAN" && O2 == "16-QAM" && (O3 == 0.75 || O3 == 0.754 ...
        || O3 == 0.65 || O3 == 0.66)%possible code rates
    Vel=360;
elseif O1 == "WLAN" && O2 == "64-QAM" && O3 == 0.66
    Vel=480;
elseif O1 == "WLAN" && O2 == "64-QAM" && (O3 == 0.75 || O3 == 0.754)%possible code rates
    Vel=540;
elseif O1 == "WLAN" && O2 == "64-QAM" && O3 == 0.83
    Vel=600;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && O3 == 0.076
    Vel=12;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && O3 == 0.117
    Vel=19;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && O3 == 0.188
    Vel=31;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && (O3 == 0.301 || O3 == 0.369)%Possible code rates
    Vel=49;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && (O3 == 0.438 || O3 == 0.455) %Possible code rates
    Vel=71;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "QPSK" && (O3 >= 0.5 || O3 == 0.479)
    Vel=95;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "16-QAM" && O3 <= 0.369 
    Vel=60;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "16-QAM" && (O3 == 0.479 || O3 == 0.438 ...
        || O3 == 0.455 || O3 == 0.5 || O3 == 0.554)%possible code rates
    Vel=78;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "16-QAM" && (O3 >= 0.602 || O3 == 0.588)%possible code rates
    Vel=97;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && (O3 <= 0.455 || O3 == 0.479)%possible code rates
    Vel=74;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && (O3 == 0.554 ||O3 == 0.5 ...
        || O3 == 0.588)%possible code rates
    Vel=90;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && (O3 == 0.65 || O3 == 0.602 || O3 == 0.66)%possible code rates
    Vel=105;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && (O3 == 0.75 || O3 == 0.754)%possible code rates
    Vel=122;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && (O3 == 0.853 || O3 == 0.83)%possible code rates
    Vel=138;
elseif (O1 == "LTE Possible Serving"  || O1 == "LTE Possible Neighbor")...
        && O2 == "64-QAM" && O3 == 0.926
    Vel=150;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O4 == 136 
    Vel=0.07;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O7 == "Without Transport Block"  % For values of CR below speed will be "0.07" 
    Vel=0.07;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 176
    Vel=0.1;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 232
    Vel=0.13;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 320
    Vel=0.17;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O4 == 376
    Vel=0.2;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 464
    Vel=0.25;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O4 == 648
    Vel=0.35;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 792
    Vel=0.43;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 928
    Vel=0.51;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O4 == 1264
    Vel=0.69;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 1488
    Vel=0.81;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK" || O2 == "O-QPSK") && O4 == 1744
    Vel=0.95;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 2288
    Vel=1.25;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 == 2592
    Vel=1.41;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && (O2 == "QPSK"|| O2 == "O-QPSK") && O4 >= 3328 %To cover all possible TB
    Vel=1.81;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 <= 3576 % To cover possible TBs
    Vel=1.95;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 4200
    Vel=2.29;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 4672
    Vel=2.54;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 5296
    Vel=2.88;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 5896
    Vel=3.21;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 6568
    Vel=3.58;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 7184
    Vel=3.91;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 9736
    Vel=5.3;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 == 11432
    Vel=6.22;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "16-QAM" && O4 >= 14424 % To cover possible TBs
    Vel=7.85;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "64-QAM" && O4 <= 15776 
    Vel=8.59;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "64-QAM" && O4 == 21768
    Vel=11.85;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "64-QAM" && O4 == 26504
    Vel=14.43;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "64-QAM" && O4 == 32264
    Vel=17.56;
elseif (O1 == "HSPA Possible Neighbor" || O1 == "HSPA Possible Serving")...
        && O2 == "64-QAM" && O4 == 38576
    Vel=21;
elseif O1 == "Zigbee" && (O2 == "O-QPSK" || O2 == "QPSK" || O2 == "16-QAM")%all possible modulations
    Vel = 0.25;  
elseif O1 == "Zigbee" && O2 == "BPSK" && O5 == "902-928 Hz"
    Vel = 0.04;        
elseif O1 == "Zigbee" && O2 == "BPSK" && O5 == "868-868.6 Hz"
    Vel = 0.02;
else
    Vel = 0;
end