%Variables to test the system
RSSI = RSx; %RSSI of WLAN
RSRQ_LTE_Serving = RSx1; %RSRQ measured possible LTE serving cell
RSRQ_LTE_Neighbor = RSx2;%RSRQ measured possible LTE neighbor cell
CQI_LTE_Serving = Cx1; %CQI for LTE measured possible serving cell
CQI_LTE_Neighbor = Cx2;%CQI for HSPA measured possible neighbor cell
RSCP_3G_Serving = RSx3; %RSCP measured possible HSPA serving cell
RSCP_3G_Neighbor = RSx4; %RSCP measured possible HSPA neighbor cell
CQI_3G_Serving = Cx3; %CQI for HSPA measured possible serving cell
CQI_3G_Neighbor = Cx4;%CQI for HSPA measured possible neighbor cell
LQI = LQx; %LQI measured form possible Zigbee connection


tic;

% Reduction factor for LMF of IT2
FacRedL = 0.8;
% Reduction factor for UMF of IT2
FacredU =1;
%--------------------------------------------------------------------------



% Input Variables are normalized
 [I1,I2,I3,I4,I5,I6,I7,I8,I9,I10] = Normal(RSSI, RSRQ_LTE_Serving, RSRQ_LTE_Neighbor, CQI_LTE_Serving, CQI_LTE_Neighbor, RSCP_3G_Serving, RSCP_3G_Neighbor, CQI_3G_Serving, CQI_3G_Neighbor, LQI);
 
% Normalized variables are Fuzzified for the UMF:
[uU11,uU12,uU13,uU14,uU15,uU16,uU17,uU18,uU19, uU21,uU22,uU31,uU32,uU40,...
 uU41,uU42,uU43,uU44,uU45,uU46,uU47,uU48,uU49,uU410,uU411,uU412,uU413,...
 uU414,uU415,uU50,uU51,uU52,uU53,uU54,uU55,uU56,uU57,uU58,uU59,uU510,...
 uU511,uU512,uU513,uU514,uU515,uU61,uU62,uU71,uU72,uU80,uU81,uU82,uU83,...
 uU84,uU85,uU86,uU87,uU88,uU89,uU810,uU811,uU812,uU813,uU814,uU815,uU816,...
 uU817,uU818,uU819,uU820,uU821,uU822,uU823,uU824,uU825,uU826,uU827,uU828,...
 uU829,uU830,uU90,uU91,uU92,uU93,uU94,uU95,uU96,uU97,uU98,uU99,uU910,uU911,...
 uU912,uU913,uU914,uU915,uU916,uU917,uU918,uU919,uU920,uU921,uU922,uU923,...
 uU924,uU925,uU926,uU927,uU928,uU929,uU930,uU101,uU102,uU103] = Fuzzy(I1,...
 I2,I3,I4,I5,I6,I7,I8,I9,I10,RSSI61, RSSI62, RSSI63,RSSI67, RSSI71, RSSI74,...
 RSSI75, RSSI76,RSSI79, RSRQGood, RSRQBad, RSRQNGood, RSRQNBad, RSCPSGood,...
 RCSPSBad,RSCPNGood, RCSPNBad, LQIBad, LQIMedium, LQIGood,FacredU);

% Normalized variables are Fuzzified for the LMF:
[uL11,uL12,uL13,uL14,uL15,uL16,uL17,uL18,uL19, uL21,uL22,uL31,uL32,uL40,...
 uL41,uL42,uL43,uL44,uL45,uL46,uL47,uL48,uL49,uL410,uL411,uL412,uL413,...
 uL414,uL415,uL50,uL51,uL52,uL53,uL54,uL55,uL56,uL57,uL58,uL59,uL510,...
 uL511,uL512,uL513,uL514,uL515,uL61,uL62,uL71,uL72,uL80,uL81,uL82,uL83,...
 uL84,uL85,uL86,uL87,uL88,uL89,uL810,uL811,uL812,uL813,uL814,uL815,uL816,...
 uL817,uL818,uL819,uL820,uL821,uL822,uL823,uL824,uL825,uL826,uL827,uL828,...
 uL829,uL830,uL90,uL91,uL92,uL93,uL94,uL95,uL96,uL97,uL98,uL99,uL910,uL911,...
 uL912,uL913,uL914,uL915,uL916,uL917,uL918,uL919,uL920,uL921,uL922,uL923,...
 uL924,uL925,uL926,uL927,uL928,uL929,uL930,uL101,uL102,uL103] = Fuzzy(I1,...
 I2,I3,I4,I5,I6,I7,I8,I9,I10,RSSI61L, RSSI62L, RSSI63L,RSSI67L, RSSI71L,...
 RSSI74L, RSSI75L, RSSI76L,RSSI79L, RSRQGoodL, RSRQBadL, RSRQNGoodL,...
 RSRQNBadL, RSCPSGoodL, RCSPSBadL,RSCPNGoodL, RCSPNBadL, LQIBadL,...
 LQIMediumL, LQIGoodL,FacRedL);

%The first part of the rules are calculated for the UMF - Inputs in the rules
[ArU1,ArU2,ArU3,ArU4,ArU5,ArU6,ArU7,ArU8,ArU9,ArU10,ArU11,ArU12,ArU13,...
 ArU14,ArU15,ArU16,ArU17,ArU18,ArU19,ArU20,ArU21,ArU22,ArU23,ArU24,ArU25,...
 ArU26,ArU27,ArU28,ArU29,ArU30,ArU31,ArU32,ArU33,ArU34,ArU35,ArU36,ArU37,...
 ArU38,ArU39,ArU40,ArU41,ArU42,ArU43,ArU44,ArU45,ArU46,ArU47,ArU48,ArU49,...
 ArU50,ArU51,ArU52,ArU53,ArU54,ArU55,ArU56,ArU57,ArU58,ArU59,ArU60,ArU61,...
 ArU62,ArU63,ArU64,ArU65,ArU66,ArU67,ArU68,ArU69,ArU70,ArU71,ArU72,ArU73,...
 ArU74,ArU75,ArU76,ArU77,ArU78,ArU79,ArU80,ArU81,ArU82,ArU83,ArU84,ArU85,...
 ArU86,ArU87,ArU88,ArU89,ArU90,ArU91,ArU92,ArU93,ArU94,ArU95,ArU96,ArU97,...
 ArU98,ArU99,ArU100,ArU101,ArU102,ArU103,ArU104,ArU105,ArU106,ArU107,...
 ArU108,ArU109,ArU110,ArU111,ArU112,ArU113,ArU114,ArU115,ArU116,ArU117,...
 ArU118,ArU119,ArU120,ArU121,ArU122,ArU123] = Previous(uU11,...
    uU12,uU13,uU14,uU15,uU16,uU17,uU18,uU19,uU21,uU22,uU31,uU32,uU40,...
    uU41,uU42,uU43,uU44,uU45,uU46,uU47,uU48,uU49,uU410,uU411,uU412,...
    uU413,uU414,uU415,uU50,uU51,uU52,uU53,uU54,uU55,uU56,uU57,uU58,uU59,...
    uU510,uU511,uU512,uU513,uU514,uU515,uU61,uU62,uU71,uU72,uU80,uU81,...
    uU82,uU83,uU84,uU85,uU86,uU87,uU88,uU89,uU810,uU811,uU812,uU813,uU814,...
    uU815,uU816,uU817,uU818,uU819,uU820,uU821,uU822,uU823,uU824,uU825,...
    uU826,uU827,uU828,uU829,uU830,uU90,uU91,uU92,uU93,uU94,uU95,uU96,uU97,...
    uU98,uU99,uU910,uU911,uU912,uU913,uU914,uU915,uU916,uU917,uU918,uU919,...
    uU920,uU921,uU922,uU923,uU924,uU925,uU926,uU927,uU928,uU929,uU930,...
    uU101,uU102,uU103);
 
%display(ArU1);
%display(ArU2);
%display(ArU3);
%display(ArU4);

%The first part of the rules are calculated for the LMF - Inputs in the rules
[ArL1,ArL2,ArL3,ArL4,ArL5,ArL6,ArL7,ArL8,ArL9,ArL10,ArL11,ArL12,ArL13,...
 ArL14,ArL15,ArL16,ArL17,ArL18,ArL19,ArL20,ArL21,ArL22,ArL23,ArL24,ArL25,...
 ArL26,ArL27,ArL28,ArL29,ArL30,ArL31,ArL32,ArL33,ArL34,ArL35,ArL36,ArL37,...
 ArL38,ArL39,ArL40,ArL41,ArL42,ArL43,ArL44,ArL45,ArL46,ArL47,ArL48,ArL49,...
 ArL50,ArL51,ArL52,ArL53,ArL54,ArL55,ArL56,ArL57,ArL58,ArL59,ArL60,ArL61,...
 ArL62,ArL63,ArL64,ArL65,ArL66,ArL67,ArL68,ArL69,ArL70,ArL71,ArL72,ArL73,...
 ArL74,ArL75,ArL76,ArL77,ArL78,ArL79,ArL80,ArL81,ArL82,ArL83,ArL84,ArL85,...
 ArL86,ArL87,ArL88,ArL89,ArL90,ArL91,ArL92,ArL93,ArL94,ArL95,ArL96,ArL97,...
 ArL98,ArL99,ArL100,ArL101,ArL102,ArL103,ArL104,ArL105,ArL106,ArL107,...
 ArL108,ArL109,ArL110,ArL111,ArL112,ArL113,ArL114,ArL115,ArL116,ArL117,...
 ArL118,ArL119,ArL120,ArL121,ArL122,ArL123] = Previous(uL11,...
    uL12,uL13,uL14,uL15,uL16,uL17,uL18,uL19,uL21,uL22,uL31,uL32,uL40,...
    uL41,uL42,uL43,uL44,uL45,uL46,uL47,uL48,uL49,uL410,uL411,uL412,...
    uL413,uL414,uL415,uL50,uL51,uL52,uL53,uL54,uL55,uL56,uL57,uL58,uL59,...
    uL510,uL511,uL512,uL513,uL514,uL515,uL61,uL62,uL71,uL72,uL80,uL81,...
    uL82,uL83,uL84,uL85,uL86,uL87,uL88,uL89,uL810,uL811,uL812,uL813,uL814,...
    uL815,uL816,uL817,uL818,uL819,uL820,uL821,uL822,uL823,uL824,uL825,...
    uL826,uL827,uL828,uL829,uL830,uL90,uL91,uL92,uL93,uL94,uL95,uL96,uL97,...
    uL98,uL99,uL910,uL911,uL912,uL913,uL914,uL915,uL916,uL917,uL918,uL919,...
    uL920,uL921,uL922,uL923,uL924,uL925,uL926,uL927,uL928,uL929,uL930,...
    uL101,uL102,uL103);

% Then Mandani implications are calculated for the UMF
[rU11,rU12 ,rU13,rU14,rU15,rU16,rU17,rU18,rU19,rU110,rU111,rU112,rU113,rU114,...
    rU115,rU116,rU117,rU118,rU119,rU120,rU121,rU122,rU123,rU124,rU125,rU126,rU127,rU128,...
    rU129,rU130,rU131,rU132,rU133,rU134,rU135,rU136,rU137,rU138,rU139,rU140,rU141,rU142,...
    rU143,rU144,rU145,rU146,rU147,rU148,rU149,rU150,rU151,rU152,rU153,rU154,rU155,rU156,...
    rU157,rU158,rU159,rU160,rU161,rU162,rU163,rU164,rU165,rU166,rU167,rU168,rU169,rU170,...
    rU171,rU172,rU173,rU174,rU175,rU176,rU177,rU178,rU179,rU180,rU181,rU182,rU183,rU184,...
    rU185,rU186,rU187,rU188,rU189,rU190,rU191,rU192,rU193,rU194,rU195,rU196,rU197,rU198,...
    rU199,rU1100,rU1101,rU1102,rU1103,rU1104,rU1105,rU1106,rU1107,rU1108,rU1109,rU1110,...
    rU1111,rU1112,rU1113,rU1114,rU1115,rU1116,rU1117,rU1118,rU1119,rU1120,rU1121,rU1122,...
    rU1123,rU21,rU22,rU23,rU24,rU25,rU26,rU27,rU28,rU29,rU210,rU211,rU212,rU213,rU214,...
    rU215,rU216,rU217,rU218,rU219,rU220,rU221,rU222,rU223,rU224,rU225,rU226,rU227,rU228,...
    rU229,rU230,rU231,rU232,rU233,rU234,rU235,rU236,rU237,rU238,rU239,rU240,rU241,rU242,...
    rU243,rU244,rU245,rU246,rU247,rU248,rU249,rU250,rU251,rU252,rU253,rU254,rU255,rU256,...
    rU257,rU258,rU259,rU260,rU261,rU262,rU263,rU264,rU265,rU266,rU267,rU268,rU269,rU270,...
    rU271,rU272,rU273,rU274,rU275,rU276,rU277,rU278,rU279,rU280,rU281,rU282,rU283,rU284,...
    rU285,rU286,rU287,rU288,rU289,rU290,rU291,rU292,rU293,rU294,rU295,rU296,rU297,rU298,...
    rU299,rU2100,rU2101,rU2102,rU2103,rU2104,rU2105,rU2106,rU2107,rU2108,rU2109,rU2110,...
    rU2111,rU2112,rU2113,rU2114,rU2115,rU2116,rU2117,rU2118,rU2119,rU2120,rU2121,rU2122,...
    rU2123,rU31,rU32,rU33,rU34,rU35,rU36,rU37,rU38,rU39,rU310,rU311,rU312,rU313,rU314,...
    rU315,rU316,rU317,rU318,rU319,rU320,rU321,rU322,rU323,rU324,rU325,rU326,rU327,rU328,...
    rU329,rU330,rU331,rU332,rU333,rU334,rU335,rU336,rU337,rU338,rU339,rU340,rU341,rU342,...
    rU343,rU344,rU345,rU346,rU347,rU348,rU349,rU350,rU351,rU352,rU353,rU354,rU355,rU356,...
    rU357,rU358,rU359,rU360,rU361,rU362,rU363,rU364,rU365,rU366,rU367,rU368,rU369,rU370,...
    rU371,rU372,rU373,rU374,rU375,rU376,rU377,rU378,rU379,rU380,rU381,rU382,rU383,rU384,...
    rU385,rU386,rU387,rU388,rU389,rU390,rU391,rU392,rU393,rU394,rU395,rU396,rU397,rU398,...
    rU399,rU3100,rU3101,rU3102,rU3103,rU3104,rU3105,rU3106,rU3107,rU3108,rU3109,rU3110,...
    rU3111,rU3112,rU3113,rU3114,rU3115,rU3116,rU3117,rU3118,rU3119,rU3120,rU3121,rU3122,...
    rU3123,rU41,rU42,rU43,rU44,rU45,rU46,rU47,rU48,rU49,rU410,rU411,rU412,rU413,rU414,...
    rU415,rU416,rU417,rU418,rU419,rU420,rU421,rU422,rU423,rU424,rU425,rU426,rU427,rU428,...
    rU429,rU430,rU431,rU432,rU433,rU434,rU435,rU436,rU437,rU438,rU439,rU440,rU441,rU442,...
    rU443,rU444,rU445,rU446,rU447,rU448,rU449,rU450,rU451,rU452,rU453,rU454,rU455,rU456,...
    rU457,rU458,rU459,rU460,rU461,rU462,rU463,rU464,rU465,rU466,rU467,rU468,rU469,rU470,...
    rU471,rU472,rU473,rU474,rU475,rU476,rU477,rU478,rU479,rU480,rU481,rU482,rU483,rU484,...
    rU485,rU486,rU487,rU488,rU489,rU490,rU491,rU492,rU493,rU494,rU495,rU496,rU497,rU498,...
    rU499,rU4100,rU4101,rU4102,rU4103,rU4104,rU4105,rU4106,rU4107,rU4108,rU4109,rU4110,...
    rU4111,rU4112,rU4113,rU4114,rU4115,rU4116,rU4117,rU4118,rU4119,rU4120,rU4121,rU4122,...
    rU4123,rU51,rU52,rU53,rU54,rU55,rU56,rU57,rU58,rU59,rU510,rU511,rU512,rU513,rU514,...
    rU515,rU516,rU517,rU518,rU519,rU520,rU521,rU522,rU523,rU524,rU525,rU526,rU527,rU528,...
    rU529,rU530,rU531,rU532,rU533,rU534,rU535,rU536,rU537,rU538,rU539,rU540,rU541,rU542,...
    rU543,rU544,rU545,rU546,rU547,rU548,rU549,rU550,rU551,rU552,rU553,rU554,rU555,rU556,...
    rU557,rU558,rU559,rU560,rU561,rU562,rU563,rU564,rU565,rU566,rU567,rU568,rU569,rU570,...
    rU571,rU572,rU573,rU574,rU575,rU576,rU577,rU578,rU579,rU580,rU581,rU582,rU583,rU584,...
    rU585,rU586,rU587,rU588,rU589,rU590,rU591,rU592,rU593,rU594,rU595,rU596,rU597,rU598,...
    rU599,rU5100,rU5101,rU5102,rU5103,rU5104,rU5105,rU5106,rU5107,rU5108,rU5109,...
    rU5110,rU5111,rU5112,rU5113,rU5114,rU5115,rU5116,rU5117,rU5118,rU5119,rU5120,...
    rU5121,rU5122,rU5123]...
    =Mandami(x,ArU1,ArU2,ArU3,ArU4,ArU5,ArU6,ArU7,ArU8,ArU9,ArU10,ArU11,...
    ArU12,ArU13,ArU14,ArU15,ArU16,ArU17,ArU18,ArU19,ArU20,ArU21,ArU22,...
    ArU23,ArU24,ArU25,ArU26,ArU27,ArU28,ArU29,ArU30,ArU31,ArU32,ArU33,...
    ArU34,ArU35,ArU36,ArU37,ArU38,ArU39,ArU40,ArU41,ArU42,ArU43,ArU44,...
    ArU45,ArU46,ArU47,ArU48,ArU49,ArU50,ArU51,ArU52,ArU53,ArU54,ArU55,...
    ArU56,ArU57,ArU58,ArU59,ArU60,ArU61,ArU62,ArU63,ArU64,ArU65,ArU66,...
    ArU67,ArU68,ArU69,ArU70,ArU71,ArU72,ArU73,ArU74,ArU75,ArU76,ArU77,ArU78,ArU79,...
    ArU80,ArU81,ArU82,ArU83,ArU84,ArU85,ArU86,ArU87,ArU88,ArU89,ArU90,ArU91,ArU92,...
    ArU93,ArU94,ArU95,ArU96,ArU97,ArU98,ArU99,ArU100,ArU101,ArU102,ArU103,ArU104,...
    ArU105,ArU106,ArU107,ArU108,ArU109,ArU110,ArU111,ArU112,ArU113,ArU114,ArU115,...
    ArU116,ArU117,ArU118,ArU119,ArU120,ArU121,ArU122,ArU123,YCF1,YCF2,YCF3,YCF4,...
    YCF5,YCF6,YDC1,YDC2,YDC3,YDC4,YDC5,YDE1,...
    YDE2,YDE3,YDE4,YDE5,YDE6,YDE7,YDE8,YDE9,YDE10,YDE11,YDE12,YDE13,YDE14,...
    YDE15,YDE16,YDE17,YDE18,YDE19,YDE20,YDF1,YDF2,YDF3,YDF4,YDF5,YDF6,YDF7,...
    YDF8,YDF9,YDF10,YDF11,YDF12,YDF13,YDF14,YDF15,YDF16,YDF17,YDF18,YDF19,YDF20,...
    YDF21,YDF22,YDF23,YDF24,YDF25,YDF26,YDF27,YDF28,YDF29,YDF30,YDF31,YDG1,...
    YDG2,YDG3,YDG4);

% Then Mandani implications are calculated for the LMF
[rL11,rL12 ,rL13,rL14,rL15,rL16,rL17,rL18,rL19,rL110,rL111,rL112,rL113,rL114,...
    rL115,rL116,rL117,rL118,rL119,rL120,rL121,rL122,rL123,rL124,rL125,rL126,rL127,rL128,...
    rL129,rL130,rL131,rL132,rL133,rL134,rL135,rL136,rL137,rL138,rL139,rL140,rL141,rL142,...
    rL143,rL144,rL145,rL146,rL147,rL148,rL149,rL150,rL151,rL152,rL153,rL154,rL155,rL156,...
    rL157,rL158,rL159,rL160,rL161,rL162,rL163,rL164,rL165,rL166,rL167,rL168,rL169,rL170,...
    rL171,rL172,rL173,rL174,rL175,rL176,rL177,rL178,rL179,rL180,rL181,rL182,rL183,rL184,...
    rL185,rL186,rL187,rL188,rL189,rL190,rL191,rL192,rL193,rL194,rL195,rL196,rL197,rL198,...
    rL199,rL1100,rL1101,rL1102,rL1103,rL1104,rL1105,rL1106,rL1107,rL1108,rL1109,rL1110,...
    rL1111,rL1112,rL1113,rL1114,rL1115,rL1116,rL1117,rL1118,rL1119,rL1120,rL1121,rL1122,...
    rL1123,rL21,rL22,rL23,rL24,rL25,rL26,rL27,rL28,rL29,rL210,rL211,rL212,rL213,rL214,...
    rL215,rL216,rL217,rL218,rL219,rL220,rL221,rL222,rL223,rL224,rL225,rL226,rL227,rL228,...
    rL229,rL230,rL231,rL232,rL233,rL234,rL235,rL236,rL237,rL238,rL239,rL240,rL241,rL242,...
    rL243,rL244,rL245,rL246,rL247,rL248,rL249,rL250,rL251,rL252,rL253,rL254,rL255,rL256,...
    rL257,rL258,rL259,rL260,rL261,rL262,rL263,rL264,rL265,rL266,rL267,rL268,rL269,rL270,...
    rL271,rL272,rL273,rL274,rL275,rL276,rL277,rL278,rL279,rL280,rL281,rL282,rL283,rL284,...
    rL285,rL286,rL287,rL288,rL289,rL290,rL291,rL292,rL293,rL294,rL295,rL296,rL297,rL298,...
    rL299,rL2100,rL2101,rL2102,rL2103,rL2104,rL2105,rL2106,rL2107,rL2108,rL2109,rL2110,...
    rL2111,rL2112,rL2113,rL2114,rL2115,rL2116,rL2117,rL2118,rL2119,rL2120,rL2121,rL2122,...
    rL2123,rL31,rL32,rL33,rL34,rL35,rL36,rL37,rL38,rL39,rL310,rL311,rL312,rL313,rL314,...
    rL315,rL316,rL317,rL318,rL319,rL320,rL321,rL322,rL323,rL324,rL325,rL326,rL327,rL328,...
    rL329,rL330,rL331,rL332,rL333,rL334,rL335,rL336,rL337,rL338,rL339,rL340,rL341,rL342,...
    rL343,rL344,rL345,rL346,rL347,rL348,rL349,rL350,rL351,rL352,rL353,rL354,rL355,rL356,...
    rL357,rL358,rL359,rL360,rL361,rL362,rL363,rL364,rL365,rL366,rL367,rL368,rL369,rL370,...
    rL371,rL372,rL373,rL374,rL375,rL376,rL377,rL378,rL379,rL380,rL381,rL382,rL383,rL384,...
    rL385,rL386,rL387,rL388,rL389,rL390,rL391,rL392,rL393,rL394,rL395,rL396,rL397,rL398,...
    rL399,rL3100,rL3101,rL3102,rL3103,rL3104,rL3105,rL3106,rL3107,rL3108,rL3109,rL3110,...
    rL3111,rL3112,rL3113,rL3114,rL3115,rL3116,rL3117,rL3118,rL3119,rL3120,rL3121,rL3122,...
    rL3123,rL41,rL42,rL43,rL44,rL45,rL46,rL47,rL48,rL49,rL410,rL411,rL412,rL413,rL414,...
    rL415,rL416,rL417,rL418,rL419,rL420,rL421,rL422,rL423,rL424,rL425,rL426,rL427,rL428,...
    rL429,rL430,rL431,rL432,rL433,rL434,rL435,rL436,rL437,rL438,rL439,rL440,rL441,rL442,...
    rL443,rL444,rL445,rL446,rL447,rL448,rL449,rL450,rL451,rL452,rL453,rL454,rL455,rL456,...
    rL457,rL458,rL459,rL460,rL461,rL462,rL463,rL464,rL465,rL466,rL467,rL468,rL469,rL470,...
    rL471,rL472,rL473,rL474,rL475,rL476,rL477,rL478,rL479,rL480,rL481,rL482,rL483,rL484,...
    rL485,rL486,rL487,rL488,rL489,rL490,rL491,rL492,rL493,rL494,rL495,rL496,rL497,rL498,...
    rL499,rL4100,rL4101,rL4102,rL4103,rL4104,rL4105,rL4106,rL4107,rL4108,rL4109,rL4110,...
    rL4111,rL4112,rL4113,rL4114,rL4115,rL4116,rL4117,rL4118,rL4119,rL4120,rL4121,rL4122,...
    rL4123,rL51,rL52,rL53,rL54,rL55,rL56,rL57,rL58,rL59,rL510,rL511,rL512,rL513,rL514,...
    rL515,rL516,rL517,rL518,rL519,rL520,rL521,rL522,rL523,rL524,rL525,rL526,rL527,rL528,...
    rL529,rL530,rL531,rL532,rL533,rL534,rL535,rL536,rL537,rL538,rL539,rL540,rL541,rL542,...
    rL543,rL544,rL545,rL546,rL547,rL548,rL549,rL550,rL551,rL552,rL553,rL554,rL555,rL556,...
    rL557,rL558,rL559,rL560,rL561,rL562,rL563,rL564,rL565,rL566,rL567,rL568,rL569,rL570,...
    rL571,rL572,rL573,rL574,rL575,rL576,rL577,rL578,rL579,rL580,rL581,rL582,rL583,rL584,...
    rL585,rL586,rL587,rL588,rL589,rL590,rL591,rL592,rL593,rL594,rL595,rL596,rL597,rL598,...
    rL599,rL5100,rL5101,rL5102,rL5103,rL5104,rL5105,rL5106,rL5107,rL5108,rL5109,...
    rL5110,rL5111,rL5112,rL5113,rL5114,rL5115,rL5116,rL5117,rL5118,rL5119,rL5120,...
    rL5121,rL5122,rL5123]...
    =Mandami(x,ArL1,ArL2,ArL3,ArL4,ArL5,ArL6,ArL7,ArL8,ArL9,ArL10,ArL11,...
    ArL12,ArL13,ArL14,ArL15,ArL16,ArL17,ArL18,ArL19,ArL20,ArL21,ArL22,...
    ArL23,ArL24,ArL25,ArL26,ArL27,ArL28,ArL29,ArL30,ArL31,ArL32,ArL33,...
    ArL34,ArL35,ArL36,ArL37,ArL38,ArL39,ArL40,ArL41,ArL42,ArL43,ArL44,...
    ArL45,ArL46,ArL47,ArL48,ArL49,ArL50,ArL51,ArL52,ArL53,ArL54,ArL55,...
    ArL56,ArL57,ArL58,ArL59,ArL60,ArL61,ArL62,ArL63,ArL64,ArL65,ArL66,...
    ArL67,ArL68,ArL69,ArL70,ArL71,ArL72,ArL73,ArL74,ArL75,ArL76,ArL77,ArL78,ArL79,...
    ArL80,ArL81,ArL82,ArL83,ArL84,ArL85,ArL86,ArL87,ArL88,ArL89,ArL90,ArL91,ArL92,...
    ArL93,ArL94,ArL95,ArL96,ArL97,ArL98,ArL99,ArL100,ArL101,ArL102,ArL103,ArL104,...
    ArL105,ArL106,ArL107,ArL108,ArL109,ArL110,ArL111,ArL112,ArL113,ArL114,ArL115,...
    ArL116,ArL117,ArL118,ArL119,ArL120,ArL121,ArL122,ArL123,YCF1,YCF2,YCF3,YCF4,...
    YCF5,YCF6,YDC1,YDC2,YDC3,YDC4,YDC5,YDE1,...
    YDE2,YDE3,YDE4,YDE5,YDE6,YDE7,YDE8,YDE9,YDE10,YDE11,YDE12,YDE13,YDE14,...
    YDE15,YDE16,YDE17,YDE18,YDE19,YDE20,YDF1,YDF2,YDF3,YDF4,YDF5,YDF6,YDF7,...
    YDF8,YDF9,YDF10,YDF11,YDF12,YDF13,YDF14,YDF15,YDF16,YDF17,YDF18,YDF19,YDF20,...
    YDF21,YDF22,YDF23,YDF24,YDF25,YDF26,YDF27,YDF28,YDF29,YDF30,YDF31,YDG1,...
    YDG2,YDG3,YDG4);

%display(rL11);
%display(rL12);
%plot(x,rL521);
%hold on

%Then the output functions are matrixed for UMF:
[OU1,OU2,OU3,OU4,OU5]=Matr(rU11,rU12 ,rU13,rU14,rU15,rU16,rU17,rU18,rU19,rU110,rU111,rU112,rU113,rU114,...
    rU115,rU116,rU117,rU118,rU119,rU120,rU121,rU122,rU123,rU124,rU125,rU126,rU127,rU128,...
    rU129,rU130,rU131,rU132,rU133,rU134,rU135,rU136,rU137,rU138,rU139,rU140,rU141,rU142,...
    rU143,rU144,rU145,rU146,rU147,rU148,rU149,rU150,rU151,rU152,rU153,rU154,rU155,rU156,...
    rU157,rU158,rU159,rU160,rU161,rU162,rU163,rU164,rU165,rU166,rU167,rU168,rU169,rU170,...
    rU171,rU172,rU173,rU174,rU175,rU176,rU177,rU178,rU179,rU180,rU181,rU182,rU183,rU184,...
    rU185,rU186,rU187,rU188,rU189,rU190,rU191,rU192,rU193,rU194,rU195,rU196,rU197,rU198,...
    rU199,rU1100,rU1101,rU1102,rU1103,rU1104,rU1105,rU1106,rU1107,rU1108,rU1109,rU1110,...
    rU1111,rU1112,rU1113,rU1114,rU1115,rU1116,rU1117,rU1118,rU1119,rU1120,rU1121,rU1122,...
    rU1123,rU21,rU22,rU23,rU24,rU25,rU26,rU27,rU28,rU29,rU210,rU211,rU212,rU213,rU214,...
    rU215,rU216,rU217,rU218,rU219,rU220,rU221,rU222,rU223,rU224,rU225,rU226,rU227,rU228,...
    rU229,rU230,rU231,rU232,rU233,rU234,rU235,rU236,rU237,rU238,rU239,rU240,rU241,rU242,...
    rU243,rU244,rU245,rU246,rU247,rU248,rU249,rU250,rU251,rU252,rU253,rU254,rU255,rU256,...
    rU257,rU258,rU259,rU260,rU261,rU262,rU263,rU264,rU265,rU266,rU267,rU268,rU269,rU270,...
    rU271,rU272,rU273,rU274,rU275,rU276,rU277,rU278,rU279,rU280,rU281,rU282,rU283,rU284,...
    rU285,rU286,rU287,rU288,rU289,rU290,rU291,rU292,rU293,rU294,rU295,rU296,rU297,rU298,...
    rU299,rU2100,rU2101,rU2102,rU2103,rU2104,rU2105,rU2106,rU2107,rU2108,rU2109,rU2110,...
    rU2111,rU2112,rU2113,rU2114,rU2115,rU2116,rU2117,rU2118,rU2119,rU2120,rU2121,rU2122,...
    rU2123,rU31,rU32,rU33,rU34,rU35,rU36,rU37,rU38,rU39,rU310,rU311,rU312,rU313,rU314,...
    rU315,rU316,rU317,rU318,rU319,rU320,rU321,rU322,rU323,rU324,rU325,rU326,rU327,rU328,...
    rU329,rU330,rU331,rU332,rU333,rU334,rU335,rU336,rU337,rU338,rU339,rU340,rU341,rU342,...
    rU343,rU344,rU345,rU346,rU347,rU348,rU349,rU350,rU351,rU352,rU353,rU354,rU355,rU356,...
    rU357,rU358,rU359,rU360,rU361,rU362,rU363,rU364,rU365,rU366,rU367,rU368,rU369,rU370,...
    rU371,rU372,rU373,rU374,rU375,rU376,rU377,rU378,rU379,rU380,rU381,rU382,rU383,rU384,...
    rU385,rU386,rU387,rU388,rU389,rU390,rU391,rU392,rU393,rU394,rU395,rU396,rU397,rU398,...
    rU399,rU3100,rU3101,rU3102,rU3103,rU3104,rU3105,rU3106,rU3107,rU3108,rU3109,rU3110,...
    rU3111,rU3112,rU3113,rU3114,rU3115,rU3116,rU3117,rU3118,rU3119,rU3120,rU3121,rU3122,...
    rU3123,rU41,rU42,rU43,rU44,rU45,rU46,rU47,rU48,rU49,rU410,rU411,rU412,rU413,rU414,...
    rU415,rU416,rU417,rU418,rU419,rU420,rU421,rU422,rU423,rU424,rU425,rU426,rU427,rU428,...
    rU429,rU430,rU431,rU432,rU433,rU434,rU435,rU436,rU437,rU438,rU439,rU440,rU441,rU442,...
    rU443,rU444,rU445,rU446,rU447,rU448,rU449,rU450,rU451,rU452,rU453,rU454,rU455,rU456,...
    rU457,rU458,rU459,rU460,rU461,rU462,rU463,rU464,rU465,rU466,rU467,rU468,rU469,rU470,...
    rU471,rU472,rU473,rU474,rU475,rU476,rU477,rU478,rU479,rU480,rU481,rU482,rU483,rU484,...
    rU485,rU486,rU487,rU488,rU489,rU490,rU491,rU492,rU493,rU494,rU495,rU496,rU497,rU498,...
    rU499,rU4100,rU4101,rU4102,rU4103,rU4104,rU4105,rU4106,rU4107,rU4108,rU4109,rU4110,...
    rU4111,rU4112,rU4113,rU4114,rU4115,rU4116,rU4117,rU4118,rU4119,rU4120,rU4121,rU4122,...
    rU4123,rU51,rU52,rU53,rU54,rU55,rU56,rU57,rU58,rU59,rU510,rU511,rU512,rU513,rU514,...
    rU515,rU516,rU517,rU518,rU519,rU520,rU521,rU522,rU523,rU524,rU525,rU526,rU527,rU528,...
    rU529,rU530,rU531,rU532,rU533,rU534,rU535,rU536,rU537,rU538,rU539,rU540,rU541,rU542,...
    rU543,rU544,rU545,rU546,rU547,rU548,rU549,rU550,rU551,rU552,rU553,rU554,rU555,rU556,...
    rU557,rU558,rU559,rU560,rU561,rU562,rU563,rU564,rU565,rU566,rU567,rU568,rU569,rU570,...
    rU571,rU572,rU573,rU574,rU575,rU576,rU577,rU578,rU579,rU580,rU581,rU582,rU583,rU584,...
    rU585,rU586,rU587,rU588,rU589,rU590,rU591,rU592,rU593,rU594,rU595,rU596,rU597,rU598,...
    rU599,rU5100,rU5101,rU5102,rU5103,rU5104,rU5105,rU5106,rU5107,rU5108,rU5109,...
    rU5110,rU5111,rU5112,rU5113,rU5114,rU5115,rU5116,rU5117,rU5118,rU5119,rU5120,...
    rU5121,rU5122,rU5123);

%Then the output functions are matrixed for LMF:
[OL1,OL2,OL3,OL4,OL5]=Matr(rL11,rL12 ,rL13,rL14,rL15,rL16,rL17,rL18,rL19,rL110,rL111,rL112,rL113,rL114,...
    rL115,rL116,rL117,rL118,rL119,rL120,rL121,rL122,rL123,rL124,rL125,rL126,rL127,rL128,...
    rL129,rL130,rL131,rL132,rL133,rL134,rL135,rL136,rL137,rL138,rL139,rL140,rL141,rL142,...
    rL143,rL144,rL145,rL146,rL147,rL148,rL149,rL150,rL151,rL152,rL153,rL154,rL155,rL156,...
    rL157,rL158,rL159,rL160,rL161,rL162,rL163,rL164,rL165,rL166,rL167,rL168,rL169,rL170,...
    rL171,rL172,rL173,rL174,rL175,rL176,rL177,rL178,rL179,rL180,rL181,rL182,rL183,rL184,...
    rL185,rL186,rL187,rL188,rL189,rL190,rL191,rL192,rL193,rL194,rL195,rL196,rL197,rL198,...
    rL199,rL1100,rL1101,rL1102,rL1103,rL1104,rL1105,rL1106,rL1107,rL1108,rL1109,rL1110,...
    rL1111,rL1112,rL1113,rL1114,rL1115,rL1116,rL1117,rL1118,rL1119,rL1120,rL1121,rL1122,...
    rL1123,rL21,rL22,rL23,rL24,rL25,rL26,rL27,rL28,rL29,rL210,rL211,rL212,rL213,rL214,...
    rL215,rL216,rL217,rL218,rL219,rL220,rL221,rL222,rL223,rL224,rL225,rL226,rL227,rL228,...
    rL229,rL230,rL231,rL232,rL233,rL234,rL235,rL236,rL237,rL238,rL239,rL240,rL241,rL242,...
    rL243,rL244,rL245,rL246,rL247,rL248,rL249,rL250,rL251,rL252,rL253,rL254,rL255,rL256,...
    rL257,rL258,rL259,rL260,rL261,rL262,rL263,rL264,rL265,rL266,rL267,rL268,rL269,rL270,...
    rL271,rL272,rL273,rL274,rL275,rL276,rL277,rL278,rL279,rL280,rL281,rL282,rL283,rL284,...
    rL285,rL286,rL287,rL288,rL289,rL290,rL291,rL292,rL293,rL294,rL295,rL296,rL297,rL298,...
    rL299,rL2100,rL2101,rL2102,rL2103,rL2104,rL2105,rL2106,rL2107,rL2108,rL2109,rL2110,...
    rL2111,rL2112,rL2113,rL2114,rL2115,rL2116,rL2117,rL2118,rL2119,rL2120,rL2121,rL2122,...
    rL2123,rL31,rL32,rL33,rL34,rL35,rL36,rL37,rL38,rL39,rL310,rL311,rL312,rL313,rL314,...
    rL315,rL316,rL317,rL318,rL319,rL320,rL321,rL322,rL323,rL324,rL325,rL326,rL327,rL328,...
    rL329,rL330,rL331,rL332,rL333,rL334,rL335,rL336,rL337,rL338,rL339,rL340,rL341,rL342,...
    rL343,rL344,rL345,rL346,rL347,rL348,rL349,rL350,rL351,rL352,rL353,rL354,rL355,rL356,...
    rL357,rL358,rL359,rL360,rL361,rL362,rL363,rL364,rL365,rL366,rL367,rL368,rL369,rL370,...
    rL371,rL372,rL373,rL374,rL375,rL376,rL377,rL378,rL379,rL380,rL381,rL382,rL383,rL384,...
    rL385,rL386,rL387,rL388,rL389,rL390,rL391,rL392,rL393,rL394,rL395,rL396,rL397,rL398,...
    rL399,rL3100,rL3101,rL3102,rL3103,rL3104,rL3105,rL3106,rL3107,rL3108,rL3109,rL3110,...
    rL3111,rL3112,rL3113,rL3114,rL3115,rL3116,rL3117,rL3118,rL3119,rL3120,rL3121,rL3122,...
    rL3123,rL41,rL42,rL43,rL44,rL45,rL46,rL47,rL48,rL49,rL410,rL411,rL412,rL413,rL414,...
    rL415,rL416,rL417,rL418,rL419,rL420,rL421,rL422,rL423,rL424,rL425,rL426,rL427,rL428,...
    rL429,rL430,rL431,rL432,rL433,rL434,rL435,rL436,rL437,rL438,rL439,rL440,rL441,rL442,...
    rL443,rL444,rL445,rL446,rL447,rL448,rL449,rL450,rL451,rL452,rL453,rL454,rL455,rL456,...
    rL457,rL458,rL459,rL460,rL461,rL462,rL463,rL464,rL465,rL466,rL467,rL468,rL469,rL470,...
    rL471,rL472,rL473,rL474,rL475,rL476,rL477,rL478,rL479,rL480,rL481,rL482,rL483,rL484,...
    rL485,rL486,rL487,rL488,rL489,rL490,rL491,rL492,rL493,rL494,rL495,rL496,rL497,rL498,...
    rL499,rL4100,rL4101,rL4102,rL4103,rL4104,rL4105,rL4106,rL4107,rL4108,rL4109,rL4110,...
    rL4111,rL4112,rL4113,rL4114,rL4115,rL4116,rL4117,rL4118,rL4119,rL4120,rL4121,rL4122,...
    rL4123,rL51,rL52,rL53,rL54,rL55,rL56,rL57,rL58,rL59,rL510,rL511,rL512,rL513,rL514,...
    rL515,rL516,rL517,rL518,rL519,rL520,rL521,rL522,rL523,rL524,rL525,rL526,rL527,rL528,...
    rL529,rL530,rL531,rL532,rL533,rL534,rL535,rL536,rL537,rL538,rL539,rL540,rL541,rL542,...
    rL543,rL544,rL545,rL546,rL547,rL548,rL549,rL550,rL551,rL552,rL553,rL554,rL555,rL556,...
    rL557,rL558,rL559,rL560,rL561,rL562,rL563,rL564,rL565,rL566,rL567,rL568,rL569,rL570,...
    rL571,rL572,rL573,rL574,rL575,rL576,rL577,rL578,rL579,rL580,rL581,rL582,rL583,rL584,...
    rL585,rL586,rL587,rL588,rL589,rL590,rL591,rL592,rL593,rL594,rL595,rL596,rL597,rL598,...
    rL599,rL5100,rL5101,rL5102,rL5103,rL5104,rL5105,rL5106,rL5107,rL5108,rL5109,...
    rL5110,rL5111,rL5112,rL5113,rL5114,rL5115,rL5116,rL5117,rL5118,rL5119,rL5120,...
    rL5121,rL5122,rL5123);


%The output functions in an array is obtained for the UMF
[outU1,outU2,outU3,outU4,outU5] = Maximo(OU1,OU2,OU3,OU4,OU5);
%plot(x,outU1);
%hold on;

%The output functions in an array is obtained for the LMF:
[outL1,outL2,outL3,outL4,outL5] = Maximo(OL1,OL2,OL3,OL4,OL5);
%plot(x,outL1);


% The  EIASC method is used for defuzzification :
outNT = EIASC(outU1,outL1,x,1);
outNM = EIASC(outU2,outL2,x,1);
outNCR = EIASC(outU3,outL3,x,1);
outNTB = EIASC(outU4,outL4,x,1);
outNZF = EIASC(outU5,outL5,x,1);

% Output definitions:

[New_Tech, New_Mod, New_CR, New_TB, New_ZBFreq]= Out_Final(outNT, outNM,...
    outNCR, outNTB, outNZF);

display(New_Tech)
display(New_Mod)
display(New_CR)
display(New_TB)
display(New_ZBFreq)

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [YCF1,YCF2,YCF3,YCF4,YCF5,YCF6,YDC1,YDC2,YDC3,YDC4,YDC5,YDE1,...
    YDE2,YDE3,YDE4,YDE5,YDE6,YDE7,YDE8,YDE9,YDE10,YDE11,YDE12,YDE13,YDE14,...
    YDE15,YDE16,YDE17,YDE18,YDE19,YDE20,YDF1,YDF2,YDF3,YDF4,YDF5,YDF6,YDF7,...
    YDF8,YDF9,YDF10,YDF11,YDF12,YDF13,YDF14,YDF15,YDF16,YDF17,YDF18,YDF19,YDF20,...
    YDF21,YDF22,YDF23,YDF24,YDF25,YDF26,YDF27,YDF28,YDF29,YDF30,YDF31,YDG1,...
    YDG2,YDG3,YDG4]=Initial_Var_Out(x)

% Technology chosen
y1c1= 0.0833; %Zigbee
y1c2 = 0.25; % HSPA Neighbor
y1c3= 0.4166; % HSPA Serving
y1c4= 0.5833; % LET Neighbor
y1c5= 0.75; % LTE Serving
y1c6= 0.9166; % WLAN
stdy1 = (y1c2 - y1c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YC1= [0 0 y1c1 y1c1+stdy1]; %  Trapezoidal for having the whole spectrum covered
YC2 = [y1c2-stdy1 y1c2 y1c2+stdy1]; % Triangular
YC3 = [y1c3-stdy1 y1c3 y1c3+stdy1]; % Triangular
YC4 = [y1c4-stdy1 y1c4 y1c4+stdy1]; % Triangular
YC5 = [y1c5-stdy1 y1c5 y1c5+stdy1]; % Triangular
YC6 = [y1c6-stdy1 y1c6 10 10]; %  Trapezoidal for having the whole spectrum covered

YCF1 = trapmf(x,YC1);
YCF2 = trimf(x,YC2);
YCF3 = trimf(x,YC3);
YCF4 = trimf(x,YC4);
YCF5 = trimf(x,YC5);
YCF6 = trapmf(x,YC6);

% New Modulation
y2c1= 0.10; % 64-QAM
y2c2= 0.30; % 16-QAM
y2c3= 0.50; % QPSK
y2c4= 0.70; % O-QPSK
y2c5= 0.90; % BPSK
stdy2 = (y2c2 - y2c1)/2;  % Std Dev is calculated as half of the distance of the centers


YD1= [0 0 y2c1 y2c1+stdy2]; %  Trapezoidal for having the whole spectrum covered
YD2 = [y2c2-stdy2 y2c2 y2c2+stdy2]; % Triangular
YD3 = [y2c3-stdy2 y2c3 y2c3+stdy2]; % Triangular
YD4 = [y2c4-stdy2 y2c4 y2c4+stdy2]; % Triangular
YD5 = [y2c5-stdy2 y2c5 10 10]; %  Trapezoidal for having the whole spectrum covered

YDC1 = trapmf(x,YD1);
YDC2 = trimf(x,YD2);
YDC3 = trimf(x,YD3);
YDC4 = trimf(x,YD4);
YDC5 = trapmf(x,YD5);

% New Code Rate - Ordered from less to highest
y3c1= 0.03; % 0.08
y3c2= 0.08; % 0.12
y3c3= 0.13; % 0.19
y3c4= 0.18; % 0.3
y3c5= 0.23; % 0.37
y3c6= 0.28; % 0.44
y3c7= 0.33; % 0.46
y3c8= 0.38; % 0.48
y3c9= 0.43; % 0.5
y3c10= 0.48; % 0.55
y3c11= 0.53; % 0.59
y3c12= 0.58; % 0.60
y3c13= 0.63; % 0.65
y3c14= 0.68; % 0.66
y3c15= 0.73; % 0.75
y3c16= 0.78; % 0.7539
y3c17= 0.83; % 0.83
y3c18= 0.88; % 0.85
y3c19= 0.93; % 0.93
y3c20= 0.98; % 0 Sin Code Rate
stdy3 = (y3c2 - y3c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YE1= [0 0 y3c1 y3c1+stdy3]; %  Trapezoidal for having the whole spectrum covered
YE2 = [y3c2-stdy3 y3c2 y3c2+stdy3]; % Triangular
YE3 = [y3c3-stdy3 y3c3 y3c3+stdy3]; % Triangular
YE4 = [y3c4-stdy3 y3c4 y3c4+stdy3]; % Triangular
YE5 = [y3c5-stdy3 y3c5 y3c5+stdy3]; % Triangular
YE6 = [y3c6-stdy3 y3c6 y3c6+stdy3]; % Triangular
YE7 = [y3c7-stdy3 y3c7 y3c7+stdy3]; % Triangular
YE8 = [y3c8-stdy3 y3c8 y3c8+stdy3]; % Triangular
YE9 = [y3c9-stdy3 y3c9 y3c9+stdy3]; % Triangular
YE10 = [y3c10-stdy3 y3c10 y3c10+stdy3]; % Triangular
YE11 = [y3c11-stdy3 y3c11 y3c11+stdy3]; % Triangular
YE12 = [y3c12-stdy3 y3c12 y3c12+stdy3]; % Triangular
YE13 = [y3c13-stdy3 y3c13 y3c13+stdy3]; % Triangular
YE14 = [y3c14-stdy3 y3c14 y3c14+stdy3]; % Triangular
YE15 = [y3c15-stdy3 y3c15 y3c15+stdy3]; % Triangular
YE16 = [y3c16-stdy3 y3c16 y3c16+stdy3]; % Triangular
YE17 = [y3c17-stdy3 y3c17 y3c17+stdy3]; % Triangular
YE18 = [y3c18-stdy3 y3c18 y3c18+stdy3]; % Triangular
YE19 = [y3c19-stdy3 y3c19 y3c19+stdy3]; % Triangular
YE20 = [y3c20-stdy3 y3c20 10 10]; %  Trapezoidal for having the whole spectrum covered

YDE1 = trapmf(x,YE1);
YDE2 = trimf(x,YE2);
YDE3 = trimf(x,YE3);
YDE4 = trimf(x,YE4);
YDE5 = trimf(x,YE5);
YDE6 = trimf(x,YE6);
YDE7 = trimf(x,YE7);
YDE8 = trimf(x,YE8);
YDE9 = trimf(x,YE9);
YDE10 = trimf(x,YE10);
YDE11 = trimf(x,YE11);
YDE12 = trimf(x,YE12);
YDE13 = trimf(x,YE13);
YDE14 = trimf(x,YE14);
YDE15 = trimf(x,YE15);
YDE16 = trimf(x,YE16);
YDE17 = trimf(x,YE17);
YDE18 = trimf(x,YE18);
YDE19 = trimf(x,YE19);
YDE20 = trapmf(x,YE20);
% New Transport Block Size  - Ordered from less to highest

y4c1= 0.03125; % 136
y4c2= 0.0625; % 176
y4c3= 0.09375; % 232
y4c4= 0.125; % 320
y4c5= 0.15625; % 376
y4c6= 0.1875; % 464
y4c7= 0.21875; % 648
y4c8= 0.25; % 792
y4c9= 0.28125; % 928
y4c10= 0.3125; % 1264
y4c11= 0.34375; % 1488
y4c12= 0.375; % 1744
y4c13= 0.40625; % 2288
y4c14= 0.4375; % 2592
y4c15= 0.46875; % 3328
y4c16= 0.5; % 3576
y4c17= 0.53125; % 4200
y4c18= 0.5625; % 4672
y4c19= 0.59375; % 5296
y4c20= 0.625; % 5896
y4c21= 0.65625; % 6568
y4c22= 0.6875; % 7184
y4c23= 0.71875; % 9736
y4c24= 0.75; % 11432
y4c25= 0.78125; % 14424
y4c26= 0.8125; % 15776
y4c27= 0.84375; % 21768
y4c28= 0.875; % 26504
y4c29= 0.90625; % 32264
y4c30= 0.9375; % 38576
y4c31= 0.96875; % 0 - No Transport Block size
stdy4 = (y4c2 - y4c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YF1= [0 0 y4c1 y4c1+stdy4]; %  Trapezoidal for having the whole spectrum covered
YF2 = [y4c2-stdy4 y4c2 y4c2+stdy4]; % Triangular
YF3 = [y4c3-stdy4 y4c3 y4c3+stdy4]; % Triangular
YF4 = [y4c4-stdy4 y4c4 y4c4+stdy4]; % Triangular
YF5 = [y4c5-stdy4 y4c5 y4c5+stdy4]; % Triangular
YF6 = [y4c6-stdy4 y4c6 y4c6+stdy4]; % Triangular
YF7 = [y4c7-stdy4 y4c7 y4c7+stdy4]; % Triangular
YF8 = [y4c8-stdy4 y4c8 y4c8+stdy4]; % Triangular
YF9 = [y4c9-stdy4 y4c9 y4c9+stdy4]; % Triangular
YF10 = [y4c10-stdy4 y4c10 y4c10+stdy4]; % Triangular
YF11 = [y4c11-stdy4 y4c11 y4c11+stdy4]; % Triangular
YF12 = [y4c12-stdy4 y4c12 y4c12+stdy4]; % Triangular
YF13 = [y4c13-stdy4 y4c13 y4c13+stdy4]; % Triangular
YF14 = [y4c14-stdy4 y4c14 y4c14+stdy4]; % Triangular
YF15 = [y4c15-stdy4 y4c15 y4c15+stdy4]; % Triangular
YF16 = [y4c16-stdy4 y4c16 y4c16+stdy4]; % Triangular
YF17 = [y4c17-stdy4 y4c17 y4c17+stdy4]; % Triangular
YF18 = [y4c18-stdy4 y4c18 y4c18+stdy4]; % Triangular
YF19 = [y4c19-stdy4 y4c19 y4c19+stdy4]; % Triangular
YF20 = [y4c20-stdy4 y4c20 y4c20+stdy4]; % Triangular
YF21 = [y4c21-stdy4 y4c21 y4c21+stdy4]; % Triangular
YF22 = [y4c22-stdy4 y4c22 y4c22+stdy4]; % Triangular
YF23 = [y4c23-stdy4 y4c23 y4c23+stdy4]; % Triangular
YF24 = [y4c24-stdy4 y4c24 y4c24+stdy4]; % Triangular
YF25 = [y4c25-stdy4 y4c25 y4c25+stdy4]; % Triangular
YF26 = [y4c26-stdy4 y4c26 y4c26+stdy4]; % Triangular
YF27 = [y4c27-stdy4 y4c27 y4c27+stdy4]; % Triangular
YF28 = [y4c28-stdy4 y4c28 y4c28+stdy4]; % Triangular
YF29 = [y4c29-stdy4 y4c29 y4c29+stdy4]; % Triangular
YF30 = [y4c30-stdy4 y4c30 y4c30+stdy4]; % Triangular
YF31 = [y4c31-stdy4 y4c31 10 10]; %  Trapezoidal for having the whole spectrum covered


YDF1 = trapmf(x,YF1);
YDF2 = trimf(x,YF2);
YDF3 = trimf(x,YF3);
YDF4 = trimf(x,YF4);
YDF5 = trimf(x,YF5);
YDF6 = trimf(x,YF6);
YDF7 = trimf(x,YF7);
YDF8 = trimf(x,YF8);
YDF9 = trimf(x,YF9);
YDF10 = trimf(x,YF10);
YDF11 = trimf(x,YF11);
YDF12 = trimf(x,YF12);
YDF13 = trimf(x,YF13);
YDF14 = trimf(x,YF14);
YDF15 = trimf(x,YF15);
YDF16 = trimf(x,YF16);
YDF17 = trimf(x,YF17);
YDF18 = trimf(x,YF18);
YDF19 = trimf(x,YF19);
YDF20 = trimf(x,YF20);
YDF21 = trimf(x,YF21);
YDF22 = trimf(x,YF22);
YDF23 = trimf(x,YF23);
YDF24 = trimf(x,YF24);
YDF25 = trimf(x,YF25);
YDF26 = trimf(x,YF26);
YDF27 = trimf(x,YF27);
YDF28 = trimf(x,YF28);
YDF29 = trimf(x,YF29);
YDF30 = trimf(x,YF30);
YDF31 = trapmf(x,YF31);

% Zigbee Frequency

y5c1= 0.125; % 779-787 Hz
y5c2= 0.375; % 902-928 Hz
y5c3= 0.625; % 868-868.6 Hz
y5c4= 0.875; % 0 - No Zigbee Frequency
stdy5 = (y5c2 - y5c1)/2 ; % Std Dev is calculated as half of the distance of the centers

YG1= [0 0 y5c1 y5c1+stdy5]; %  Trapezoidal for having the whole spectrum covered
YG2 = [y5c2-stdy5 y5c2 y5c2+stdy5]; % Triangular
YG3 = [y5c3-stdy5 y5c3 y5c3+stdy5]; % Triangular
YG4 = [y5c4-stdy5 y5c4 10 10]; %  Trapezoidal for having the whole spectrum covered

YDG1 = trapmf(x,YG1);
YDG2 = trimf(x,YG2);
YDG3 = trimf(x,YG3);
YDG4 = trapmf(x,YG4);
end
function [RSSI61, RSSI62, RSSI63, RSSI67, RSSI71, RSSI74, RSSI75, RSSI76,...
    RSSI79,RSSI61L, RSSI62L, RSSI63L, RSSI67L, RSSI71L, RSSI74L, RSSI75L,...
    RSSI76L, RSSI79L, RSRQGood, RSRQBad,RSRQGoodL, RSRQBadL, RSRQNGood,...
    RSRQNBad,RSRQNGoodL, RSRQNBadL, RSCPSGood, RCSPSBad, RSCPSGoodL, RCSPSBadL,...
    RSCPNGood, RCSPNBad, RSCPNGoodL, RCSPNBadL,LQIBad, LQIMedium, ...
    LQIGood,LQIBadL, LQIMediumL, LQIGoodL]=Initial_Var_In
 %The first Input to Fuzzify is RSSI
 
%Definitions for functions of WLAN RSSI:

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


%Upper RSRQ Functions for LTE possible serving cell
RSRQGood = [0 0 0.98 0.99];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99
RSRQBad = [0.98 0.99 10 10];% this was calculated according to the histeresis
%196 threshold = 0.98 and 198 =0.99
%The difference between Superior and Inferior functions are defined:
RSRQDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSRQDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions
%The lower function points are calculated
RSRQGoodL = RSRQGood - RSRQDifTL;
RSRQBadL = RSRQBad - RSRQDifTR;



%RSRQ Functions for LTE possible neighbor cell 
RSRQNGood = [0 0 0.96 0.97];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98 so difference is 0.01 (0.97 - 0.01)
RSRQNBad = [0.96 0.97 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98
%The difference between Superior and Inferior functions are defined:
RSRQNDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSRQNDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions
%The lower function points are calculated
RSRQNGoodL = RSRQNGood - RSRQNDifTL;
RSRQNBadL = RSRQNBad - RSRQNDifTR;


%RSCP Functions for HSPA possible serving  cell 
RSCPSGood = [0 0 0.495 0.505];% this was calculated according to the histeresis
%101 threshold = 0.505 and 99 = 0.495  is 0.01 (0.495 - 0.01)
RCSPSBad = [0.495 0.505 10 10];% this was calculated according to the histeresis
%194 threshold = 0.97 and 196 =0.98
%The difference between Superior and Inferior functions are defined:
RSCPSDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSCPSDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions
%The lower function points are calculated
RSCPSGoodL = RSCPSGood - RSCPSDifTL;
RCSPSBadL = RCSPSBad - RSCPSDifTR;



%RSCP Functions for HSPA possible neighbor  cell 
RSCPNGood = [0 0 0.485 0.495];% this was calculated according to the histeresis
%97 threshold = 0.485 and 99 = 0.495 
RCSPNBad = [0.485 0.495 10 10];% this was calculated according to the histeresis
%97 threshold = 0.485 and 99 = 0.495 
%The difference between Superior and Inferior functions are defined:
RSCPNDifTL = [0 0 0.005 0.005];%for left trapezoidal functions
RSCPNDifTR = [-0.005 -0.005 0 0 ];%for right trapezoidal functions
%The lower function points are calculated
RSCPNGoodL = RSCPNGood - RSCPNDifTL;
RCSPNBadL = RCSPNBad - RSCPNDifTR;



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
%The lower function points are calculated
LQIBadL = LQIBad - LQIDifTL;
LQIMediumL = LQIMedium - LQIDifTC;
LQIGoodL = LQIGood - LQIDifTR;
end
function [I1,I2,I3,I4,I5,I6,I7,I8,I9,I10] = Normal(RSSI, RSRQ_LTE_S,...
     RSRQ_LTE_N, CQI_LTE_S, CQI_LTE_N, RSCP_3G_S, RSCP_3G_N, CQI_3G_S,... 
     CQI_3G_N, LQI)
 %First the input variables are normaliced in positive values from 0 to 1,
 %and the singleton are left untouched
 I1= (RSSI*-1)/100;
 I2= (RSRQ_LTE_S*-1)/200;
 I3= (RSRQ_LTE_N*-1)/200;
 I4= CQI_LTE_S;
 I5= CQI_LTE_N;
 I6= (RSCP_3G_S*-1)/200;
 I7= (RSCP_3G_N*-1)/200;
 I8= CQI_3G_S;
 I9= CQI_3G_N;
 I10= LQI/255;
end
 function [u11,u12,u13,u14,u15,u16,u17,u18,u19, u21,u22,u31,u32,u40,u41,u42,...
     u43,u44,u45,u46,u47,u48,u49,u410,u411,u412,u413,u414,u415,u50,u51,u52,...
     u53,u54,u55,u56,u57,u58,u59,u510,u511,u512,u513,u514,u515,u61,u62,...
     u71,u72,u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,u811,u812,u813,u814,...
     u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,u825,u826,u827,u828,...
     u829,u830,u90,u91,u92,u93,u94,u95,u96,u97,u98,u99,u910,u911,u912,u913,u914,...
     u915,u916,u917,u918,u919,u920,u921,u922,u923,u924,u925,u926,u927,u928,...
     u929,u930,u101,u102,u103] = Fuzzy(I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,RSSI61, RSSI62, RSSI63,...
     RSSI67, RSSI71, RSSI74, RSSI75, RSSI76,...
    RSSI79, RSRQGood, RSRQBad, RSRQNGood, RSRQNBad, RSCPSGood, RCSPSBad,...
    RSCPNGood, RCSPNBad, LQIBad, LQIMedium, LQIGood,FacRed)

%Memebership Functions for RSSI in WLAN
u11 = FacRed*trapmf(I1,RSSI61);
u12 = FacRed*trimf(I1,RSSI62);
u13 = FacRed*trimf(I1,RSSI63);
u14 = FacRed*trimf(I1,RSSI67);
u15 = FacRed*trimf(I1,RSSI71);
u16 = FacRed*trimf(I1,RSSI74);
u17 = FacRed*trapmf(I1,RSSI75);
u18 = FacRed*trapmf(I1,RSSI76);
u19 = FacRed*trapmf(I1,RSSI79);

% Memebership Functions for RSRQ in LTE Serving are calculated

u21 = FacRed*trapmf(I2,RSRQGood);
u22 = FacRed*trapmf(I2,RSRQBad);

% Memebership Functions for RSRQ in LTE Neighbor are calculated

u31 = FacRed*trapmf(I3,RSRQNGood);
u32 = FacRed*trapmf(I3,RSRQNBad);

%CQI Functions for LTE possible serving are singleton, they are not continous

[u40,u41,u42,u43,u44,u45,u46,u47,u48,u49,u410,u411,u412,u413,u414,u415]=CQIL_Assign(I4);

%CQI Functions for LTE possible neighbor are singleton, they are not continous

[u50,u51,u52,u53,u54,u55,u56,u57,u58,u59,u510,u511,u512,u513,u514,u515]=CQIL_Assign(I5);

% Memebership Functions for RSCP in HSPA Serving are calculated
u61 = FacRed*trapmf(I6,RSCPSGood);
u62 = FacRed*trapmf(I6,RCSPSBad);

% Memebership Functions for RSCP in HSPA Serving are calculated
u71 = FacRed*trapmf(I7,RSCPNGood);
u72 = FacRed*trapmf(I7,RCSPNBad);

%CQI Functions for HSPA possible serving are singleton, they are not continous

[u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,u811,u812,u813,u814,u815,u816,...
    u817,u818,u819,u820,u821,u822,u823,u824,u825,u826,u827,u828,u829,u830]=CQIH_Assign(I8);

%CQI Functions for HSPA possible Neighbor are singleton, they are not continous

[u90,u91,u92,u93,u94,u95,u96,u97,u98,u99,u910,u911,u912,u913,u914,u915,u916,...
    u917,u918,u919,u920,u921,u922,u923,u924,u925,u926,u927,u928,u929,u930]=CQIH_Assign(I9);

% Memebership Functions for LQI in Zigbee is calculated

u101 = FacRed*trapmf(I10,LQIBad);
u102 = FacRed*trapmf(I10,LQIMedium);
u103 = FacRed*trapmf(I10,LQIGood);
 end
function [u40, u41,u42,u43,u44,u45,u46,u47,u48,u49,u410,u411,u412,u413,u414,u415]=CQIL_Assign(x) 
I4=x;
     if I4 == 1
            u40 = 0;
            u41 = 1;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;

    elseif I4 == 2
            u40 = 0;
            u41 = 0;
            u42 = 1;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;
    elseif I4 == 3
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 1;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;

    elseif I4 == 4
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 1;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;        

    elseif I4 == 5
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 1;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 6
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 1;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 7
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 1;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 8
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 1;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 9
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 1;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;         

    elseif I4 == 10
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 1;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;

    elseif I4 == 11
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 1;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 12
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 1;
            u413 = 0;
            u414 = 0;
            u415 = 0; 

    elseif I4 == 13
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 1;
            u414 = 0;
            u415 = 0;

    elseif I4 == 14
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 1;
            u415 = 0;

    elseif I4 == 15
            u40 = 0;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 1;
     else
            u40 = 1;
            u41 = 0;
            u42 = 0;
            u43 = 0;
            u44 = 0;
            u45 = 0;
            u46 = 0;
            u47 = 0;
            u48 = 0;
            u49 = 0;
            u410 = 0;
            u411 = 0;
            u412 = 0;
            u413 = 0;
            u414 = 0;
            u415 = 0;
     end
end
function [u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,...
    u19,u20,u21,u22,u23,u24,u25,u26,u27,u28,u29,u30]=CQIH_Assign(x)
    
    if x == 1
            u0 = 0;
            u1 = 1;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 2
            u0 = 0;
            u1 = 0;
            u2 = 1;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
   elseif x == 3
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 1;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
   elseif x == 4
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 1;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 5
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 1;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 6
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 1;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 7
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 1;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;

     elseif x == 8
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 1;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;

     elseif x == 9
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 1;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;

     elseif x == 10
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 1;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;

     elseif x == 11
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 1;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
      elseif x == 12
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 1;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
      elseif x == 13
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 1;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 14
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 1;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
     
    elseif x == 15
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 1;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 16
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 1;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 17
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 1;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 18
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 1;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 19
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 1;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 20
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 1;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 21
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 1;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 22
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 1;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 23
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 1;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
      elseif x == 24
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 1;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
    elseif x == 25
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 1;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
       
     elseif x == 26
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 1;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 27
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 1;
            u28 = 0;
            u29 = 0;
            u30 = 0;
            
     elseif x == 28
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 1;
            u29 = 0;
            u30 = 0;
            
     elseif x == 29
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 1;
            u30 = 0;
            
     elseif x == 30
            u0 = 0;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 1;
            

          
    else
            u0 = 1;
            u1 = 0;
            u2 = 0;
            u3 = 0;
            u4 = 0;
            u5 = 0;
            u6 = 0;
            u7 = 0;
            u8 = 0;
            u9 = 0;
            u10 = 0;
            u11 = 0;
            u12 = 0;
            u13 = 0;
            u14 = 0;
            u15 = 0;
            u16 = 0;
            u17 = 0;
            u18 = 0;
            u19 = 0;
            u20 = 0;
            u21 = 0;
            u22 = 0;
            u23 = 0;
            u24 = 0;
            u25 = 0;
            u26 = 0;
            u27 = 0;
            u28 = 0;
            u29 = 0;
            u30 = 0;

     end
end
function [Ar1,Ar2,Ar3,Ar4,Ar5,Ar6,Ar7,Ar8,Ar9,Ar10,Ar11,Ar12,Ar13,Ar14,...
    Ar15,Ar16,Ar17,Ar18,Ar19,Ar20,Ar21,Ar22,Ar23,Ar24,Ar25,Ar26,Ar27,...
    Ar28,Ar29,Ar30,Ar31,Ar32,Ar33,Ar34,Ar35,Ar36,Ar37,Ar38,Ar39,Ar40,...
    Ar41,Ar42,Ar43,Ar44,Ar45,Ar46,Ar47,Ar48,Ar49,Ar50,Ar51,Ar52,Ar53,...
    Ar54,Ar55,Ar56,Ar57,Ar58,Ar59,Ar60,Ar61,Ar62,Ar63,Ar64,Ar65,Ar66,...
    Ar67,Ar68,Ar69,Ar70,Ar71,Ar72,Ar73,Ar74,Ar75,Ar76,Ar77,Ar78,Ar79,...
    Ar80,Ar81,Ar82,Ar83,Ar84,Ar85,Ar86,Ar87,Ar88,Ar89,Ar90,Ar91,Ar92,...
    Ar93,Ar94,Ar95,Ar96,Ar97,Ar98,Ar99,Ar100,Ar101,Ar102,Ar103,Ar104,...
    Ar105,Ar106,Ar107,Ar108,Ar109,Ar110,Ar111,Ar112,Ar113,Ar114,Ar115,...
    Ar116,Ar117,Ar118,Ar119,Ar120,Ar121,Ar122,Ar123] = Previous(u11,u12,u13,u14,u15,u16,u17,...
    u18,u19,u21,u22,u31,u32,u40,u41,u42,u43,u44,u45,u46,u47,u48,u49,...
    u410,u411,u412,u413,u414,u415,u50,u51,u52,...
     u53,u54,u55,u56,u57,u58,u59,u510,u511,u512,u513,u514,u515,u61,u62,...
     u71,u72,u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,u811,u812,u813,u814,...
     u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,u825,u826,u827,u828,...
     u829,u830,u90,u91,u92,u93,u94,u95,u96,u97,u98,u99,u910,u911,u912,u913,u914,...
     u915,u916,u917,u918,u919,u920,u921,u922,u923,u924,u925,u926,u927,u928,...
     u929,u930,u101,u102,u103)


% Rules for only WLAN
A1 = [u11];
Ar1 = min(A1);
A2 = [u12];
Ar2 = min(A2);
A3 = [u13];
Ar3 = min(A3);
A4 = [u14];
Ar4 = min(A4);
A5 = [u15];
Ar5 = min(A5);
A6 = [u16];
Ar6 = min(A6);

%Rules for WLAN and LTE with better performance in WLAN

A7 = [u17  u21 u415];
Ar7 = min(A7);
A8 = [u17  u21 u414];
Ar8 = min(A8);
A9 = [u17  u21 u413];
Ar9 = min(A9);

A10 = [u17 max([u412 u411 u410 u49 u48 u47 u46 u45 u44 u43 u42 u41 u40])];%the max function is analog to the OR
Ar10 = min(A10);

A11 = [u18 u21 u415];
Ar11 = min(A11);
A12 = [u18 u21 u414];
Ar12 = min(A12);
A13  = [u18 u21 u413];
Ar13  = min(A13);
A14  = [u18 u21 u412];
Ar14  = min(A14);
A15  = [u18 u21 u49];
Ar15  = min(A15);
A16  = [u18 u21 u46];
Ar16  = min(A16);
A17 = [u18 u21 u411];
Ar17 = min(A17);
A18 = [u18 u21 u48];
Ar18 = min(A18);
A19 = [u18 u21 u410];
Ar19 = min(A19);
A20 = [u18 u21 u45];
Ar20 = min(A20);

A21 = [u18 max([u47 u44 u43 u42 u41 u40])];%the max function is analog to the OR
Ar21 = min(A21);

% Rules for when WLAN RSSI is really weak

A22  = [u19 u21 u47];
Ar22 = min(A22);
A23  = [u19 u21 u44];
Ar23  = min(A23);
A24  = [u19 u21 u43];
Ar24  = min(A24);

A25 = [u19 u61 u830 max([u43 u42 u41 u40])];
Ar25 = min(A25);

A26  = [u19 u21 u42 u61 max([u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,...
    u811,u812,u813,u814,u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,...
    u825,u826,u827,u828,u829]) ];
Ar26  = min(A26);

A27  = [u19 u41 u61 u829];
Ar27  = min(A27);

A28  = [u19 u41 u61 u828];
Ar28  = min(A28);

A29 = [u19 u21 u41 u61 max([u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,...
    u811,u812,u813,u814,u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,...
    u825,u826,u827])  ];
Ar29 = min(A29);

% Rules for when WLAN RSSI is really weak and LTE Neighbor better

A30 = [u19 u22 u31 u515];
Ar30 = min(A30);
A31 = [u19 u22 u31 u514];
Ar31 = min(A31);
A32 = [u19 u22 u31 u513];
Ar32 = min(A32);
A33  = [u19 u22 u31 u512];
Ar33  = min(A33);
A34  = [u19 u22 u31 u59];
Ar34  = min(A34);
A35  = [u19 u22 u31 u56];
Ar35  = min(A35);
A36  = [u19 u22 u31 u511];
Ar36  = min(A36);
A37 = [u19 u22 u31 u58];
Ar37 = min(A37);
A38 = [u19 u22 u31 u510];
Ar38 = min(A38);
A39 = [u19 u22 u31 u55];
Ar39 = min(A39);
A40 = [u19 u22 u31 u57];
Ar40 = min(A40);
A41 = [u19 u22 u31 u54];
Ar41 = min(A41);
A42 = [u19 u22 u31 u53];
Ar42 = min(A42);

A43  = [u19 u22 u61 u830 max([u52 u51 u50])];
Ar43  = min(A43);

A44  = [u19 u22 u31 u52 max([u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,...
    u811,u812,u813,u814,u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,...
    u825,u826,u827,u828,u829])];
Ar44  = min(A44);
A45  = [u19 u22  u61 u829 max([u51 u50])];
Ar45  = min(A45);
A46  = [u19 u22  u61 u828 max([u51 u50])];
Ar46  = min(A46);
A47 = [u19 u22 u31 u51 max([u80,u81,u82,u83,u84,u85,u86,u87,u88,u89,u810,...
    u811,u812,u813,u814,u815,u816,u817,u818,u819,u820,u821,u822,u823,u824,...
    u825,u826,u827])];
Ar47 = min(A47);

% Rules for when WLAN RSSI and LTE RSRQ are really weak and HSPA is better
A48 = [u19 u22 u32 u61 u827];
Ar48 = min(A48);
A49 = [u19 u22 u32 u61 u826];
Ar49 = min(A49);
A50 = [u19 u22 u32 u61 u825];
Ar50 = min(A50);
A51 = [u19 u22 u32 u61 u824];
Ar51 = min(A51);
A52 = [u19 u22 u32 u61 u823];
Ar52 = min(A52);
A53  = [u19 u22 u32 u61 u822];
Ar53  = min(A53);
A54  = [u19 u22 u32 u61 u821];
Ar54  = min(A54);
A55  = [u19 u22 u32 u61 u820];
Ar55  = min(A55);
A56  = [u19 u22 u32 u61 u819];
Ar56  = min(A56);
A57 = [u19 u22 u32 u61 u818];
Ar57 = min(A57);
A58 = [u19 u22 u32 u61 u817];
Ar58 = min(A58);
A59 = [u19 u22 u32 u61 u816];
Ar59 = min(A59);
A60 = [u19 u22 u32 u61 u815];
Ar60 = min(A60);
A61 = [u19 u22 u32 u61 u814];
Ar61 = min(A61);
A62 = [u19 u22 u32 u61 u813];
Ar62 = min(A62);
A63  = [u19 u22 u32 u61 u812];
Ar63  = min(A63);
A64  = [u19 u22 u32 u61 u811];
Ar64  = min(A64);
A65  = [u19 u22 u32 u61 u810];
Ar65  = min(A65);
A66  = [u19 u22 u32 u61 u89];
Ar66  = min(A66);
A67 = [u19 u22 u32 u61 u88];
Ar67 = min(A67);
A68 = [u19 u22 u32 u61 u87];
Ar68 = min(A68);
A69 = [u19 u22 u32 u61 u86];
Ar69 = min(A69);

A70 = [u19 u22 u32 u61 u103 max([u85 u84 u83 u82 u81 u80])];
Ar70 = min(A70);
A71 = [u19 u22 u32 u61 u85 max([u102 u101])];
Ar71 = min(A71);
A72 = [u19 u22 u32 u61 u84 max([u102 u101])];
Ar72 = min(A72);
A73  = [u19 u22 u32 u61 u83 max([u102 u101])];
Ar73  = min(A73);
A74  = [u19 u22 u32 u61 u82 max([u102 u101])];
Ar74  = min(A74);
A75  = [u19 u22 u32 u61 u81 max([u102 u101])];
Ar75  = min(A75);

% Rules for when WLAN RSSI, LTE RSRQ, and HPSPA serving are really weak and HSPA neoghbor is better
A76  = [u19 u22 u32 u62 u71 u930];
Ar76  = min(A76);
A77 = [u19 u22 u32 u62 u71 u929];
Ar77 = min(A77);
A78 = [u19 u22 u32 u62 u71 u928];
Ar78 = min(A78);
A79 = [u19 u22 u32 u62 u71 u927];
Ar79 = min(A79);
A80 = [u19 u22 u32 u62 u71 u926];
Ar80 = min(A80);
A81 = [u19 u22 u32 u62 u71 u925];
Ar81 = min(A81);
A82 = [u19 u22 u32 u62 u71 u924];
Ar82 = min(A82);
A83  = [u19 u22 u32 u62 u71 u923];
Ar83  = min(A83);
A84  = [u19 u22 u32 u62 u71 u922];
Ar84  = min(A84);
A85  = [u19 u22 u32 u62 u71 u921];
Ar85  = min(A85);
A86  = [u19 u22 u32 u62 u71 u920];
Ar86  = min(A86);
A87 = [u19 u22 u32 u62 u71 u919];
Ar87 = min(A87);
A88 = [u19 u22 u32 u62 u71 u918];
Ar88 = min(A88);
A89 = [u19 u22 u32 u62 u71 u917];
Ar89 = min(A89);
A90 = [u19 u22 u32 u62 u71 u916];
Ar90 = min(A90);
A91 = [u19 u22 u32 u62 u71 u915];
Ar91 = min(A91);
A92 = [u19 u22 u32 u62 u71 u914];
Ar92 = min(A92);
A93  = [u19 u22 u32 u62 u71 u913];
Ar93  = min(A93);
A94  = [u19 u22 u32 u62 u71 u912];
Ar94  = min(A94);
A95  = [u19 u22 u32 u62 u71 u911];
Ar95  = min(A95);
A96  = [u19 u22 u32 u62 u71 u910];
Ar96  = min(A96);
A97 = [u19 u22 u32 u62 u71 u99];
Ar97 = min(A97);
A98 = [u19 u22 u32 u62 u71 u98];
Ar98 = min(A98);
A99 = [u19 u22 u32 u62 u71 u97];
Ar99 = min(A99);
A100 = [u19 u22 u32 u62 u71 u96];
Ar100 = min(A100);

A101 = [u19 u22 u32 u62 u71 u103 max([u95 u94 u93 u92 u91 u90])];
Ar101 = min(A101);
A102 = [u19 u22 u32 u62 u71 u95 max([u102 u101])];
Ar102 = min(A102);
A103  = [u19 u22 u32 u62 u71 u94 max([u102 u101])];
Ar103  = min(A103);
A104  = [u19 u22 u32 u62 u71 u93 max([u102 u101])];
Ar104  = min(A104);
A105  = [u19 u22 u32 u62 u71 u92 max([u102 u101])];
Ar105  = min(A105);
A106  = [u19 u22 u32 u62 u71 u91 max([u102 u101])];
Ar106  = min(A106);
A107 = [u19 u22 u32 u62 u72 u102];
Ar107 = min(A107);
A108 = [u19 u22 u32 u62 u72 u101];
Ar108 = min(A108);

A109 = [u19 u21 u415];
Ar109 = min(A109);
A110 = [u19 u21 u414];
Ar110 = min(A110);
A111 = [u19 u21 u413];
Ar111 = min(A111);
A112 = [u19 u21 u412];
Ar112 = min(A112);
A113 = [u19 u21 u49];
Ar113 = min(A113);
A114 = [u19 u21 u46];
Ar114 = min(A114);
A115 = [u19 u21 u411];
Ar115 = min(A115);
A116 = [u19 u21 u48];
Ar116 = min(A116);
A117 = [u19 u21 u410];
Ar117 = min(A117);
A118 = [u19 u21 u45];
Ar118 = min(A118);


A119 = [u19 u22 u32 u61 u830];
Ar119 = min(A119);
A120 = [u19 u22 u32 u61 u829];
Ar120 = min(A120);
A121 = [u19 u22 u32 u61 u828];
Ar121 = min(A121);

A122 = [u19 u22 u32 u62 u72 u103];
Ar122 = min(A122);

A123 = [u18 max([u22 u32 u62 u72])];%the max function is analog to the OR
Ar123 = min(A123);
end
function [r11,r12 ,r13,r14,r15,r16,r17,r18,r19,r110,r111,r112,r113,r114,...
    r115,r116,r117,r118,r119,r120,r121,r122,r123,r124,r125,r126,r127,r128,...
    r129,r130,r131,r132,r133,r134,r135,r136,r137,r138,r139,r140,r141,r142,...
    r143,r144,r145,r146,r147,r148,r149,r150,r151,r152,r153,r154,r155,r156,...
    r157,r158,r159,r160,r161,r162,r163,r164,r165,r166,r167,r168,r169,r170,...
    r171,r172,r173,r174,r175,r176,r177,r178,r179,r180,r181,r182,r183,r184,...
    r185,r186,r187,r188,r189,r190,r191,r192,r193,r194,r195,r196,r197,r198,...
    r199,r1100,r1101,r1102,r1103,r1104,r1105,r1106,r1107,r1108,r1109,r1110,...
    r1111,r1112,r1113,r1114,r1115,r1116,r1117,r1118,r1119,r1120,r1121,r1122,...
    r1123,r21,r22,r23,r24,r25,r26,r27,r28,r29,r210,r211,r212,r213,r214,...
    r215,r216,r217,r218,r219,r220,r221,r222,r223,r224,r225,r226,r227,r228,...
    r229,r230,r231,r232,r233,r234,r235,r236,r237,r238,r239,r240,r241,r242,...
    r243,r244,r245,r246,r247,r248,r249,r250,r251,r252,r253,r254,r255,r256,...
    r257,r258,r259,r260,r261,r262,r263,r264,r265,r266,r267,r268,r269,r270,...
    r271,r272,r273,r274,r275,r276,r277,r278,r279,r280,r281,r282,r283,r284,...
    r285,r286,r287,r288,r289,r290,r291,r292,r293,r294,r295,r296,r297,r298,...
    r299,r2100,r2101,r2102,r2103,r2104,r2105,r2106,r2107,r2108,r2109,r2110,...
    r2111,r2112,r2113,r2114,r2115,r2116,r2117,r2118,r2119,r2120,r2121,r2122,...
    r2123,r31,r32,r33,r34,r35,r36,r37,r38,r39,r310,r311,r312,r313,r314,...
    r315,r316,r317,r318,r319,r320,r321,r322,r323,r324,r325,r326,r327,r328,...
    r329,r330,r331,r332,r333,r334,r335,r336,r337,r338,r339,r340,r341,r342,...
    r343,r344,r345,r346,r347,r348,r349,r350,r351,r352,r353,r354,r355,r356,...
    r357,r358,r359,r360,r361,r362,r363,r364,r365,r366,r367,r368,r369,r370,...
    r371,r372,r373,r374,r375,r376,r377,r378,r379,r380,r381,r382,r383,r384,...
    r385,r386,r387,r388,r389,r390,r391,r392,r393,r394,r395,r396,r397,r398,...
    r399,r3100,r3101,r3102,r3103,r3104,r3105,r3106,r3107,r3108,r3109,r3110,...
    r3111,r3112,r3113,r3114,r3115,r3116,r3117,r3118,r3119,r3120,r3121,r3122,...
    r3123,r41,r42,r43,r44,r45,r46,r47,r48,r49,r410,r411,r412,r413,r414,...
    r415,r416,r417,r418,r419,r420,r421,r422,r423,r424,r425,r426,r427,r428,...
    r429,r430,r431,r432,r433,r434,r435,r436,r437,r438,r439,r440,r441,r442,...
    r443,r444,r445,r446,r447,r448,r449,r450,r451,r452,r453,r454,r455,r456,...
    r457,r458,r459,r460,r461,r462,r463,r464,r465,r466,r467,r468,r469,r470,...
    r471,r472,r473,r474,r475,r476,r477,r478,r479,r480,r481,r482,r483,r484,...
    r485,r486,r487,r488,r489,r490,r491,r492,r493,r494,r495,r496,r497,r498,...
    r499,r4100,r4101,r4102,r4103,r4104,r4105,r4106,r4107,r4108,r4109,r4110,...
    r4111,r4112,r4113,r4114,r4115,r4116,r4117,r4118,r4119,r4120,r4121,r4122,...
    r4123,r51,r52,r53,r54,r55,r56,r57,r58,r59,r510,r511,r512,r513,r514,...
    r515,r516,r517,r518,r519,r520,r521,r522,r523,r524,r525,r526,r527,r528,...
    r529,r530,r531,r532,r533,r534,r535,r536,r537,r538,r539,r540,r541,r542,...
    r543,r544,r545,r546,r547,r548,r549,r550,r551,r552,r553,r554,r555,r556,...
    r557,r558,r559,r560,r561,r562,r563,r564,r565,r566,r567,r568,r569,r570,...
    r571,r572,r573,r574,r575,r576,r577,r578,r579,r580,r581,r582,r583,r584,...
    r585,r586,r587,r588,r589,r590,r591,r592,r593,r594,r595,r596,r597,r598,...
    r599,r5100,r5101,r5102,r5103,r5104,r5105,r5106,r5107,r5108,r5109,...
    r5110,r5111,r5112,r5113,r5114,r5115,r5116,r5117,r5118,r5119,r5120,...
    r5121,r5122,r5123]...
    =Mandami(x,Ar1,Ar2,Ar3,Ar4,Ar5,Ar6,Ar7,Ar8,Ar9,Ar10,Ar11,Ar12,Ar13,Ar14,...
    Ar15,Ar16,Ar17,Ar18,Ar19,Ar20,Ar21,Ar22,Ar23,Ar24,Ar25,Ar26,Ar27,...
    Ar28,Ar29,Ar30,Ar31,Ar32,Ar33,Ar34,Ar35,Ar36,Ar37,Ar38,Ar39,Ar40,...
    Ar41,Ar42,Ar43,Ar44,Ar45,Ar46,Ar47,Ar48,Ar49,Ar50,Ar51,Ar52,Ar53,...
    Ar54,Ar55,Ar56,Ar57,Ar58,Ar59,Ar60,Ar61,Ar62,Ar63,Ar64,Ar65,Ar66,...
    Ar67,Ar68,Ar69,Ar70,Ar71,Ar72,Ar73,Ar74,Ar75,Ar76,Ar77,Ar78,Ar79,...
    Ar80,Ar81,Ar82,Ar83,Ar84,Ar85,Ar86,Ar87,Ar88,Ar89,Ar90,Ar91,Ar92,...
    Ar93,Ar94,Ar95,Ar96,Ar97,Ar98,Ar99,Ar100,Ar101,Ar102,Ar103,Ar104,...
    Ar105,Ar106,Ar107,Ar108,Ar109,Ar110,Ar111,Ar112,Ar113,Ar114,Ar115,...
    Ar116,Ar117,Ar118,Ar119,Ar120,Ar121,Ar122,Ar123,YCF1,YCF2,YCF3,YCF4,YCF5,YCF6,YDC1,YDC2,YDC3,YDC4,YDC5,YDE1,...
    YDE2,YDE3,YDE4,YDE5,YDE6,YDE7,YDE8,YDE9,YDE10,YDE11,YDE12,YDE13,YDE14,...
    YDE15,YDE16,YDE17,YDE18,YDE19,YDE20,YDF1,YDF2,YDF3,YDF4,YDF5,YDF6,YDF7,...
    YDF8,YDF9,YDF10,YDF11,YDF12,YDF13,YDF14,YDF15,YDF16,YDF17,YDF18,YDF19,YDF20,...
    YDF21,YDF22,YDF23,YDF24,YDF25,YDF26,YDF27,YDF28,YDF29,YDF30,YDF31,YDG1,...
    YDG2,YDG3,YDG4)

Ar=ones(1,length(x));
Arl1= Ar*Ar1;
Arl2= Ar*Ar2;
Arl3= Ar*Ar3;
Arl4= Ar*Ar4;
Arl5= Ar*Ar5;
Arl6= Ar*Ar6;
Arl7= Ar*Ar7;
Arl8= Ar*Ar8;
Arl9= Ar*Ar9;
Arl10= Ar*Ar10;
Arl11= Ar*Ar11;
Arl12= Ar*Ar12;
Arl13= Ar*Ar13;
Arl14= Ar*Ar14;
Arl15= Ar*Ar15;
Arl16= Ar*Ar16;
Arl17= Ar*Ar17;
Arl18= Ar*Ar18;
Arl19= Ar*Ar19;
Arl20= Ar*Ar20;
Arl21= Ar*Ar21;
Arl22= Ar*Ar22;
Arl23= Ar*Ar23;
Arl24= Ar*Ar24;
Arl25= Ar*Ar25;
Arl26= Ar*Ar26;
Arl27= Ar*Ar27;
Arl28= Ar*Ar28;
Arl29= Ar*Ar29;
Arl30= Ar*Ar30;
Arl31= Ar*Ar31;
Arl32= Ar*Ar32;
Arl33= Ar*Ar33;
Arl34= Ar*Ar34;
Arl35= Ar*Ar35;
Arl36= Ar*Ar36;
Arl37= Ar*Ar37;
Arl38= Ar*Ar38;
Arl39= Ar*Ar39;
Arl40= Ar*Ar40;
Arl41= Ar*Ar41;
Arl42= Ar*Ar42;
Arl43= Ar*Ar43;
Arl44= Ar*Ar44;
Arl45= Ar*Ar45;
Arl46= Ar*Ar46;
Arl47= Ar*Ar47;
Arl48= Ar*Ar48;
Arl49= Ar*Ar49;
Arl50= Ar*Ar50;
Arl51= Ar*Ar51;
Arl52= Ar*Ar52;
Arl53= Ar*Ar53;
Arl54= Ar*Ar54;
Arl55= Ar*Ar55;
Arl56= Ar*Ar56;
Arl57= Ar*Ar57;
Arl58= Ar*Ar58;
Arl59= Ar*Ar59;
Arl60= Ar*Ar60;
Arl61= Ar*Ar61;
Arl62= Ar*Ar62;
Arl63= Ar*Ar63;
Arl64= Ar*Ar64;
Arl65= Ar*Ar65;
Arl66= Ar*Ar66;
Arl67= Ar*Ar67;
Arl68= Ar*Ar68;
Arl69= Ar*Ar69;
Arl70= Ar*Ar70;
Arl71= Ar*Ar71;
Arl72= Ar*Ar72;
Arl73= Ar*Ar73;
Arl74= Ar*Ar74;
Arl75= Ar*Ar75;
Arl76= Ar*Ar76;
Arl77= Ar*Ar77;
Arl78= Ar*Ar78;
Arl79= Ar*Ar79;
Arl80= Ar*Ar80;
Arl81= Ar*Ar81;
Arl82= Ar*Ar82;
Arl83= Ar*Ar83;
Arl84= Ar*Ar84;
Arl85= Ar*Ar85;
Arl86= Ar*Ar86;
Arl87= Ar*Ar87;
Arl88= Ar*Ar88;
Arl89= Ar*Ar89;
Arl90= Ar*Ar90;
Arl91= Ar*Ar91;
Arl92= Ar*Ar92;
Arl93= Ar*Ar93;
Arl94= Ar*Ar94;
Arl95= Ar*Ar95;
Arl96= Ar*Ar96;
Arl97= Ar*Ar97;
Arl98= Ar*Ar98;
Arl99= Ar*Ar99;
Arl100= Ar*Ar100;
Arl101= Ar*Ar101;
Arl102= Ar*Ar102;
Arl103= Ar*Ar103;
Arl104= Ar*Ar104;
Arl105= Ar*Ar105;
Arl106= Ar*Ar106;
Arl107= Ar*Ar107;
Arl108= Ar*Ar108;
Arl109= Ar*Ar109;
Arl110= Ar*Ar110;
Arl111= Ar*Ar111;
Arl112= Ar*Ar112;
Arl113= Ar*Ar113;
Arl114= Ar*Ar114;
Arl115= Ar*Ar115;
Arl116= Ar*Ar116;
Arl117= Ar*Ar117;
Arl118= Ar*Ar118;
Arl119= Ar*Ar119;
Arl120= Ar*Ar120;
Arl121= Ar*Ar121;
Arl122= Ar*Ar122;
Arl123= Ar*Ar123;


% The output is Mandani implicated to the inputs for New Technology to
% connect

% YCF1 =  Zigbee
% YCF2 = HSPA Neighbor
% YCF3 = HSPA Serving
% YCF4 = LET Neighbor
% YCF5 = LTE Serving
% YCF6 = WLAN

r11=min(Arl1,YCF6);
r12=min(Arl2,YCF6);
r13=min(Arl3,YCF6);
r14=min(Arl4,YCF6);
r15=min(Arl5,YCF6);
r16=min(Arl6,YCF6);
r17=min(Arl7,YCF5);
r18=min(Arl8,YCF5);
r19=min(Arl9,YCF5);
r110=min(Arl10,YCF6);
r111=min(Arl11,YCF5);
r112=min(Arl12,YCF5);
r113=min(Arl13,YCF5);
r114=min(Arl14,YCF5);
r115=min(Arl15,YCF5);
r116=min(Arl16,YCF5);
r117=min(Arl17,YCF5);
r118=min(Arl18,YCF5);
r119=min(Arl19,YCF5);
r120=min(Arl20,YCF5);
r121=min(Arl21,YCF6);
r122=min(Arl22,YCF5);
r123=min(Arl23,YCF5);
r124=min(Arl24,YCF5);
r125=min(Arl25,YCF3);
r126=min(Arl26,YCF5);
r127=min(Arl27,YCF3);
r128=min(Arl28,YCF3);
r129=min(Arl29,YCF5);
r130=min(Arl30,YCF4);
r131=min(Arl31,YCF4);
r132=min(Arl32,YCF4);
r133=min(Arl33,YCF4);
r134=min(Arl34,YCF4);
r135=min(Arl35,YCF4);
r136=min(Arl36,YCF4);
r137=min(Arl37,YCF4);
r138=min(Arl38,YCF4);
r139=min(Arl39,YCF4);
r140=min(Arl40,YCF4);
r141=min(Arl41,YCF4);
r142=min(Arl42,YCF4);
r143=min(Arl43,YCF3);
r144=min(Arl44,YCF4);
r145=min(Arl45,YCF3);
r146=min(Arl46,YCF3);
r147=min(Arl47,YCF4);
r148=min(Arl48,YCF3);
r149=min(Arl49,YCF3);
r150=min(Arl50,YCF3);
r151=min(Arl51,YCF3);
r152=min(Arl52,YCF3);
r153=min(Arl53,YCF3);
r154=min(Arl54,YCF3);
r155=min(Arl55,YCF3);
r156=min(Arl56,YCF3);
r157=min(Arl57,YCF3);
r158=min(Arl58,YCF3);
r159=min(Arl59,YCF3);
r160=min(Arl60,YCF3);
r161=min(Arl61,YCF3);
r162=min(Arl62,YCF3);
r163=min(Arl63,YCF3);
r164=min(Arl64,YCF3);
r165=min(Arl65,YCF3);
r166=min(Arl66,YCF3);
r167=min(Arl67,YCF3);
r168=min(Arl68,YCF3);
r169=min(Arl69,YCF3);
r170=min(Arl70,YCF1);
r171=min(Arl71,YCF3);
r172=min(Arl72,YCF3);
r173=min(Arl73,YCF3);
r174=min(Arl74,YCF3);
r175=min(Arl75,YCF3);
r176=min(Arl76,YCF2);
r177=min(Arl77,YCF2);
r178=min(Arl78,YCF2);
r179=min(Arl79,YCF2);
r180=min(Arl80,YCF2);
r181=min(Arl81,YCF2);
r182=min(Arl82,YCF2);
r183=min(Arl83,YCF2);
r184=min(Arl84,YCF2);
r185=min(Arl85,YCF2);
r186=min(Arl86,YCF2);
r187=min(Arl87,YCF2);
r188=min(Arl88,YCF2);
r189=min(Arl89,YCF2);
r190=min(Arl90,YCF2);
r191=min(Arl91,YCF2);
r192=min(Arl92,YCF2);
r193=min(Arl93,YCF2);
r194=min(Arl94,YCF2);
r195=min(Arl95,YCF2);
r196=min(Arl96,YCF2);
r197=min(Arl97,YCF2);
r198=min(Arl98,YCF2);
r199=min(Arl99,YCF2);
r1100=min(Arl100,YCF2);
r1101=min(Arl101,YCF1);
r1102=min(Arl102,YCF2);
r1103=min(Arl103,YCF2);
r1104=min(Arl104,YCF2);
r1105=min(Arl105,YCF2);
r1106=min(Arl106,YCF2);
r1107=min(Arl107,YCF1);
r1108=min(Arl108,YCF1);
r1109=min(Arl109,YCF5);
r1110=min(Arl110,YCF5);
r1111=min(Arl111,YCF5);
r1112=min(Arl112,YCF5);
r1113=min(Arl113,YCF5);
r1114=min(Arl114,YCF5);
r1115=min(Arl115,YCF5);
r1116=min(Arl116,YCF5);
r1117=min(Arl117,YCF5);
r1118=min(Arl118,YCF5);
r1119=min(Arl119,YCF3);
r1120=min(Arl120,YCF3);
r1121=min(Arl121,YCF3);
r1122=min(Arl122,YCF1);
r1123=min(Arl123,YCF6);
% The output is Mandani implicated to the inputs for New Modulation

% YDC1 = 64QAM
% YDC2 = 16QAM
% YDC3 = QPSK
% YDC4 = O-QPSK
% YDC5 = BPSK

r21=min(Arl1,YDC1);
r22=min(Arl2,YDC1);
r23=min(Arl3,YDC1);
r24=min(Arl4,YDC2);
r25=min(Arl5,YDC2);
r26=min(Arl6,YDC3);
r27=min(Arl7,YDC1);
r28=min(Arl8,YDC1);
r29=min(Arl9,YDC1);
r210=min(Arl10,YDC3);
r211=min(Arl11,YDC1);
r212=min(Arl12,YDC1);
r213=min(Arl13,YDC1);
r214=min(Arl14,YDC1);
r215=min(Arl15,YDC2);
r216=min(Arl16,YDC3);
r217=min(Arl17,YDC1);
r218=min(Arl18,YDC2);
r219=min(Arl19,YDC1);
r220=min(Arl20,YDC3);
r221=min(Arl21,YDC5);
r222=min(Arl22,YDC2);
r223=min(Arl23,YDC3);
r224=min(Arl24,YDC3);
r225=min(Arl25,YDC1);
r226=min(Arl26,YDC3);
r227=min(Arl27,YDC1);
r228=min(Arl28,YDC1);
r229=min(Arl29,YDC3);
r230=min(Arl30,YDC1);
r231=min(Arl31,YDC1);
r232=min(Arl32,YDC1);
r233=min(Arl33,YDC1);
r234=min(Arl34,YDC2);
r235=min(Arl35,YDC3);
r236=min(Arl36,YDC1);
r237=min(Arl37,YDC2);
r238=min(Arl38,YDC1);
r239=min(Arl39,YDC3);
r240=min(Arl40,YDC2);
r241=min(Arl41,YDC3);
r242=min(Arl42,YDC3);
r243=min(Arl43,YDC1);
r244=min(Arl44,YDC3);
r245=min(Arl45,YDC1);
r246=min(Arl46,YDC1);
r247=min(Arl47,YDC3);
r248=min(Arl48,YDC1);
r249=min(Arl49,YDC1);
r250=min(Arl50,YDC2);
r251=min(Arl51,YDC2);
r252=min(Arl52,YDC2);
r253=min(Arl53,YDC2);
r254=min(Arl54,YDC2);
r255=min(Arl55,YDC2);
r256=min(Arl56,YDC2);
r257=min(Arl57,YDC2);
r258=min(Arl58,YDC2);
r259=min(Arl59,YDC2);
r260=min(Arl60,YDC3);
r261=min(Arl61,YDC3);
r262=min(Arl62,YDC3);
r263=min(Arl63,YDC3);
r264=min(Arl64,YDC3);
r265=min(Arl65,YDC3);
r266=min(Arl66,YDC3);
r267=min(Arl67,YDC3);
r268=min(Arl68,YDC3);
r269=min(Arl69,YDC3);
r270=min(Arl70,YDC4);
r271=min(Arl71,YDC3);
r272=min(Arl72,YDC3);
r273=min(Arl73,YDC3);
r274=min(Arl74,YDC3);
r275=min(Arl75,YDC3);
r276=min(Arl76,YDC1);
r277=min(Arl77,YDC1);
r278=min(Arl78,YDC1);
r279=min(Arl79,YDC1);
r280=min(Arl80,YDC1);
r281=min(Arl81,YDC2);
r282=min(Arl82,YDC2);
r283=min(Arl83,YDC2);
r284=min(Arl84,YDC2);
r285=min(Arl85,YDC2);
r286=min(Arl86,YDC2);
r287=min(Arl87,YDC2);
r288=min(Arl88,YDC2);
r289=min(Arl89,YDC2);
r290=min(Arl90,YDC2);
r291=min(Arl91,YDC3);
r292=min(Arl92,YDC3);
r293=min(Arl93,YDC3);
r294=min(Arl94,YDC3);
r295=min(Arl95,YDC3);
r296=min(Arl96,YDC3);
r297=min(Arl97,YDC3);
r298=min(Arl98,YDC3);
r299=min(Arl99,YDC3);
r2100=min(Arl100,YDC3);
r2101=min(Arl101,YDC4);
r2102=min(Arl102,YDC3);
r2103=min(Arl103,YDC3);
r2104=min(Arl104,YDC3);
r2105=min(Arl105,YDC3);
r2106=min(Arl106,YDC3);
r2107=min(Arl107,YDC5);
r2108=min(Arl108,YDC5);
r2109=min(Arl109,YDC1);
r2110=min(Arl110,YDC1);
r2111=min(Arl111,YDC1);
r2112=min(Arl112,YDC1);
r2113=min(Arl113,YDC2);
r2114=min(Arl114,YDC3);
r2115=min(Arl115,YDC1);
r2116=min(Arl116,YDC2);
r2117=min(Arl117,YDC1);
r2118=min(Arl118,YDC3);
r2119=min(Arl119,YDC1);
r2120=min(Arl120,YDC1);
r2121=min(Arl121,YDC1);
r2122=min(Arl122,YDC4);
r2123=min(Arl123,YDC5);

% The output is Mandani implicated to the inputs for Code Rate
% YDE1 = 0.926
% YDE2 = 0.853
% YDE3 = 0.83
% YDE4 = 0.754
% YDE5 = 0.75
% YDE6 = 0.66
% YDE7 = 0.65
% YDE8 = 0.602
% YDE9 = 0.588
% YDE10 = 0.554
% YDE11 = 0.5
% YDE12 = 0.479
% YDE13 = 0.455
% YDE14 = 0.438
% YDE15 = 0.369
% YDE16 = 0.301
% YDE17 = 0.188
% YDE18 = 0.117
% YDE19 = 0.076
% YDE20 = 0 Without Code Rate

r31=min(Arl1,YDE3);
r32=min(Arl2,YDE5);
r33=min(Arl3,YDE6);
r34=min(Arl4,YDE5);
r35=min(Arl5,YDE11);
r36=min(Arl6,YDE5);
r37=min(Arl7,YDE1);
r38=min(Arl8,YDE2);
r39=min(Arl9,YDE4);
r310=min(Arl10,YDE11);
r311=min(Arl11,YDE1);
r312=min(Arl12,YDE2);
r313=min(Arl13,YDE4);
r314=min(Arl14,YDE7);
r315=min(Arl15,YDE8);
r316=min(Arl16,YDE9);
r317=min(Arl17,YDE10);
r318=min(Arl18,YDE12);
r319=min(Arl19,YDE13);
r320=min(Arl20,YDE14);
r321=min(Arl21,YDE11);
r322=min(Arl22,YDE15);
r323=min(Arl23,YDE16);
r324=min(Arl24,YDE17);
r325=min(Arl25,YDE20);
r326=min(Arl26,YDE18);
r327=min(Arl27,YDE20);
r328=min(Arl28,YDE20);
r329=min(Arl29,YDE19);
r330=min(Arl30,YDE1);
r331=min(Arl31,YDE2);
r332=min(Arl32,YDE4);
r333=min(Arl33,YDE7);
r334=min(Arl34,YDE8);
r335=min(Arl35,YDE9);
r336=min(Arl36,YDE10);
r337=min(Arl37,YDE12);
r338=min(Arl38,YDE13);
r339=min(Arl39,YDE14);
r340=min(Arl40,YDE15);
r341=min(Arl41,YDE16);
r342=min(Arl42,YDE17);
r343=min(Arl43,YDE20);
r344=min(Arl44,YDE18);
r345=min(Arl45,YDE20);
r346=min(Arl46,YDE20);
r347=min(Arl47,YDE19);
r348=min(Arl48,YDE20);
r349=min(Arl49,YDE20);
r350=min(Arl50,YDE20);
r351=min(Arl51,YDE20);
r352=min(Arl52,YDE20);
r353=min(Arl53,YDE20);
r354=min(Arl54,YDE20);
r355=min(Arl55,YDE20);
r356=min(Arl56,YDE20);
r357=min(Arl57,YDE20);
r358=min(Arl58,YDE20);
r359=min(Arl59,YDE20);
r360=min(Arl60,YDE20);
r361=min(Arl61,YDE20);
r362=min(Arl62,YDE20);
r363=min(Arl63,YDE20);
r364=min(Arl64,YDE20);
r365=min(Arl65,YDE20);
r366=min(Arl66,YDE20);
r367=min(Arl67,YDE20);
r368=min(Arl68,YDE20);
r369=min(Arl69,YDE20);
r370=min(Arl70,YDE20);
r371=min(Arl71,YDE20);
r372=min(Arl72,YDE20);
r373=min(Arl73,YDE20);
r374=min(Arl74,YDE20);
r375=min(Arl75,YDE20);
r376=min(Arl76,YDE20);
r377=min(Arl77,YDE20);
r378=min(Arl78,YDE20);
r379=min(Arl79,YDE20);
r380=min(Arl80,YDE20);
r381=min(Arl81,YDE20);
r382=min(Arl82,YDE20);
r383=min(Arl83,YDE20);
r384=min(Arl84,YDE20);
r385=min(Arl85,YDE20);
r386=min(Arl86,YDE20);
r387=min(Arl87,YDE20);
r388=min(Arl88,YDE20);
r389=min(Arl89,YDE20);
r390=min(Arl90,YDE20);
r391=min(Arl91,YDE20);
r392=min(Arl92,YDE20);
r393=min(Arl93,YDE20);
r394=min(Arl94,YDE20);
r395=min(Arl95,YDE20);
r396=min(Arl96,YDE20);
r397=min(Arl97,YDE20);
r398=min(Arl98,YDE20);
r399=min(Arl99,YDE20);
r3100=min(Arl100,YDE20);
r3101=min(Arl101,YDE20);
r3102=min(Arl102,YDE20);
r3103=min(Arl103,YDE20);
r3104=min(Arl104,YDE20);
r3105=min(Arl105,YDE20);
r3106=min(Arl106,YDE20);
r3107=min(Arl107,YDE20);
r3108=min(Arl108,YDE20);
r3109=min(Arl109,YDE1);
r3110=min(Arl110,YDE2);
r3111=min(Arl111,YDE4);
r3112=min(Arl112,YDE7);
r3113=min(Arl113,YDE8);
r3114=min(Arl114,YDE9);
r3115=min(Arl115,YDE10);
r3116=min(Arl116,YDE12);
r3117=min(Arl117,YDE13);
r3118=min(Arl118,YDE14);
r3119=min(Arl119,YDE20);
r3120=min(Arl120,YDE20);
r3121=min(Arl121,YDE20);
r3122=min(Arl122,YDE20);
r3123=min(Arl123,YDE11);
% The output is Mandani implicated to the inputs for Transport Block Size
% YDF1 = 38576
% YDF2 = 32264
% YDF3 = 26504
% YDF4 = 21768
% YDF5 = 15776
% YDF6 = 14424
% YDF7 = 11432
% YDF8 = 9736
% YDF9 = 7184
% YDF10 = 6568
% YDF11 = 5896
% YDF12 = 5296
% YDF13 = 4672
% YDF14 = 4200
% YDF15 = 3576
% YDF16 = 3328
% YDF17 = 2592
% YDF18 = 2288
% YDF19 = 1744
% YDF20 = 1488
% YDF21 = 1264
% YDF22 = 928
% YDF23 = 792
% YDF24 = 648
% YDF25 = 464
% YDF26 = 376
% YDF27 = 320
% YDF28 = 232
% YDF29 = 176
% YDF30 = 136
% YDF31 = 0 Without Transport Block Size
   
r41=min(Arl1,YDF31);
r42=min(Arl2,YDF31);
r43=min(Arl3,YDF31);
r44=min(Arl4,YDF31);
r45=min(Arl5,YDF31);
r46=min(Arl6,YDF31);
r47=min(Arl7,YDF31);
r48=min(Arl8,YDF31);
r49=min(Arl9,YDF31);
r410=min(Arl10,YDF31);
r411=min(Arl11,YDF31);
r412=min(Arl12,YDF31);
r413=min(Arl13,YDF31);
r414=min(Arl14,YDF31);
r415=min(Arl15,YDF31);
r416=min(Arl16,YDF31);
r417=min(Arl17,YDF31);
r418=min(Arl18,YDF31);
r419=min(Arl19,YDF31);
r420=min(Arl20,YDF31);
r421=min(Arl21,YDF31);
r422=min(Arl22,YDF31);
r423=min(Arl23,YDF31);
r424=min(Arl24,YDF31);
r425=min(Arl25,YDF1);
r426=min(Arl26,YDF31);
r427=min(Arl27,YDF2);
r428=min(Arl28,YDF3);
r429=min(Arl29,YDF31);
r430=min(Arl30,YDF31);
r431=min(Arl31,YDF31);
r432=min(Arl32,YDF31);
r433=min(Arl33,YDF31);
r434=min(Arl34,YDF31);
r435=min(Arl35,YDF31);
r436=min(Arl36,YDF31);
r437=min(Arl37,YDF31);
r438=min(Arl38,YDF31);
r439=min(Arl39,YDF31);
r440=min(Arl40,YDF31);
r441=min(Arl41,YDF31);
r442=min(Arl42,YDF31);
r443=min(Arl43,YDF1);
r444=min(Arl44,YDF31);
r445=min(Arl45,YDF2);
r446=min(Arl46,YDF3);
r447=min(Arl47,YDF31);
r448=min(Arl48,YDF4);
r449=min(Arl49,YDF5);
r450=min(Arl50,YDF6);
r451=min(Arl51,YDF7);
r452=min(Arl52,YDF8);
r453=min(Arl53,YDF9);
r454=min(Arl54,YDF10);
r455=min(Arl55,YDF11);
r456=min(Arl56,YDF12);
r457=min(Arl57,YDF13);
r458=min(Arl58,YDF14);
r459=min(Arl59,YDF15);
r460=min(Arl60,YDF16);
r461=min(Arl61,YDF17);
r462=min(Arl62,YDF18);
r463=min(Arl63,YDF19);
r464=min(Arl64,YDF20);
r465=min(Arl65,YDF21);
r466=min(Arl66,YDF22);
r467=min(Arl67,YDF23);
r468=min(Arl68,YDF24);
r469=min(Arl69,YDF25);
r470=min(Arl70,YDF31);
r471=min(Arl71,YDF26);
r472=min(Arl72,YDF27);
r473=min(Arl73,YDF28);
r474=min(Arl74,YDF29);
r475=min(Arl75,YDF30);
r476=min(Arl76,YDF1);
r477=min(Arl77,YDF2);
r478=min(Arl78,YDF3);
r479=min(Arl79,YDF4);
r480=min(Arl80,YDF5);
r481=min(Arl81,YDF6);
r482=min(Arl82,YDF7);
r483=min(Arl83,YDF8);
r484=min(Arl84,YDF9);
r485=min(Arl85,YDF10);
r486=min(Arl86,YDF11);
r487=min(Arl87,YDF12);
r488=min(Arl88,YDF13);
r489=min(Arl89,YDF14);
r490=min(Arl90,YDF15);
r491=min(Arl91,YDF16);
r492=min(Arl92,YDF17);
r493=min(Arl93,YDF18);
r494=min(Arl94,YDF19);
r495=min(Arl95,YDF20);
r496=min(Arl96,YDF21);
r497=min(Arl97,YDF22);
r498=min(Arl98,YDF23);
r499=min(Arl99,YDF24);
r4100=min(Arl100,YDF25);
r4101=min(Arl101,YDF31);
r4102=min(Arl102,YDF26);
r4103=min(Arl103,YDF27);
r4104=min(Arl104,YDF28);
r4105=min(Arl105,YDF29);
r4106=min(Arl106,YDF30);
r4107=min(Arl107,YDF31);
r4108=min(Arl108,YDF31);
r4109=min(Arl109,YDF31);
r4110=min(Arl110,YDF31);
r4111=min(Arl111,YDF31);
r4112=min(Arl112,YDF31);
r4113=min(Arl113,YDF31);
r4114=min(Arl114,YDF31);
r4115=min(Arl115,YDF31);
r4116=min(Arl116,YDF31);
r4117=min(Arl117,YDF31);
r4118=min(Arl118,YDF31);
r4119=min(Arl119,YDF1);
r4120=min(Arl120,YDF2);
r4121=min(Arl121,YDF3);
r4122=min(Arl122,YDF31);
r4123=min(Arl123,YDF31);
% The output is Mandani implicated to the inputs for Zigbee Frequency

% YDG1 = 779-787 Hz
% YDG2 = 902-928 Hz
% YDG3 = 868-868.6 Hz
% YDG4 = 0 - No Zigbee Frequency

r51=min(Arl1,YDG4);
r52=min(Arl2,YDG4);
r53=min(Arl3,YDG4);
r54=min(Arl4,YDG4);
r55=min(Arl5,YDG4);
r56=min(Arl6,YDG4);
r57=min(Arl7,YDG4);
r58=min(Arl8,YDG4);
r59=min(Arl9,YDG4);
r510=min(Arl10,YDG4);
r511=min(Arl11,YDG4);
r512=min(Arl12,YDG4);
r513=min(Arl13,YDG4);
r514=min(Arl14,YDG4);
r515=min(Arl15,YDG4);
r516=min(Arl16,YDG4);
r517=min(Arl17,YDG4);
r518=min(Arl18,YDG4);
r519=min(Arl19,YDG4);
r520=min(Arl20,YDG4);
r521=min(Arl21,YDG4);
r522=min(Arl22,YDG4);
r523=min(Arl23,YDG4);
r524=min(Arl24,YDG4);
r525=min(Arl25,YDG4);
r526=min(Arl26,YDG4);
r527=min(Arl27,YDG4);
r528=min(Arl28,YDG4);
r529=min(Arl29,YDG4);
r530=min(Arl30,YDG4);
r531=min(Arl31,YDG4);
r532=min(Arl32,YDG4);
r533=min(Arl33,YDG4);
r534=min(Arl34,YDG4);
r535=min(Arl35,YDG4);
r536=min(Arl36,YDG4);
r537=min(Arl37,YDG4);
r538=min(Arl38,YDG4);
r539=min(Arl39,YDG4);
r540=min(Arl40,YDG4);
r541=min(Arl41,YDG4);
r542=min(Arl42,YDG4);
r543=min(Arl43,YDG4);
r544=min(Arl44,YDG4);
r545=min(Arl45,YDG4);
r546=min(Arl46,YDG4);
r547=min(Arl47,YDG4);
r548=min(Arl48,YDG4);
r549=min(Arl49,YDG4);
r550=min(Arl50,YDG4);
r551=min(Arl51,YDG4);
r552=min(Arl52,YDG4);
r553=min(Arl53,YDG4);
r554=min(Arl54,YDG4);
r555=min(Arl55,YDG4);
r556=min(Arl56,YDG4);
r557=min(Arl57,YDG4);
r558=min(Arl58,YDG4);
r559=min(Arl59,YDG4);
r560=min(Arl60,YDG4);
r561=min(Arl61,YDG4);
r562=min(Arl62,YDG4);
r563=min(Arl63,YDG4);
r564=min(Arl64,YDG4);
r565=min(Arl65,YDG4);
r566=min(Arl66,YDG4);
r567=min(Arl67,YDG4);
r568=min(Arl68,YDG4);
r569=min(Arl69,YDG4);
r570=min(Arl70,YDG1);
r571=min(Arl71,YDG4);
r572=min(Arl72,YDG4);
r573=min(Arl73,YDG4);
r574=min(Arl74,YDG4);
r575=min(Arl75,YDG4);
r576=min(Arl76,YDG4);
r577=min(Arl77,YDG4);
r578=min(Arl78,YDG4);
r579=min(Arl79,YDG4);
r580=min(Arl80,YDG4);
r581=min(Arl81,YDG4);
r582=min(Arl82,YDG4);
r583=min(Arl83,YDG4);
r584=min(Arl84,YDG4);
r585=min(Arl85,YDG4);
r586=min(Arl86,YDG4);
r587=min(Arl87,YDG4);
r588=min(Arl88,YDG4);
r589=min(Arl89,YDG4);
r590=min(Arl90,YDG4);
r591=min(Arl91,YDG4);
r592=min(Arl92,YDG4);
r593=min(Arl93,YDG4);
r594=min(Arl94,YDG4);
r595=min(Arl95,YDG4);
r596=min(Arl96,YDG4);
r597=min(Arl97,YDG4);
r598=min(Arl98,YDG4);
r599=min(Arl99,YDG4);
r5100=min(Arl100,YDG4);
r5101=min(Arl101,YDG1);
r5102=min(Arl102,YDG4);
r5103=min(Arl103,YDG4);
r5104=min(Arl104,YDG4);
r5105=min(Arl105,YDG4);
r5106=min(Arl106,YDG4);
r5107=min(Arl107,YDG2);
r5108=min(Arl108,YDG3);

r5109=min(Arl109,YDG4);
r5110=min(Arl110,YDG4);
r5111=min(Arl111,YDG4);
r5112=min(Arl112,YDG4);
r5113=min(Arl113,YDG4);
r5114=min(Arl114,YDG4);
r5115=min(Arl115,YDG4);
r5116=min(Arl116,YDG4);
r5117=min(Arl117,YDG4);
r5118=min(Arl118,YDG4);

r5119=min(Arl119,YDG4);
r5120=min(Arl120,YDG4);
r5121=min(Arl121,YDG4);

r5122=min(Arl122,YDG1);

r5123=min(Arl123,YDG4);
end
function [O1,O2,O3,O4,O5]=Matr(r11,r12 ,r13,r14,r15,r16,r17,r18,r19,r110,...
    r111,r112,r113,r114,r115,r116,r117,r118,r119,r120,r121,r122,r123,r124,...
    r125,r126,r127,r128,...
    r129,r130,r131,r132,r133,r134,r135,r136,r137,r138,r139,r140,r141,r142,...
    r143,r144,r145,r146,r147,r148,r149,r150,r151,r152,r153,r154,r155,r156,...
    r157,r158,r159,r160,r161,r162,r163,r164,r165,r166,r167,r168,r169,r170,...
    r171,r172,r173,r174,r175,r176,r177,r178,r179,r180,r181,r182,r183,r184,...
    r185,r186,r187,r188,r189,r190,r191,r192,r193,r194,r195,r196,r197,r198,...
    r199,r1100,r1101,r1102,r1103,r1104,r1105,r1106,r1107,r1108,r1109,...
    r1110,r1111,r1112,r1113,r1114,r1115,r1116,r1117,r1118,r1119,r1120,r1121,...
    r1122,r1123,r21,r22,r23,r24,r25,r26,r27,r28,r29,r210,r211,r212,r213,r214,...
    r215,r216,r217,r218,r219,r220,r221,r222,r223,r224,r225,r226,r227,r228,...
    r229,r230,r231,r232,r233,r234,r235,r236,r237,r238,r239,r240,r241,r242,...
    r243,r244,r245,r246,r247,r248,r249,r250,r251,r252,r253,r254,r255,r256,...
    r257,r258,r259,r260,r261,r262,r263,r264,r265,r266,r267,r268,r269,r270,...
    r271,r272,r273,r274,r275,r276,r277,r278,r279,r280,r281,r282,r283,r284,...
    r285,r286,r287,r288,r289,r290,r291,r292,r293,r294,r295,r296,r297,r298,...
    r299,r2100,r2101,r2102,r2103,r2104,r2105,r2106,r2107,r2108,r2109,...
    r2110,r2111,r2112,r2113,r2114,r2115,r2116,r2117,r2118,r2119,r2120,r2121,...
    r2122,r2123,r31,r32,r33,r34,r35,r36,r37,r38,r39,r310,r311,r312,r313,r314,...
    r315,r316,r317,r318,r319,r320,r321,r322,r323,r324,r325,r326,r327,r328,...
    r329,r330,r331,r332,r333,r334,r335,r336,r337,r338,r339,r340,r341,r342,...
    r343,r344,r345,r346,r347,r348,r349,r350,r351,r352,r353,r354,r355,r356,...
    r357,r358,r359,r360,r361,r362,r363,r364,r365,r366,r367,r368,r369,r370,...
    r371,r372,r373,r374,r375,r376,r377,r378,r379,r380,r381,r382,r383,r384,...
    r385,r386,r387,r388,r389,r390,r391,r392,r393,r394,r395,r396,r397,r398,...
    r399,r3100,r3101,r3102,r3103,r3104,r3105,r3106,r3107,r3108,r3109,...
    r3110,r3111,r3112,r3113,r3114,r3115,r3116,r3117,r3118,r3119,r3120,r3121,...
    r3122,r3123,r41,r42,r43,r44,r45,r46,r47,r48,r49,r410,r411,r412,r413,r414,...
    r415,r416,r417,r418,r419,r420,r421,r422,r423,r424,r425,r426,r427,r428,...
    r429,r430,r431,r432,r433,r434,r435,r436,r437,r438,r439,r440,r441,r442,...
    r443,r444,r445,r446,r447,r448,r449,r450,r451,r452,r453,r454,r455,r456,...
    r457,r458,r459,r460,r461,r462,r463,r464,r465,r466,r467,r468,r469,r470,...
    r471,r472,r473,r474,r475,r476,r477,r478,r479,r480,r481,r482,r483,r484,...
    r485,r486,r487,r488,r489,r490,r491,r492,r493,r494,r495,r496,r497,r498,...
    r499,r4100,r4101,r4102,r4103,r4104,r4105,r4106,r4107,r4108,r4109,...
    r4110,r4111,r4112,r4113,r4114,r4115,r4116,r4117,r4118,r4119,r4120,r4121,...
    r4122,r4123,r51,r52,r53,r54,r55,r56,r57,r58,r59,r510,r511,r512,r513,r514,...
    r515,r516,r517,r518,r519,r520,r521,r522,r523,r524,r525,r526,r527,r528,...
    r529,r530,r531,r532,r533,r534,r535,r536,r537,r538,r539,r540,r541,r542,...
    r543,r544,r545,r546,r547,r548,r549,r550,r551,r552,r553,r554,r555,r556,...
    r557,r558,r559,r560,r561,r562,r563,r564,r565,r566,r567,r568,r569,r570,...
    r571,r572,r573,r574,r575,r576,r577,r578,r579,r580,r581,r582,r583,r584,...
    r585,r586,r587,r588,r589,r590,r591,r592,r593,r594,r595,r596,r597,r598,...
    r599,r5100,r5101,r5102,r5103,r5104,r5105,r5106,r5107,r5108,r5109,...
    r5110,r5111,r5112,r5113,r5114,r5115,r5116,r5117,r5118,r5119,r5120,...
    r5121,r5122,r5123)

%Matrix for New Technology
O1=[r11;r12 ;r13;r14;r15;r16;r17;r18;r19;r110;r111;r112;r113;r114;...
    r115;r116;r117;r118;r119;r120;r121;r122;r123;r124;r125;r126;r127;r128;...
    r129;r130;r131;r132;r133;r134;r135;r136;r137;r138;r139;r140;r141;r142;...
    r143;r144;r145;r146;r147;r148;r149;r150;r151;r152;r153;r154;r155;r156;...
    r157;r158;r159;r160;r161;r162;r163;r164;r165;r166;r167;r168;r169;r170;...
    r171;r172;r173;r174;r175;r176;r177;r178;r179;r180;r181;r182;r183;r184;...
    r185;r186;r187;r188;r189;r190;r191;r192;r193;r194;r195;r196;r197;r198;...
    r199;r1100;r1101;r1102;r1103;r1104;r1105;r1106;r1107;r1108;r1109;...
    r1110;r1111;r1112;r1113;r1114;r1115;r1116;r1117;r1118;r1119;r1120;...
    r1121;r1122;r1123];
%Matrix for New Modulation
O2=[r21;r22 ;r23;r24;r25;r26;r27;r28;r29;r210;r211;r212;r213;r214;...
    r215;r216;r217;r218;r219;r220;r221;r222;r223;r224;r225;r226;r227;r228;...
    r229;r230;r231;r232;r233;r234;r235;r236;r237;r238;r239;r240;r241;r242;...
    r243;r244;r245;r246;r247;r248;r249;r250;r251;r252;r253;r254;r255;r256;...
    r257;r258;r259;r260;r261;r262;r263;r264;r265;r266;r267;r268;r269;r270;...
    r271;r272;r273;r274;r275;r276;r277;r278;r279;r280;r281;r282;r283;r284;...
    r285;r286;r287;r288;r289;r290;r291;r292;r293;r294;r295;r296;r297;r298;...
    r299;r2100;r2101;r2102;r2103;r2104;r2105;r2106;r2107;r2108;r2109;...
    r2110;r2111;r2112;r2113;r2114;r2115;r2116;r2117;r2118;r2119;r2120;...
    r2121;r2122;r2123];
%Matrix for Code Rate
O3=[r31;r32 ;r33;r34;r35;r36;r37;r38;r39;r310;r311;r312;r313;r314;...
    r315;r316;r317;r318;r319;r320;r321;r322;r323;r324;r325;r326;r327;r328;...
    r329;r330;r331;r332;r333;r334;r335;r336;r337;r338;r339;r340;r341;r342;...
    r343;r344;r345;r346;r347;r348;r349;r350;r351;r352;r353;r354;r355;r356;...
    r357;r358;r359;r360;r361;r362;r363;r364;r365;r366;r367;r368;r369;r370;...
    r371;r372;r373;r374;r375;r376;r377;r378;r379;r380;r381;r382;r383;r384;...
    r385;r386;r387;r388;r389;r390;r391;r392;r393;r394;r395;r396;r397;r398;...
    r399;r3100;r3101;r3102;r3103;r3104;r3105;r3106;r3107;r3108;r3109;...
    r3110;r3111;r3112;r3113;r3114;r3115;r3116;r3117;r3118;r3119;r3120;...
    r3121;r3122;r3123];
%Matrix for Transport Block Size
O4=[r41;r42 ;r43;r44;r45;r46;r47;r48;r49;r410;r411;r412;r413;r414;...
    r415;r416;r417;r418;r419;r420;r421;r422;r423;r424;r425;r426;r427;r428;...
    r429;r430;r431;r432;r433;r434;r435;r436;r437;r438;r439;r440;r441;r442;...
    r443;r444;r445;r446;r447;r448;r449;r450;r451;r452;r453;r454;r455;r456;...
    r457;r458;r459;r460;r461;r462;r463;r464;r465;r466;r467;r468;r469;r470;...
    r471;r472;r473;r474;r475;r476;r477;r478;r479;r480;r481;r482;r483;r484;...
    r485;r486;r487;r488;r489;r490;r491;r492;r493;r494;r495;r496;r497;r498;...
    r499;r4100;r4101;r4102;r4103;r4104;r4105;r4106;r4107;r4108;r4109;...
    r4110;r4111;r4112;r4113;r4114;r4115;r4116;r4117;r4118;r4119;r4120;...
    r4121;r4122;r4123];
%Matrix for Zigbee Frequency
O5=[r51;r52 ;r53;r54;r55;r56;r57;r58;r59;r510;r511;r512;r513;r514;...
    r515;r516;r517;r518;r519;r520;r521;r522;r523;r524;r525;r526;r527;r528;...
    r529;r530;r531;r532;r533;r534;r535;r536;r537;r538;r539;r540;r541;r542;...
    r543;r544;r545;r546;r547;r548;r549;r550;r551;r552;r553;r554;r555;r556;...
    r557;r558;r559;r560;r561;r562;r563;r564;r565;r566;r567;r568;r569;r570;...
    r571;r572;r573;r574;r575;r576;r577;r578;r579;r580;r581;r582;r583;r584;...
    r585;r586;r587;r588;r589;r590;r591;r592;r593;r594;r595;r596;r597;r598;...
    r599;r5100;r5101;r5102;r5103;r5104;r5105;r5106;r5107;r5108;r5109;...
    r5110;r5111;r5112;r5113;r5114;r5115;r5116;r5117;r5118;r5119;r5120;...
    r5121;r5122;r5123];
end
function [out1,out2,out3,out4,out5] = Maximo(O1,O2,O3,O4,O5)
out1 = max(O1);
out2 = max(O2);
out3 = max(O3);
out4 = max(O4);
out5 = max(O5);
end
function [yout] = EIASC(Wr,Wl,X,needSort)

Xr=X;
Xl=Xr;
ly=length(Xl); 
XrEmpty=isempty(Xr);

if max(Wl)==0 
    yl=min(Xl); 
    yr=max(Xr);
    yout=(yl+yr)/2;
    l=1; 
    r=ly-1;
    return;
end

index=find(Wr<10^(-10)); 

if length(index)==ly 
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
if needSort [Xl,index]=sort(Xl); 
    Xr=Xr(index);
    Wl=Wl(index);
    Wr=Wr(index);
end

Wl2=Wl;
Wr2=Wr;

for i=length(Xl):-1:2 
    if Xl(i)==Xl(i-1) 
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
    yl=Xl(end); 
    l=0;
    a=Xl*Wl';
    b=sum(Wl);
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
    for i=length(Xr):-1:2 
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
yout=(yl+yr)/2;
end
end
function [New_Tech, New_Mod, New_CR, New_TB, New_ZBFreq]= Out_Final(outNT, outNM, outNCR, outNTB, outNZF)

% Technology chosen
y1c1= 0.0833; %Zigbee
y1c2 = 0.25; % HSPA Neighbor
y1c3= 0.4166; % HSPA Serving
y1c4= 0.5833; % LTE Neighbor
y1c5= 0.75; % LTE Serving
y1c6= 0.9166; % WLAN

a1=[y1c1 y1c2 y1c3 y1c4 y1c5 y1c6];
n=outNT;
[val,idx]=min(abs(a1-n));
b1= ["Zigbee" "HSPA Possible Neighbor" "HSPA Possible Serving" ...
    "LTE Possible Neighbor" "LTE Possible Serving" "WLAN" ];
New_Tech=b1(idx);


% New Modulation
y2c1= 0.10; % 64-QAM
y2c2= 0.30; % 16-QAM
y2c3= 0.50; % QPSK
y2c4= 0.70; % O-QPSK
y2c5= 0.90; % BPSK

a2=[y2c1 y2c2 y2c3 y2c4 y2c5];
n=outNM;
[val,idx]=min(abs(a2-n));
b2= ["64-QAM" "16-QAM" "QPSK" "O-QPSK" "BPSK"];
New_Mod=b2(idx);

% New Code Rate - Ordered from less to highest

y3c1= 0.03; % 0.926
y3c2= 0.08; % 0.853
y3c3= 0.13; % 0.83
y3c4= 0.18; % 0.754
y3c5= 0.23; % 0.75
y3c6= 0.28; % 0.66
y3c7= 0.33; % 0.65
y3c8= 0.38; % 0.602
y3c9= 0.43; % 0.588
y3c10= 0.48; % 0.554
y3c11= 0.53; % 0.5
y3c12= 0.58; % 0.479
y3c13= 0.63; % 0.455
y3c14= 0.68; % 0.438
y3c15= 0.73; % 0.369
y3c16= 0.78; % 0.301
y3c17= 0.83; % 0.188
y3c18= 0.88; % 0.117
y3c19= 0.93; % 0.076
y3c20= 0.98; % 0 Without Code Rate
stdy3 = (y3c2 - y3c1)/2 ; % Std Dev is calculated as half of the distance of the centers

a3=[y3c1 y3c2 y3c3 y3c4 y3c5 y3c6 y3c7 y3c8 y3c9 y3c10 y3c11 y3c12 y3c13...
    y3c14 y3c15 y3c16 y3c17 y3c18 y3c19 y3c20];
n=outNCR;
[val,idx]=min(abs(a3-n));
b3= ["0.926" "0.853" "0.83" "0.754" "0.75" "0.66" "0.65" "0.602" "0.588" "0.554" ...
    "0.5" "0.479" "0.455" "0.438" "0.369" "0.301" "0.188" "0.117" "0.076" "Without Code Rate" ];
New_CR=b3(idx);


% New Transport Block Size  - Ordered from less to highest

y4c1= 0.03125; % 38576
y4c2= 0.0625; % 32264
y4c3= 0.09375; % 26504
y4c4= 0.125; % 21768
y4c5= 0.15625; % 15776
y4c6= 0.1875; % 14424
y4c7= 0.21875; % 11432
y4c8= 0.25; % 9736
y4c9= 0.28125; % 7184
y4c10= 0.3125; % 6568
y4c11= 0.34375; % 5896
y4c12= 0.375; % 5296
y4c13= 0.40625; % 4672
y4c14= 0.4375; % 4200
y4c15= 0.46875; % 3576
y4c16= 0.5; % 3328
y4c17= 0.53125; % 2592
y4c18= 0.5625; % 2288
y4c19= 0.59375; % 1744
y4c20= 0.625; % 1488
y4c21= 0.65625; % 1264
y4c22= 0.6875; % 928
y4c23= 0.71875; % 792
y4c24= 0.75; % 648
y4c25= 0.78125; % 464
y4c26= 0.8125; % 376
y4c27= 0.84375; % 320
y4c28= 0.875; % 232
y4c29= 0.90625; % 176
y4c30= 0.9375; % 136
y4c31= 0.96875; % 0 - No Transport Block size


a4=[y4c1 y4c2 y4c3 y4c4 y4c5 y4c6 y4c7 y4c8 y4c9 y4c10 y4c11 y4c12 y4c13...
    y4c14 y4c15 y4c16 y4c17 y4c18 y4c19 y4c20 y4c21 y4c22 y4c23 y4c24...
    y4c25 y4c26 y4c27 y4c28 y4c29 y4c30 y4c31];
n=outNTB;
[val,idx]=min(abs(a4-n));
b4= ["38576" "32264" "26504" "21768" "15776" "14424" "11432" "9736" "7184"...
    "6568" "5896" "5296" "4672"	"4200" "3576" "3328" "2592"	"2288"	"1744"...
    "1488" "1264" "928" "792" "648" "464" "376"	"320" "232"	"176" "136" "Without Transport Block"];
New_TB=b4(idx);

% Zigbee Frequency

y5c1= 0.125; % 779-787 Hz
y5c2= 0.375; % 902-928 Hz
y5c3= 0.625; % 868-868.6 Hz
y5c4= 0.875; % 0 - No Zigbee Frequency

a5=[y5c1 y5c2 y5c3 y5c4];
n=outNZF;
[val,idx]=min(abs(a5-n));
b5= ["779-787 Hz" "902-928 Hz" "868-868.6 Hz" "No Zigbee Frequency"];
New_ZBFreq=b5(idx);


end