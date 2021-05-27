R = 100; %Ohm
C = 1e-2; %F
E = 5; %V
uno_RC = 1/(R*C);

n = 100;
t = 3;
h = t/n;

i_t = zeros(1,n+1);
tiempo = (0:n)*h;
i_t(1) = E/R;
for t = 1:n    
   i_t(t+1) = i_t(t)-h*uno_RC*i_t(t);    
end
%Solución por Euler
solTeorica = E/R*exp(-uno_RC*tiempo);
plot(tiempo,i_t, tiempo, solTeorica);



