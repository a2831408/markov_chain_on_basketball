function Trans = ComputeTransition(data,n)
    
    %the input data must be 1*k
    statenum = 2^n;
    alltrans = zeros(statenum, statenum);
    [~, datanum] = size(data);
    pow = 2.^((n-1):(-1):0)';
    intstate = data(1:n)*pow;
    for i = 1:(datanum-n)
        finstate = mod(intstate*2, statenum) + data(i+n);
        alltrans(intstate+1, finstate+1) = alltrans(intstate+1, finstate+1)+1;
        intstate = finstate;
    end
    sumalltrans = sum(alltrans,2);
    while min(sumalltrans) == 0
        [~,ind] = min(sumalltrans);
        ind = ind-1;
        alltrans(ind+1, mod(ind*2, statenum)+1) = 1;
        alltrans(ind+1, mod(ind*2, statenum)+2) = 1;
        sumalltrans(ind+1) = 2;
    end
    Trans = alltrans ./ sum(alltrans,2);
    
end