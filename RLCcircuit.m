% RLC Circuit with Runge-Kutta 4th order
%
R = 10;  % ohms
L = 2.5; %12.5;  % henries
C = 0.5e-3; % Farads
E = 5;    % volts
I0 = E/R;
c1_LC = 1.0 / (L*C);
cR_L  = R/L;
c1_RC = 1/ (R*C);

T = 3; % seg
N = 1000; % veces
h = T/N;
tiempo    = (0:N)*h;
corriente = zeros(2,N+1);

M = [[0,1];[-c1_LC,-cR_L]];

corriente(:,1) = [I0;-0.5*I0*R/L]';

for t = (1:N)
   % Euler
   %corriente(:,t+1) = corriente(:,t) + h * M * corriente(:,t);
   
   k1 = M * corriente(:,t);
   k2 = M * corriente(:,t) + 0.5 * k1;
   k3 = M * corriente(:,t) + 0.5 * k2;
   k4 = M * corriente(:,t) + k3;
   corriente(:,t+1) = corriente(:,t) + (1/6)*(k1 +2*k2 + 2*k3 +k4)*h;
  
end
%
%solución teórica
%
r1=0.5*(-R/L +sqrt(((R/L)^2) - 4/(L*C)));
r2 = r1';
solTeorica = 0.5 * I0 * (exp(r1*tiempo) + exp(r2*tiempo));

plot(tiempo,corriente(1,:),'-r',tiempo,solTeorica,'-b')

%plot(tiempo,corriente(1,:))





