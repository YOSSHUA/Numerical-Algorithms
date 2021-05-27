function [] = drawCurve(coef,f, a, b)
%DRAWCURVE 
%   Given n coefficient of Chebyshev's terms to aproximate f,
%   it makes a graph of f in [a,b].
x = a:0.01:b;
t = max(size(x));
n = max(size(coef)); % 1*n
y = zeros(1,t);
tn = zeros(1,n);
for j = 1:t
    tn(1) = 1;
    tn(2) = x(j);
    for k = 3:n
       tn(k) = 2*x(j)*tn(k-1)-tn(k-2);
    end
    y(j) = tn*coef';
end
fplot(f, [a,b], "r");
title("Aproximación con polinomios de Chebyshev");
hold on;
plot(x,y, "c*");
legend({'Función original';'Aproximación a 0.01' });
end

