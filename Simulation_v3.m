clear all
False = 1;
True = 2;
Remove = [];

%%
% ����ڵ�
 a1 =  1;  r1 =  2;  a2 =  3;  r2 =  4;  r3 =  5;  a3 =  6;  a4 =  7;  r4 =  8;  r5 =  9;  a5 = 10; 
 r6 = 11;  a6 = 12;  r7 = 13;  r8 = 14;  r9 = 15; r10 = 16;  a7 = 17;  a8 = 18;  a9 = 19; a10 = 20; 
r11 = 21; r12 = 22; r13 = 23; a11 = 24; a12 = 25; a13 = 26; a14 = 27; a15 = 28; a16 = 29; a17 = 30; 
a18 = 31; a19 = 32; a20 = 33;  f1 = 34;  f2 = 35;  f3 = 36;  f4 = 37;  f5 = 38;  f6 = 39;  f7 = 40; 
 f8 = 41;  f9 = 42; f10 = 43; f11 = 44; f12 = 45;  e1 = 46;  e2 = 47;  e3 = 48;  e7 = 49;  e4 = 50; 
 e5 = 51;  e6 = 52;  x1 = 53;  x2 = 54;  x3 = 55;  x4 = 56;  x5 = 57; 
                    
%%
% ���� Labels
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
% ������
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
% ���ܲ�
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
% �¼���
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
% ��������
bnet.CPD{ a1} = tabular_CPD(bnet,  a1, [0.99999999,0.00000001]);
bnet.CPD{ r1} = tabular_CPD(bnet,  r1, [0.99999999,0.00000100,0.00000001,0.99999900]);
bnet.CPD{ a2} = tabular_CPD(bnet,  a2, [0.99999999,0.35000000,0.00000001,0.65000000]);
bnet.CPD{ r2} = tabular_CPD(bnet,  r2, [0.99999999,0.15000000,0.00000001,0.85000000]);
bnet.CPD{ r3} = tabular_CPD(bnet,  r3, [0.99999999,0.45000000,0.00000001,0.55000000]);
bnet.CPD{ a3} = tabular_CPD(bnet,  a3, [0.99999998,0.10000000,0.00000002,0.90000000]);
bnet.CPD{ a4} = tabular_CPD(bnet,  a4, [0.99999997,0.35000000,0.00000003,0.65000000]);
bnet.CPD{ r4} = tabular_CPD(bnet,  r4, [0.99999998,0.08000000,0.00000002,0.92000000]);
bnet.CPD{ r5} = tabular_CPD(bnet,  r5, [0.99999999,0.26000000,0.00000001,0.74000000]);
bnet.CPD{ a5} = tabular_CPD(bnet,  a5, [0.99999999,0.99999999,0.99999999,0.35000000,0.00000001,0.00000001,0.00000001,0.65000000]);
bnet.CPD{ r6} = tabular_CPD(bnet,  r6, [0.99999999,0.12000000,0.00000001,0.88000000]);
bnet.CPD{ a6} = tabular_CPD(bnet,  a6, [0.99999998,0.25000000,0.00000002,0.75000000]);
bnet.CPD{ r7} = tabular_CPD(bnet,  r7, [0.99999998,0.15000000,0.00000002,0.85000000]);
bnet.CPD{ r8} = tabular_CPD(bnet,  r8, [0.99999998,0.25000000,0.00000002,0.75000000]);
bnet.CPD{ r9} = tabular_CPD(bnet,  r9, [0.99999998,0.23000000,0.00000002,0.77000000]);
bnet.CPD{r10} = tabular_CPD(bnet, r10, [0.99999998,0.31000000,0.00000002,0.69000000]);
bnet.CPD{ a7} = tabular_CPD(bnet,  a7, [0.99999997,0.22000000,0.00000003,0.78000000]);
bnet.CPD{ a8} = tabular_CPD(bnet,  a8, [0.99999997,0.20000000,0.00000003,0.80000000]);
bnet.CPD{ a9} = tabular_CPD(bnet,  a9, [0.99999997,0.20000000,0.00000003,0.80000000]);
bnet.CPD{a10} = tabular_CPD(bnet, a10, [0.99999997,0.20000000,0.00000003,0.80000000]);
bnet.CPD{r11} = tabular_CPD(bnet, r11, [0.99999994,0.14000000,0.00000006,0.86000000]);
bnet.CPD{r12} = tabular_CPD(bnet, r12, [0.99999999,0.20000000,0.20000000,0.05000000,0.00000001,0.80000000,0.80000000,0.95000000]);
bnet.CPD{r13} = tabular_CPD(bnet, r13, [0.99999997,0.12000000,0.00000003,0.88000000]);
bnet.CPD{a11} = tabular_CPD(bnet, a11, [0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.11500000,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.88500000]);
bnet.CPD{a12} = tabular_CPD(bnet, a12, [0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.35000000,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.65000000]);
bnet.CPD{a13} = tabular_CPD(bnet, a13, [0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.25000000,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.75000000]);
bnet.CPD{a14} = tabular_CPD(bnet, a14, [0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.11330000,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.88670000]);
bnet.CPD{a15} = tabular_CPD(bnet, a15, [0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.99999999,0.08190000,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.00000001,0.91810000]);
bnet.CPD{a16} = tabular_CPD(bnet, a16, [0.99999998,0.08000000,0.00000002,0.92000000]);
bnet.CPD{a17} = tabular_CPD(bnet, a17, [0.99999999,0.07780000,0.00000001,0.92220000]);
bnet.CPD{a18} = tabular_CPD(bnet, a18, [0.99999998,0.10990000,0.00000002,0.89010000]);
bnet.CPD{a19} = tabular_CPD(bnet, a19, [0.99999998,0.09000000,0.00000002,0.91000000]);
bnet.CPD{a20} = tabular_CPD(bnet, a20, [0.99999999,0.09000000,0.00000001,0.91000000]);
bnet.CPD{ f1} = tabular_CPD(bnet,  f1, [0.99999999,0.44000000,0.32000000,0.14420000,0.00000001,0.56000000,0.68000000,0.85580000]);
bnet.CPD{ f2} = tabular_CPD(bnet,  f2, [0.99999999,0.44140000,0.21590000,0.13130000,0.00000001,0.55860000,0.78410000,0.86870000]);
bnet.CPD{ f3} = tabular_CPD(bnet,  f3, [0.99999999,0.76000000,0.32000000,0.20000000,0.00000001,0.24000000,0.68000000,0.80000000]);
bnet.CPD{ f4} = tabular_CPD(bnet,  f4, [0.99999999,0.44000000,0.11550000,0.11040000,0.00000001,0.56000000,0.88450000,0.88960000]);
bnet.CPD{ f5} = tabular_CPD(bnet,  f5, [0.99999999,0.14000000,0.31450000,0.14730000,0.00000001,0.86000000,0.68550000,0.85270000]);
bnet.CPD{ f6} = tabular_CPD(bnet,  f6, [0.99999999,0.55420000,0.31890000,0.21340000,0.00000001,0.44580000,0.68110000,0.78660000]);
bnet.CPD{ f7} = tabular_CPD(bnet,  f7, [0.99999999,0.43340000,0.55320000,0.15000000,0.00000001,0.56660000,0.44680000,0.85000000]);
bnet.CPD{ f8} = tabular_CPD(bnet,  f8, [0.99999999,0.37000000,0.32000000,0.26650000,0.00000001,0.63000000,0.68000000,0.73350000]);
bnet.CPD{ f9} = tabular_CPD(bnet,  f9, [0.99999999,0.44440000,0.61320000,0.10130000,0.00000001,0.55560000,0.38680000,0.89870000]);
bnet.CPD{f10} = tabular_CPD(bnet, f10, [0.99999999,0.99999999,0.99999998,0.50000000,0.99999997,0.54000000,0.34000000,0.14000000,0.99999998,0.67000000,0.64000000,0.32000000,0.45000000,0.14000000,0.15000000,0.14000000,0.00000001,0.00000001,0.00000002,0.50000000,0.00000003,0.46000000,0.66000000,0.86000000,0.00000002,0.33000000,0.36000000,0.68000000,0.55000000,0.86000000,0.85000000,0.86000000]);
bnet.CPD{f11} = tabular_CPD(bnet, f11, [0.99999999,0.99999998,0.99999997,0.80000000,0.99999994,0.99999950,0.99400000,0.92000000,0.99999996,0.70000000,0.55000000,0.68000000,0.60000000,0.59000000,0.69450000,0.44000000,0.99999997,0.99999991,0.80000000,0.64000000,0.77440000,0.54770000,0.65000000,0.44770000,0.75000000,0.54790000,0.53000000,0.13935000,0.97700000,0.23000000,0.35000000,0.16000000,0.00000001,0.00000002,0.00000003,0.20000000,0.00000006,0.00000050,0.00600000,0.08000000,0.00000004,0.30000000,0.45000000,0.32000000,0.40000000,0.41000000,0.30550000,0.56000000,0.00000003,0.00000009,0.20000000,0.36000000,0.22560000,0.45230000,0.35000000,0.55230000,0.25000000,0.45210000,0.47000000,0.86065000,0.02300000,0.77000000,0.65000000,0.84000000]);
bnet.CPD{f12} = tabular_CPD(bnet, f12, [0.99999999,0.50000000,0.50000000,0.20000000,0.00000001,0.50000000,0.50000000,0.80000000]);
bnet.CPD{ e1} = tabular_CPD(bnet,  e1, [0.99999997,0.20000000,0.00000003,0.80000000]);
bnet.CPD{ e2} = tabular_CPD(bnet,  e2, [0.99999997,0.13340000,0.00000003,0.86660000]);
bnet.CPD{ e3} = tabular_CPD(bnet,  e3, [0.99999999,0.32300000,0.00000001,0.67700000]);
bnet.CPD{ e7} = tabular_CPD(bnet,  e7, [0.99999998,0.10000000,0.00000002,0.90000000]);
bnet.CPD{ e4} = tabular_CPD(bnet,  e4, [0.99999999,0.74350000,0.00000001,0.25650000]);
bnet.CPD{ e5} = tabular_CPD(bnet,  e5, [0.99999997,0.90000000,0.00000003,0.10000000]);
bnet.CPD{ e6} = tabular_CPD(bnet,  e6, [0.99999998,0.84400000,0.00000002,0.15600000]);
bnet.CPD{ x3} = tabular_CPD(bnet,  x3, [1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,1.00000000]);
bnet.CPD{ x4} = tabular_CPD(bnet,  x4, [1.00000000,0.00000000,0.00000000,1.00000000]);
bnet.CPD{ x1} = tabular_CPD(bnet,  x1, [1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000]);
bnet.CPD{ x2} = tabular_CPD(bnet,  x2, [1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,1.00000000]);
bnet.CPD{ x5} = tabular_CPD(bnet,  x5, [1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,1.00000000]);



%%
% ��ͼ
% [x,y] = draw_graph(Network, Labels);

%%
tic
engine=jtree_inf_engine(bnet);  
% evidence{a2}= True;

%%
% ��̬����
E = [  a1,  a2,  a1,  a2,  a5,  a6,  a1,  a2,  a8,  f1,  f2, ...
       f5,  f7,  f9, -f9, -f7, -f5, -f1, -f2,  a1,  a3,  a2];
T = [   0,   5,  10,  11,  16,  25,  30,  40,  46,  55,  56, ...
       60,  70,  77,  84,  89,  99, 110, 125, 135, 150, 185];

[~, Length] = size(E);
px1 = zeros(1,Length);
px2 = zeros(1,Length);
px3 = zeros(1,Length);
px4 = zeros(1,Length);
px5 = zeros(1,Length);

ESet = cell(1, N);
TimeThreshold = 4;
LastTime = 0;
MaxTime = 200;

for i = 1:MaxTime
    % Find evidence in evidence list E and time list T
    [Evidence, Time] = FindEvidence(E, T, i);

    % If there is no evidence
    if Evidence == 0;
        % Continue loop
        continue;
    end
    
    % If Evidence < 0, it represents that the evidence is function loss or
    % incidenc, and the broken function has been fixed up. Remove the evidence from the ESet.
    if Evidence < 0;
        ESet = RemoveEvidence(ESet, Evidence);
    end
end





% 
% for i = 1:Length
%     % ����Ǹ��ģ�ȥ��֤�ݣ���ʾ���ָܻ���
%     if E(i) <= 0
%         ESet{abs(E(i))} = [];
%     else
%         % ������ǹ���֤��
%         if Labels{E(i)}(1) ~= 'a'
%             % ֱ�����ӵ�֤�ݼ�����
%         else
%              % ����ǹ���֤��
%             if T(i) - LastTime > Time
%                 % ������ι����ļ������ʱ�� Time�����֤�ݼ��е�
%                 for j = 1:Length
%                     if Labels{abs(E(j))}(1) == 'a'
%                         % ֱ�����ӵ�֤�ݼ�����
%                         ESet{abs(E(j))} = [];
%                     end
%                 end
%             end
%         end   
%         ESet{E(i)} = True;       
%     end      
%     
%     [engine,loglik]=enter_evidence(engine,ESet);
%     LastTime = T(i);
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
% end

plot(T, px1, ':');
hold on;
plot(T, px2, ':r');
hold on;
plot(T, px3, 'g');
hold on;
plot(T, px4);
hold on;
plot(T, px5, 'k');
xlabel('Time');
ylabel('Probability');
legend('x1','x2','x3','x4','x5');


figure
Loss = [50000, 500000, 10000, 30000, 25000];
Risk = [px1; px2; px3; px4; px5]' * Loss';
plot(T, Risk);
xlabel('Time');
ylabel('Risk');
% axis([0 200/5 0 200000]);
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
% ��ʾ���еĸ���
% evidence{a1} = True;
% evidence{a1} = Remove;
% [engine,loglik]=enter_evidence(engine,evidence);  
% 
% m=marginal_nodes(engine, a3);  
% disp([Labels(a3), m.T(2)]);


toc