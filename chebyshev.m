function T=chebyshev(n,x) %n=0,1,2,3,...
    m=length(x);
    T=zeros(1,m);
    T1=ones(1,m);
    T2=x;
    if n==1
        T=T2;
    else
        for j=2:n
            T=2*x.*T2-T1;
            T1=T2;
            T2=T;
        end
    end
    T
end