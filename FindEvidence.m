function [Evidence, Time] = FindEvidence(E, T, index)

    [~, ELength] = size(E);
    [~, TLength] = size(T);

    if ELength ~= TLength
    error('证据序列和时间序列维数不同！');
    end

    Evidence = 0;
    Time = 0;
    
    for i = 1:ELength
        if T(i) == index
            Evidence = E(i);
            Time = T(i);
            break;
        end
    end
end

