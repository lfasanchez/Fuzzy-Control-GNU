%Variables para probar el sistema:
ModAct = X; % Actual Modulation (Input to the system)  0 - QPSK; 1 - 16QAM; 2 - 64QAM; 3- 256QAM 
RMS=Y;% RMS measured at the receiver and normalized in values from  0 to 1

x = 0:0.02:0.99; %Dimension of the evaluation axis for the MFs
StdvQ=0.0184;
Stdv16=0.0192;
Stdv64=0.016;
Stdv256=0.0187;
tic;
% The amplitude factor of the membership functions is defined:


% First the T1 variable for the QPSK modulation: 

LimQ= 0.14; %The boundary of the MF of for "good" and "bad" behavior 
DistCentQ=StdvQ;


%Then the T1 variables for the 16-QAM modulation: 
Lim216= 0.14;   %The boundar¡ies of the MF of for "good", "average" and "bad" behavior
Lim116= 0.3716;
DistCent16=Stdv16;


%Then the T1 variables for the 64-QAM modulation: 
Lim264= 0.3716;  % %The boundar¡ies of the MF of for "good", "average" and "bad" behavior
Lim164= 0.4827;
DistCent64=Stdv64;



%Then the T1 variables for the 256-QAM modulation: 
Lim256= 0.4827;  %The boundary of the MF of for "good" and "bad" behavior 
DistCent256=Stdv256;


% The centers and standard deviation of the output functions are defined
stddevy1out = 0.025;
y1c1= 0.20; % QPSK
y1c2= 0.40; % 16-QAM
y1c3= 0.60; % 64-QAM
y1c4= 0.80; % 256-QAM


% The boundaries of the trapezoidal functions are calculated; this is done
% only once for the model


% for QPSK
[Q1S,Q1MS,Q1MI,Q1I,Q3S,Q3MS,Q3MI,Q3I] = Limits2(LimQ,DistCentQ);

MQRMS = [Q1S,Q1MS,Q1MI,Q1I];
BQRMS = [Q3S,Q3MS,Q3MI,Q3I];

% for 16QAM

[M161S,M161MS,M161MI,M161I,M162S,M162MS,M162MI,M162I,M163S,M163MS,M163MI,M163I] = Limits3(Lim216, Lim116,DistCent16);

MM16RMS = [M161S,M161MS,M161MI,M161I];
RM16RMS = [M162S,M162MS,M162MI,M162I];
BM16RMS = [M163S,M163MS,M163MI,M163I];

%  for 64QAM

[M641S,M641MS,M641MI,M641I,M642S,M642MS,M642MI,M642I,M643S,M643MS,M643MI,M643I] = Limits3(Lim264, Lim164,DistCent64);
 
MM64RMS = [M641S,M641MS,M641MI,M641I];
RM64RMS = [M642S,M642MS,M642MI,M642I];
BM64RMS = [M643S,M643MS,M643MI,M643I];

% for 256QAM

[M2561S,M2561MS,M2561MI,M2561I,M2563S,M2563MS,M2563MI,M2563I] = Limits2(Lim256, DistCent256);
 
MM256RMS = [M2561S,M2561MS,M2561MI,M2561I];
BM256RMS = [M2563S,M2563MS,M2563MI,M2563I];


% Then the inputs are normalized and fuzzified:
 [u11, u12, u13, u21, u22, u23, u24] = Fuzzy(RMS, ModAct,BQRMS,MQRMS,BM16RMS,RM16RMS,MM16RMS,BM64RMS,RM64RMS,MM64RMS,BM256RMS,MM256RMS);
 
%The antecedents of the rules are calculated:
[Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10]=Antecedents(u11, u12, u13, u21, u22, u23, u24);


% The mandami implication is calculated:

[r11, r12, r13, r14, r15, r16, r17, r18, r19, r111]= Mandami (Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10, x);

%The maximum value of the implications are calculated:

[outp1] = Maximo(r11, r12, r13, r14, r15, r16, r17, r18, r19, r111);


%figure
%{
ax3=plot(x,outp1);
axis([0 1 0 1])
title('Output Function T1')
xlabel('x')
ylabel('f(x)')
legend('Membership Function')
%}

% The output is defuzzified by the centroid method:
[outnm] = Defuzzy(outp1, x);
toc;

pler = toc;

% Output definitions
% New modulation


if outnm <y1c1+(4*stddevy1out) % The threshold is the mean plus 4 times the standar deviation 
    %display("QPSK");
    outfinal = 0;
elseif outnm <y1c2+(4*stddevy1out)
     %display("16QAM");
    outfinal = 1;
elseif outnm <y1c3+(4*stddevy1out)
     %display("64QAM");
    outfinal= 2;
else
    %display("256QAM");
    outfinal = 3;
end


function [S1S,S1MS,S1MI,S1I,S2S,S2MS,S2MI,S2I,L1S,L1MS,L1MI,L1I,L2S,L2MS,L2MI,L2I] = Limits2(Lim,DistCent)

% Se estiman los valores de las funciones de pertenencia trapezoidal de
% acuerdo  a la distancia entre los limites

x1=Lim;
y1=3*DistCent;

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
y1=3*DistCent;

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
function [u11,u12,u13,u21,u22,u23,u24] = Fuzzy(RMS, ModAct,BQRMS,MQRMS,BM16RMS,RM16RMS,MM16RMS,BM64RMS,RM64RMS,MM64RMS,BM256RMS,MM256RMS)
% primero se estiman los valores de pertenencia de cada variable partiendo
% de las funciones de cada variable (entradas)
%u11 = RMS Malo
%u12 = RMS Intermedio
%u13 = RMS Bueno
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM
x1=RMS*10;

%Primero se normaliza la Std Dev de acuerdo a la ganancia
   
    if ModAct == 0
        u11 = trapmf (x1,MQRMS);
        u12 = 0;
        u13 = trapmf(x1,BQRMS);
        u21 = 1;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
        u22 = 0;
        u23 = 0;
        u24 = 0;



    elseif ModAct == 1
        u11 = trapmf (x1,MM16RMS);
        u12 = trapmf (x1,RM16RMS);
        u13 = trapmf(x1,BM16RMS);
        u21 = 0;
        u22 = 1;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
        u23 = 0;
        u24 = 0;

    elseif ModAct ==2
        u11 = trapmf (x1,MM64RMS);
        u12 = trapmf (x1,RM64RMS);
        u13 = trapmf(x1,BM64RMS);
        u21 = 0;
        u22 = 0;
        u23 = 1;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.
        u24 = 0;

    else
        u11 = trapmf (x1,MM256RMS);
        u12 = 0;
        u13 = trapmf(x1,BM256RMS);
        u21 = 0;
        u22 = 0;
        u23 = 0;
        u24 = 1;%Dado que no se tienen dos modulaciones siumultaneas la pertenencia de cada una es 1 donde corresponda.

    end


end
function [Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10] = Antecedents(u11, u12, u13, u21, u22, u23, u24)
%u11 = RMS malo
%u12 = RMS Intermedio
%u13 = RMS Bueno
%u21 = QPSK
%u22 = 16QAM
%u23 = 64QAM
%u24 = 256QAM

% Reglas con Mod 256-QAM
A1 = [u13 u24];
Ar1 = min(A1);
A2 = [u11 u24];
Ar2 = min(A2);

% Reglas con Mod 64-QAM
A3 = [u13 u23];
Ar3 = min(A3);
A4 = [u12 u23];
Ar4 = min(A4);
A5 = [u11 u23];
Ar5 = min(A5);

% Reglas con Mod 16-QAM
A6 = [u13 u22];
Ar6 = min(A6);
A7 = [u12 u22];
Ar7 = min(A7);
A8 = [u11 u22];
Ar8 = min(A8);

%Reglas con Mod QPSK
A9 = [u13 u21];
Ar9 = min(A9);
A10 = [u11 u21];
Ar10 = min(A10);

end
function [r01, r02, r03, r04, r05, r06, r07, r08, r09, r010] = Mandami(Ar1, Ar2, Ar3, Ar4, Ar5, Ar6, Ar7, Ar8, Ar9, Ar10, x)


% se crean las funciones de pertenencia de las funciones de salida
% toda la funcion, ningun punto en especifico
% centro de las funciones de pertenencia de salida
y1c1= 0.20; % QPSK
y1c2= 0.40; % 16-QAM
y1c3= 0.60; % 64-QAM
y1c4= 0.80; % 256-QAM

%Mod nueva 10 - QPSK; 30 - 8PSK; 50 - 16QAM; 70- 32QAM; 90- 64QAM
y11 = gaussmf(x,[0.025 y1c1]);
y12 = gaussmf(x,[0.025 y1c2]);
y13 = gaussmf(x,[0.025 y1c3]);
y14 = gaussmf(x,[0.025 y1c4]);



    %se crean vectores de los valores obtenidos en los antecedentes para poder sacar el minimo de dos vectores
Ar=ones(1,length(x));
Ar11= Ar *Ar1;
Ar22= Ar *Ar2;
Ar33= Ar *Ar3;
Ar44= Ar *Ar4;
Ar55= Ar *Ar5;
Ar66= Ar *Ar6;
Ar77= Ar *Ar7;
Ar88= Ar *Ar8;
Ar99= Ar *Ar9;
Ar10= Ar *Ar10;


        % se calcula el minimo entre el valor y la funcion de salida de
        % cada regla de la nueva mod.
%y11 = QPSK; 
%y12 = 16QAM;
%y13 = 64QAM; 
%y14 = 256QAM;


r01=min(Ar11,y14);
r02=min(Ar22,y13);
r03=min(Ar33,y14);
r04=min(Ar44,y13);
r05=min(Ar55,y12);
r06=min(Ar66,y13);
r07=min(Ar77,y12);
r08=min(Ar88,y11);
r09=min(Ar99,y12);
r010=min(Ar10,y11);

 

end
function [outp1] = Maximo(r11, r12, r13, r14, r15, r16, r17, r18, r19, r111)

aux0 = max(r11,r12);
aux0 = max(aux0,r13);
aux0 = max(aux0,r14);
aux0 = max(aux0,r15);
aux0 = max(aux0,r16);
aux0 = max(aux0,r17);
aux0 = max(aux0,r18);
aux0 = max(aux0,r19);
outp1 = max(aux0,r111);

end
function [outnm] = Defuzzy (outp1, x)
outnm1 = x;
for i = 1:1:length(x)
       outnm1(1,i) = outp1(1,i)*x(1,i);
        i=i+1;
end

outnm=sum(outnm1)/sum(outp1);



end
