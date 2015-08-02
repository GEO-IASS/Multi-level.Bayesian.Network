%%
% 这个版本去掉了一些攻击知识

clear all
False = 1;
True = 2;
Remove = [];

%%
N = 345;

px = cell(1,8);
px{1} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px1.dat');
px{2} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px2.dat');
px{3} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px3.dat');
px{4} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px4.dat');
px{5} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px5.dat');
px{6} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px6.dat');
px{7} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px7.dat');
px{8} = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\px8.dat');

risk = load('D:\iDocument\Document\我的论文\1st\Source Code\Data\RiskWithKnowledge.dat');

%%
% 定义节点
 a1 =  1;  r1 =  2;  a2 =  3;  r2 =  4;  r3 =  5;  r4 =  6;  r5 =  7;  r6 =  8;  a6 =  9;  r8 = 10; 
 a3 = 11;  a4 = 12;  a5 = 13;  a7 = 14;  r7 = 15;  a8 = 16;  a9 = 17;  r9 = 18; a10 = 19; a11 = 20; 
a12 = 21; a13 = 22; a14 = 23; a15 = 24; a16 = 25; a17 = 26; a18 = 27; a19 = 28; a20 = 29; a21 = 30; 
a22 = 31; a23 = 32; a24 = 33; a25 = 34; a26 = 35; a27 = 36;  f1 = 37;  f2 = 38;  f3 = 39;  f4 = 40; 
 f5 = 41;  f6 = 42;  f7 = 43;  f8 = 44;  f9 = 45; f10 = 46; f11 = 47; f12 = 48;  e1 = 49;  e2 = 50; 
 e3 = 51;  e4 = 52;  e5 = 53;  e6 = 54;  e7 = 55;  e8 = 56;  x1 = 57;  x2 = 58;  x3 = 59;  x4 = 60; 
 x5 = 61;  x6 = 62;  x7 = 63;  x8 = 64; 
                    
%%
% 定义 Labels
Labels = {
 'a1',  'r1',  'a2',  'r2',  'r3',  'r4',  'r5',  'r6',  'a6',  'r8',  ... 
 'a3',  'a4',  'a5',  'a7',  'r7',  'a8',  'a9',  'r9', 'a10', 'a11',  ... 
'a12', 'a13', 'a14', 'a15', 'a16', 'a17', 'a18', 'a19', 'a20', 'a21',  ... 
'a22', 'a23', 'a24', 'a25', 'a26', 'a27',  'f1',  'f2',  'f3',  'f4',  ... 
 'f5',  'f6',  'f7',  'f8',  'f9', 'f10', 'f11', 'f12',  'e1',  'e2',  ... 
 'e3',  'e4',  'e5',  'e6',  'e7',  'e8',  'x1',  'x2',  'x3',  'x4',  ... 
 'x5',  'x6',  'x7',  'x8'
};

%%
% 动态过程
%       1    2    3    4    5    6    7    8    9   10
E = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ...  0x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ...  1x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ...  2x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ...  3x
        0,   0,   0,   0,   0,   0,   0,   0,   0,  a1, ...  4x
       a1,  a1,  a1,  a1,  a1,  a1,  a1,  a1,  a1,  a1, ...  5x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ...  6x
        0,   0,   0,   0,  a2,  a2,  a2,  a2,  a2,  a2, ...  7x
       a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2, ...  8x
       a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2, ...  9x
       a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2,  a2, ... 10x
        0,   0,   0,   0,   0,   0,   0,   0,   0,  a6, ... 11x
       a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6, ... 12x
       a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6, ... 13x
       a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6, ... 14x
       a6,  a6,  a6,  a6,  a6,  a6,  a9,  a6,  a9,  a6, ... 15x
       a9,  a6,  a9,  a6,  a9,  a6,  a9,  a6,  a9,  a6, ... 16x
       a9,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6,  a6, ... 17x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 18x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 19x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 20x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 21x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 22x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 23x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 24x
        0,   0,   0,   0,   0,   0,   0,   0, a20, a20, ... 25x
      a20,   0,   0,   0,   0,  f4,   0,   0,   0,   0, ... 26x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 27x
        0,   0,   0,   0,   0, f12,   0,   0,   0,   0, ... 28x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 29x
        0,   0,   0,   0,   0,   0,   0,   0,   0,  e4, ... 30x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 31x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 32x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 33x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 34x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 35x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 36x
        0,   0,   0,   0,   0,   0,   0, -f4,   0,   0, ... 37x
        0,   0,   0,   0,   0,   0,   0,   0,   0,-f12, ... 38x
        0,   0,   0,   0,   0,   0,   0,   0,   0, -e4, ... 39x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 40x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 41x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0, ... 42x
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0];  % 43x

[~, NN] = size(Labels);
Network = zeros(NN, NN);  

%% 
% 攻击层
Network(a1, r1) = 1;
Network(r1, [a2 a3 a4 a5 a6 a7 a8 a9]) = 1;
Network(a2, [r2 r3 r4 r5 r6]) = 1;
Network(r2, a3) = 1;
Network(r3, a4) = 1;
Network(r4, a5) = 1;
Network(r6, [a8 a9]) = 1;
Network(a6, r8) = 1;

Network(r8, a9) = 1;
Network([a3 a4 a5], r7) = 1;
Network(r7, a8) = 1;
Network([r1 r5], a7) = 1;
Network([a7 a8 a9], r9) = 1;
Network([r7 r9], [a10 a11 a12 a13 a14 a15]) = 1;
Network(r9, [a16 a17 a18 a19 a20 a21]) = 1;
Network([r7 r9], [a22 a23 a24 a25 a26 a27]) = 1;

%% 
% 功能层
Network([a10 a16 a22], [f1 f2]) = 1;
Network([a11 a17 a23], [f7 f8 f9]) = 1;
Network([a12 a18 a24], f6) = 1;
Network([a13 a19 a25], f5) = 1;
Network([a14 a20 a26], f4) = 1;
Network([a15 a21 a27], f3) = 1;
Network([f1 f2 f3 f7], f10) = 1;
Network([f1 f2 f3 f5 f8], f11) = 1;
Network([f4 f9], f12) = 1;

%%
% 事件层
Network(f10, [e1 e2]) = 1;
Network(f11, e3) = 1;
Network(f12, e4) = 1;
Network(f6, e8) = 1;
Network(e1, e5) = 1;
Network(e2, e7) = 1;
Network(e3, x1) = 1;
Network(e4, [e6 x1 x2]) = 1;
Network(e8, x1) = 1;
Network(e5, x3) = 1;
Network(e7, [x1 x6 x7]) = 1;
Network(e6, [x1 x3 x7 x6 x4 x8 x5 x2]) = 1;

bg=biograph(Network,Labels);

for i = 1:NN
    if Labels{i}(1) == 'a'
        bg.Nodes(i).Color = [1,0,0];
        bg.Nodes(i).LineColor = [1,0,0];
    elseif Labels{i}(1) == 'r'
        bg.Nodes(i).Color = [0,0.5,0];
        bg.Nodes(i).LineColor = [0,0.5,0];
    elseif Labels{i}(1) == 'f'
        bg.Nodes(i).Color = [0,0,1];
        bg.Nodes(i).LineColor = [0,0,1];
    elseif Labels{i}(1) == 'e' || Labels{i}(1) == 'x'
        bg.Nodes(i).Color = [0,0,0];
        bg.Nodes(i).LineColor = [0,0,0];
    end
    bg.Nodes(i).TextColor = [1,1,1];
    
    if Labels{i}(1) == 'x'
        bg.Nodes(i).UserData = px{i - x1 + 1}(N,2);
	end
end

for i = 1:N
    if E(i) > 0;
        bg.Nodes(E(i)).Shape = 'circle';
    elseif E(i) < 0;
        bg.Nodes(E(i)).Shape = 'box';
    end
end

view(bg);

for i = 1:8
    subplot(10,1,i)
    plot(px{i}(1:N,1),px{i}(1:N,2));
    axis([0,450,0,1]);
    ylabel(['p(x',num2str(i),')']);
end

subplot(10,1,[9 10])
plot(risk(1:N,1),risk(1:N,2),'r');
xlim([0, 450]);
ylabel('Risk');
xlabel('Time(min)');
set(gcf,'color','white')
tightfig;
set(gcf,'NumberTitle','off')
set(gcf,'Name',['Time = ' , num2str(N), 'min'])

