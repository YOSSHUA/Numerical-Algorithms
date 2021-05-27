%A tiene en cada columna la proporcion de valores que son <= p y tienen
%tamaño j*K. Después vemos cómo se comporta la suma de estas(1 si es menor
%que p y 0 en c.o.c) 
M = 20; %No. reng
N = 80; % No. cols
K = 10; %Aumento de la cantidad de puntos
A = zeros(M,N);
p = 0.4;
for j = 1:N
    for i = 1:M
        A(i,j) = sum(rand(1,j*K) <= p);
    end
    A(:,j) = A(:,j)/(j*K);
end
hold on;
plot(K*(1:N),A','+')
plot(K*(1:N),mean(A),'k')
plot(K*(1:N),std(A)+mean(A),'k')
plot(K*(1:N),-std(A)+mean(A),'k')
pause(3)
hold off
plot(K*(1:N),std(A),'+b',K*(1:N),sqrt(p*(1-p)./(K*(1:N))));
