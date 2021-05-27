function [A, func] = aproxLineal(x_, y_, n_der)
% X vector of values of x coordinates where we want the interpolation to pass.
% Y vector of values of y coordinates where we want the interpolation to pass.
% n_der vrctor that contains the n_derivate of the entry i. See below 
%        d/d^n_der(i) x(f(x(i))) = y(i)

% A contains the coefficients of the polynomial that pass through all your points
% and 

xs = max(size(x_));
if nargin == 2
    n_der = zeros(1, xs);
end
%coeficientes de polinomio de grado n
pn = ones(1,xs);
X = zeros(xs);
%lo hacemos polinomio
p = poly2sym(pn);
syms x

for j = 1:xs         
    %Calculamos coeficientes y términos, calculando la derivada n-ésima
    [c, t] = coeffs(diff(p,x, n_der(j)));  
    t = fliplr(t);
    c = fliplr(c);
    %Polinomio de la fila actual
    t = t.*c;
    fun = matlabFunction([zeros(1, xs -max(size(c))), t]);    
    X(j,:) = fun(x_(j));    
end
% Calculamos X*A = y
A = X\y_';
pc = fliplr(A');
pol = poly2sym(pc');
f = matlabFunction(pol);
func = f;
fplot(f,[min(x_)-1, max(x_)+1]);
ylim([min(y_)-1, max(y_)+1]);
hold on;
%Graficamos los puntos
for j = 1:xs
    if n_der(j) == 0
        plot(x_(j), y_(j), 'o');
    end    
end
hold off;
end
