function steadystate = steadyfun(Trans)

[~,n] = size(Trans);
intstate = zeros(1,n);
finstate = zeros(1,n);
finstate(1) = 1;

while norm(finstate - intstate) > 10*eps
    intstate = finstate;
    finstate = intstate * Trans;
end

steadystate = finstate;

end