function RiS = lpri(tR,Ref)
%Lightweight linear temperature programmed retention index calculator. MDSA April 2021
for qq = 1:size(tR,1)
    tnLogical = tR(qq) > Ref(:,2);
    tn1Logical = tR(qq) < Ref(:,2);
    
    tn = max(Ref(tnLogical,2));
    tn1 = min(Ref(tn1Logical,2));
    
    if isempty(tn) || isempty(tn1)
        RiS(qq) = NaN; %#ok
    else
    RiS(qq) = 100*(max(Ref(tnLogical,1))+((tR(qq)-tn)/(tn1-tn))); %#ok
    end

end
