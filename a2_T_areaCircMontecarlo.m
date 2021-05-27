%Tarea: estimar el área de un cuarto de círculo por el método de
%Montecarlo(plano). 
%El método de Montecarlo genera puntos al azar en un plano y el área
%será el Número de puntos que cayeron dentro de la figura entre el Total de
%puntos * a * b. Donde a y b son las dimensiones del rectángulo donde se
%generaron los puntos.
% Area  = (Puntos Dentro / Total Puntos) * a * b
% rand genera núm aleatorios distrib uniforme en 0 y 1

%Asi para el círculo generamos valores para x y para y. Solo falta validar
%que estén dentro del círculo o no.

%A tiene en cada columna la proporcion de valores que son <= p y tienen
%tamaño j*K. Después vemos cómo se comporta la suma de estas(1 si es menor
%que p y 0 en c.o.c) 
M = 20; %No. reng
N = 100; % No. cols
K = 100; %Aumento de la cantidad de puntos
A = zeros(M,N);
p = 0.4;
for j = 1:N
    for i = 1:M
        x= rand(1,j*K);
        y= rand(1,j*K);
        A(i,j) = sum(x.*x + y.*y <= 1);
    end
    A(:,j) = A(:,j)/(j*K);
end
hold on;
title('Aproximación de 1/4 del área de un círculo de radio 1');
xlabel('Número de puntos');
ylabel('Valor de las medias');

plot(K*(1:N),A','+')
plot(K*(1:N),mean(A),'k')
plot(K*(1:N),std(A)+mean(A),'k')
plot(K*(1:N),-std(A)+mean(A),'k')
pause(5);

hold off
plot(K*(1:N),std(A),'+b');

