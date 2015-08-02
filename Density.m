function [xout] = Density(x, step)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    x = x(1,2:size(x,2));
    
    Max = max(x);
    Min = min(x);
    
    xout = x;
    
    count = 0;
    for i = Min : step : Max
        count = count + 1;
    end
    
    st = zeros(1, count);
    
    for i = 1:size(x,2)
        st(fix((x(1, i) - Min)/step) + 1) = st(fix((x(1, i) - Min)/step) + 1) + 1;        
    end
    
    bar(Min:step:Max, st);
    st = st/size(x,2);
    tst = [(Min:step:Max)', st'];
    save tst.dat tst -ascii;
    
    xlabel('Calculation Time','Interpreter','latex');
    ylabel('Times','Interpreter','latex');
    
end

