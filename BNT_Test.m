clear all
False = 1;
True = 2;

N = 6;
dag=zeros(N,N);  
PT = 1; HO = 3; BT = 2; HA = 4; SA = 5; PX = 6;
dag(PT, HO) = 1;
dag([HO BT], HA) = 1;
dag(BT, [HA PX]) = 1;
dag(HO, [SA HA]) = 1;


discrete_nodes=[2,3,4,5,6,1];  
node_sizes=2*ones(1,N); 
bnet=mk_bnet(dag,node_sizes,'names',{'PT','HO','BT','HA','SA','PX'},'discrete',discrete_nodes);  

bnet.CPD{PT}=tabular_CPD(bnet,PT,[0.75,0.25]); 
bnet.CPD{BT}=tabular_CPD(bnet,BT,[0.999,0.001]); 
bnet.CPD{HO}=tabular_CPD(bnet,HO,[1,0.3,0,0.7]);
bnet.CPD{HA}=tabular_CPD(bnet,HA,[0.98,0.3,0.1,0.1,0.02,0.7,0.9,0.9]);
bnet.CPD{SA}=tabular_CPD(bnet,SA,[0.9,0.2,0.1,0.8]);
bnet.CPD{PX}=tabular_CPD(bnet,PX,[0.99,0.02,0.01,0.98]);

draw_graph(dag) 

engine=jtree_inf_engine(bnet);  
evidence=cell(1,N);  
%evidence{PX}= True;
%evidence{BT}= True;
[engine,loglik]=enter_evidence(engine,evidence);  
m=marginal_nodes(engine, PT);
m.T(2)