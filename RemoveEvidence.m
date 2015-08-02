function [ReturnESet] = RemoveEvidence(ESet, Evidence)

    ReturnESet = ESet;
    ReturnESet{Evidence} = [];
    
end

