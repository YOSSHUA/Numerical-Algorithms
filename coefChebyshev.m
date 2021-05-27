function [puntos, T,proyeccion] = coefChebyshev(n,f)
%CHEBYSHEV
%   Dado n, se generan n términos de los
%   polinomios de Chebyshev para obtener los coeficientes
%   de la interpolación de f.


thetaK = zeros(1,n); %1xn
for j = 0:n-1
    thetaK(j+1) = (pi/(2*n))*(4*j+1);
end
xK = cos(thetaK); % 1xn
T = zeros(n,n); %nxn
T(:,1) = ones(n,1);
T(:,2) = xK';
for j = 3:n
    T(:,j) = 2*xK'.*T(:,j-1)-T(:,j-2);
end
yK = f(xK); 
proyeY = yK*T/(n/2);
proyeY(1)= proyeY(1)/2;
proyeccion = proyeY;
puntos = xK;
end

