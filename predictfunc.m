function predictdata = predictfunc(Trans, intstate, time)

[~, statenum] = size(Trans);
[~, m] = size(intstate);
n = log2(statenum);
if m<n, error('The initial data is not enough to simulate the chain.'); end



predictdata = intstate(m-n+1:m);
prestate = 2.^((n-1):(-1):0)*predictdata';

for i = 1:time
    r = rand;
    if Trans(prestate+1, mod(prestate*2, statenum)+1)>r
        predictdata = [predictdata 0];
        prestate = mod(prestate*2, statenum);
    else
        predictdata = [predictdata 1];
        prestate = mod(prestate*2, statenum)+1;
    end
end
predictdata = [intstate predictdata(n+1:end)];

end