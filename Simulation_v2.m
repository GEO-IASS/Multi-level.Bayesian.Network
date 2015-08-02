clear all
False = 1;
True = 2;
Remove = [];

%%
% 定义节点
 a1 =  1;  r1 =  2;  a2 =  3;  r2 =  4;  r3 =  5;  a3 =  6;  a4 =  7;  r4 =  8;  r5 =  9;  a5 = 10; 
 r6 = 11;  a6 = 12;  r7 = 13;  r8 = 14;  r9 = 15; r10 = 16;  a7 = 17;  a8 = 18;  a9 = 19; a10 = 20; 
r11 = 21; r12 = 22; r13 = 23; a11 = 24; a12 = 25; a13 = 26; a14 = 27; a15 = 28; a16 = 29; a17 = 30; 
a18 = 31; a19 = 32; a20 = 33;  f1 = 34;  f2 = 35;  f3 = 36;  f4 = 37;  f5 = 38;  f6 = 39;  f7 = 40; 
 f8 = 41;  f9 = 42; f10 = 43; f11 = 44; f12 = 45;  e1 = 46;  e2 = 47;  e3 = 48;  e7 = 49;  e4 = 50; 
 e5 = 51;  e6 = 52;  x1 = 53;  x2 = 54;  x3 = 55;  x4 = 56;  x5 = 57; 
                    
%%
% 定义 Labels
Labels = {
 'a1',  'r1',  'a2',  'r2',  'r3',  'a3',  'a4',  'r4',  'r5',  'a5',  ... 
 'r6',  'a6',  'r7',  'r8',  'r9', 'r10',  'a7',  'a8',  'a9', 'a10',  ... 
'r11', 'r12', 'r13', 'a11', 'a12', 'a13', 'a14', 'a15', 'a16', 'a17',  ... 
'a18', 'a19', 'a20',  'f1',  'f2',  'f3',  'f4',  'f5',  'f6',  'f7',  ... 
 'f8',  'f9', 'f10', 'f11', 'f12',  'e1',  'e2',  'e3',  'e7',  'e4',  ... 
 'e5',  'e6',  'x1',  'x2',  'x3',  'x4',  'x5'
};


[~, N] = size(Labels);
Network = zeros(N, N);  

%% 
% 攻击层
Network(a1, r1) = 1;
Network(r1, a2) = 1;
Network(a2, [r2, r3]) = 1;
Network(r2, a3) = 1;
Network(a3, r4) = 1;
Network(r3, a4) = 1;
Network(a4, r5) = 1;
Network([r4 r5], a5) = 1;
Network(a5, r6) = 1;
Network(r6, a6) = 1;
Network(a6, [r7 r8 r9 r10]) = 1;
Network(r7, a7) = 1;
Network(r8, a8) = 1;
Network(r9, a9) = 1;
Network(r10, a10) = 1;
Network(a7, r11) = 1;
Network([a8 a9], r12) = 1;
Network(a10, r13) = 1;
Network(r11, [a11 a12 a13 a14 a15]) = 1;
Network(r12, [a11 a12 a13 a14 a15]) = 1;
Network(r13, [a11 a12 a13 a14 a15 a16 a17 a18 a19 a20]) = 1;

%% 
% 功能层
Network(a11, [f1 f2]) = 1;
Network(a12, f6) = 1;
Network(a13, [f7 f8 f9]) = 1;
Network(a14, [f3 f4]) = 1;
Network(a15, f5) = 1;
Network(a16, [f1 f2]) = 1;
Network(a17, f6) = 1;
Network(a18, [f7 f8 f9]) = 1;
Network(a19, [f3 f4]) = 1;
Network(a20, f5) = 1;

Network([f1 f2 f3 f7], f10) = 1;
Network([f1 f2 f3 f5 f8], f11) = 1;
Network([f4 f9], f12) = 1;

%%
% 事件层
Network(f10, e1) = 1;
Network(f11, e2) = 1;
Network(f12, e3) = 1;
Network(f6, e7) = 1;
Network(e1, [e4 e6]) = 1;
Network(e3, e5) = 1;

Network([e2 e3 e5 e6 e7], x1) = 1;
Network([e5 e3], x2) = 1;
Network([e4 e5], x3) = 1;
Network(e5, x4) = 1;
Network([e5 e6], x5) = 1;

%%

discrete_nodes = 1:N;  
node_sizes= 2 * ones(1, N); 
bnet = mk_bnet(Network, node_sizes, 'names', Labels, 'discrete', discrete_nodes);  

%%
% 条件概率
bnet.CPD{ a1} = tabular_CPD(bnet,  a1, [0.9999,0.0001]);
bnet.CPD{ r1} = tabular_CPD(bnet,  r1, [0.9999,0.0001,0.0001,0.9999]);
bnet.CPD{ a2} = tabular_CPD(bnet,  a2, [0.9999,0.3500,0.0001,0.6500]);
bnet.CPD{ r2} = tabular_CPD(bnet,  r2, [0.9999,0.1500,0.0001,0.8500]);
bnet.CPD{ r3} = tabular_CPD(bnet,  r3, [0.9999,0.4500,0.0001,0.5500]);
bnet.CPD{ a3} = tabular_CPD(bnet,  a3, [0.9998,0.1000,0.0002,0.9000]);
bnet.CPD{ a4} = tabular_CPD(bnet,  a4, [0.9997,0.3500,0.0003,0.6500]);
bnet.CPD{ r4} = tabular_CPD(bnet,  r4, [0.9998,0.0800,0.0002,0.9200]);
bnet.CPD{ r5} = tabular_CPD(bnet,  r5, [0.9999,0.2600,0.0001,0.7400]);
bnet.CPD{ a5} = tabular_CPD(bnet,  a5, [0.9999,0.9999,0.9999,0.3500,0.0001,0.0001,0.0001,0.6500]);
bnet.CPD{ r6} = tabular_CPD(bnet,  r6, [0.9999,0.1200,0.0001,0.8800]);
bnet.CPD{ a6} = tabular_CPD(bnet,  a6, [0.9998,0.2500,0.0002,0.7500]);
bnet.CPD{ r7} = tabular_CPD(bnet,  r7, [0.9998,0.1500,0.0002,0.8500]);
bnet.CPD{ r8} = tabular_CPD(bnet,  r8, [0.9998,0.2500,0.0002,0.7500]);
bnet.CPD{ r9} = tabular_CPD(bnet,  r9, [0.9998,0.2300,0.0002,0.7700]);
bnet.CPD{r10} = tabular_CPD(bnet, r10, [0.9998,0.3100,0.0002,0.6900]);
bnet.CPD{ a7} = tabular_CPD(bnet,  a7, [0.9997,0.2200,0.0003,0.7800]);
bnet.CPD{ a8} = tabular_CPD(bnet,  a8, [0.9997,0.2000,0.0003,0.8000]);
bnet.CPD{ a9} = tabular_CPD(bnet,  a9, [0.9997,0.2000,0.0003,0.8000]);
bnet.CPD{a10} = tabular_CPD(bnet, a10, [0.9997,0.2000,0.0003,0.8000]);
bnet.CPD{r11} = tabular_CPD(bnet, r11, [0.9994,0.1400,0.0006,0.8600]);
bnet.CPD{r12} = tabular_CPD(bnet, r12, [0.9999,0.2000,0.2000,0.0500,0.0001,0.8000,0.8000,0.9500]);
bnet.CPD{r13} = tabular_CPD(bnet, r13, [0.9997,0.1200,0.0003,0.8800]);
bnet.CPD{a11} = tabular_CPD(bnet, a11, [0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.1150,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.8850]);
bnet.CPD{a12} = tabular_CPD(bnet, a12, [0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.3500,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.6500]);
bnet.CPD{a13} = tabular_CPD(bnet, a13, [0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.2500,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.7500]);
bnet.CPD{a14} = tabular_CPD(bnet, a14, [0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.1133,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.8867]);
bnet.CPD{a15} = tabular_CPD(bnet, a15, [0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.9999,0.0819,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001,0.9181]);
bnet.CPD{a16} = tabular_CPD(bnet, a16, [0.9998,0.0800,0.0002,0.9200]);
bnet.CPD{a17} = tabular_CPD(bnet, a17, [0.9999,0.0778,0.0001,0.9222]);
bnet.CPD{a18} = tabular_CPD(bnet, a18, [0.9998,0.1099,0.0002,0.8901]);
bnet.CPD{a19} = tabular_CPD(bnet, a19, [0.9998,0.0900,0.0002,0.9100]);
bnet.CPD{a20} = tabular_CPD(bnet, a20, [0.9999,0.0900,0.0001,0.9100]);
bnet.CPD{ f1} = tabular_CPD(bnet,  f1, [0.9999,0.4400,0.3200,0.1442,0.0001,0.5600,0.6800,0.8558]);
bnet.CPD{ f2} = tabular_CPD(bnet,  f2, [0.9999,0.4414,0.2159,0.1313,0.0001,0.5586,0.7841,0.8687]);
bnet.CPD{ f3} = tabular_CPD(bnet,  f3, [0.9999,0.7600,0.3200,0.2000,0.0001,0.2400,0.6800,0.8000]);
bnet.CPD{ f4} = tabular_CPD(bnet,  f4, [0.9999,0.4400,0.1155,0.1104,0.0001,0.5600,0.8845,0.8896]);
bnet.CPD{ f5} = tabular_CPD(bnet,  f5, [0.9999,0.1400,0.3145,0.1473,0.0001,0.8600,0.6855,0.8527]);
bnet.CPD{ f6} = tabular_CPD(bnet,  f6, [0.9999,0.5542,0.3189,0.2134,0.0001,0.4458,0.6811,0.7866]);
bnet.CPD{ f7} = tabular_CPD(bnet,  f7, [0.9999,0.4334,0.5532,0.1500,0.0001,0.5666,0.4468,0.8500]);
bnet.CPD{ f8} = tabular_CPD(bnet,  f8, [0.9999,0.3700,0.3200,0.2665,0.0001,0.6300,0.6800,0.7335]);
bnet.CPD{ f9} = tabular_CPD(bnet,  f9, [0.9999,0.4444,0.6132,0.1013,0.0001,0.5556,0.3868,0.8987]);
bnet.CPD{f10} = tabular_CPD(bnet, f10, [0.9999,0.9999,0.9998,0.5000,0.9997,0.5400,0.3400,0.1400,0.9998,0.6700,0.6400,0.3200,0.4500,0.1400,0.1500,0.1400,0.0001,0.0001,0.0002,0.5000,0.0003,0.4600,0.6600,0.8600,0.0002,0.3300,0.3600,0.6800,0.5500,0.8600,0.8500,0.8600]);
bnet.CPD{f11} = tabular_CPD(bnet, f11, [0.9999,0.9998,0.9997,0.8000,0.9994,0.9950,0.9940,0.9200,0.9996,0.7000,0.5500,0.6800,0.6000,0.5900,0.6945,0.4400,0.9997,0.9991,0.8000,0.6400,0.7744,0.5477,0.6500,0.4477,0.7500,0.5479,0.5300,0.13934770,0.2300,0.3500,0.1600,0.1200,0.0001,0.0002,0.0003,0.2000,0.0006,0.0050,0.0060,0.0800,0.0004,0.3000,0.4500,0.3200,0.4000,0.4100,0.3055,0.5600,0.0003,0.0009,0.2000,0.3600,0.2256,0.4523,0.3500,0.5523,0.2500,0.4521,0.4700,0.86065230,0.7700,0.6500,0.8400,0.8800]);
bnet.CPD{f12} = tabular_CPD(bnet, f12, [0.9999,0.5000,0.5000,0.2000,0.0001,0.5000,0.5000,0.8000]);
bnet.CPD{ e1} = tabular_CPD(bnet,  e1, [0.9997,0.2000,0.0003,0.8000]);
bnet.CPD{ e2} = tabular_CPD(bnet,  e2, [0.9997,0.1334,0.0003,0.8666]);
bnet.CPD{ e3} = tabular_CPD(bnet,  e3, [0.9999,0.3230,0.0001,0.6770]);
bnet.CPD{ e7} = tabular_CPD(bnet,  e7, [0.9998,0.1000,0.0002,0.9000]);
bnet.CPD{ e4} = tabular_CPD(bnet,  e4, [0.9999,0.7435,0.0001,0.2565]);
bnet.CPD{ e5} = tabular_CPD(bnet,  e5, [0.9997,0.9000,0.0003,0.1000]);
bnet.CPD{ e6} = tabular_CPD(bnet,  e6, [0.9998,0.8440,0.0002,0.1560]);
bnet.CPD{ x3} = tabular_CPD(bnet,  x3, [1.0000,0.0000,0.0000,0.0000,0.0000,1.0000,1.0000,1.0000]);
bnet.CPD{ x4} = tabular_CPD(bnet,  x4, [1.0000,0.0000,0.0000,1.0000]);
bnet.CPD{ x1} = tabular_CPD(bnet,  x1, [1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000,1.0000]);
bnet.CPD{ x2} = tabular_CPD(bnet,  x2, [1.0000,0.0000,0.0000,0.0000,0.0000,1.0000,1.0000,1.0000]);
bnet.CPD{ x5} = tabular_CPD(bnet,  x5, [1.0000,0.0000,0.0000,0.0000,0.0000,1.0000,1.0000,1.0000]);

%%
% 画图
% [x,y] = draw_graph(Network, Labels);

%%
tic
engine=jtree_inf_engine(bnet);  
evidence=cell(1, N);  
% evidence{a2}= True;

%%
% 动态过程
E = [  a1,  a2,  a1,  a2,  a5,  a6,  a1,  a2,  a8,  f1,  f2, ...
       f5,  f7,  f9, -f9, -f7, -f5, -f1, -f2,  a1,  a3,  a2];
T = [   0,   5,  10,  11,  16,  25,  30,  40,  46,  55,  56, ...
       60,  70,  77,  84,  89,  99, 110, 125, 135, 150, 185]/5;

[~, Length] = size(E);
px1 = zeros(1,Length);
px2 = zeros(1,Length);
px3 = zeros(1,Length);
px4 = zeros(1,Length);
px5 = zeros(1,Length);

ESet = cell(1, N);
Time = 4/5;

LastTime = 0;

for i = 1:Length
    % 如果是负的，去掉证据，表示功能恢复了
    if E(i) <= 0
        ESet{abs(E(i))} = [];
    else
        % 如果不是攻击证据
        if Labels{E(i)}(1) ~= 'a'
            % 直接添加到证据集当中
        else
             % 如果是攻击证据
            if T(i) - LastTime > Time
                for j = 1:Length
                    if Labels{abs(E(j))}(1) == 'a'
                        % 直接添加到证据集当中
                        ESet{abs(E(j))} = [];
                    end
                end
            end
        end   
        ESet{E(i)} = True;       
    end      
    
    [engine,loglik]=enter_evidence(engine,ESet);
    LastTime = T(i);
    m=marginal_nodes(engine, x1);  
    px1(1,i) = m.T(2);
    m=marginal_nodes(engine, x2);  
    px2(1,i) = m.T(2);
    m=marginal_nodes(engine, x3);  
    px3(1,i) = m.T(2);
    m=marginal_nodes(engine, x4);  
    px4(1,i) = m.T(2);
    m=marginal_nodes(engine, x5);  
    px5(1,i) = m.T(2);    
end

% plot(T, px1, ':');
% hold on;
plot(T, px2, ':r');
hold on;
plot(T, px3, 'g');
hold on;
plot(T, px4);
% hold on;
% plot(T, px5);
xlabel('时间(h)');
ylabel('概率');
legend('设备损坏','产品不达标或者无法产出','河流及土壤污染');


figure
Loss = [50000, 500000,10000];
Risk = [px2', px3', px4'] * Loss';
plot(T, Risk);
xlabel('时间(h)');
ylabel('系统潜在损失(元)');
axis([0 200/5 0 200000]);
% for i = 1:l
%     [engine,loglik]=enter_evidence(engine,evidence);  
%     m=marginal_nodes(engine, x1);  
%     px1(1,i) = m.T(2);
%     m=marginal_nodes(engine, x2);  
%     px2(1,i) = m.T(2);
%     m=marginal_nodes(engine, x3);  
%     px3(1,i) = m.T(2);
%     m=marginal_nodes(engine, x4);  
%     px4(1,i) = m.T(2);
%     m=marginal_nodes(engine, x5);  
%     px5(1,i) = m.T(2);
%     evidence{E(i)} = True;
% end

% plot(px1,':');
% hold on;
% plot(px2,':r');
% hold on;
% plot(px3,'b');
% hold on;
% plot(px4,'*');
% hold on;
% plot(px5);
% 
% legend('x1','x2','x3','x4','x5');

%% 
% 显示所有的概率
% evidence{a1} = True;
% evidence{a1} = Remove;
% [engine,loglik]=enter_evidence(engine,evidence);  
% 
% m=marginal_nodes(engine, a3);  
% disp([Labels(a3), m.T(2)]);


toc
