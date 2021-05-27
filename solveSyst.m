function [C_, ff] = solveSyst(x,y, f, vars)
% x es un vector con los valores de x
% y es un vector con los valores de f(x)
% f es el handler de la función
% vars es un arreglo de strings con los nombres de
% las incógnitas en f(x)
arrayfun(@syms, vars);
M = str2sym(string(f(x))+ "="+ string(y));
Csym = sym(vars);

C_ = solve(M, Csym, 'Real', true);
%display(A);
fs = char(f);
%display(fs);
sv = max(size(vars));
fns = fieldnames(C_);


for j = 1:sv
    fs = strrep(fs, vars(j), "("+string(C_.(fns{j}))+")" );  
end

if min(size(fs)) ~= 0
    hold on;
    % Tiene al menos una sol
    t = max(size(C_.(fns{1})));%numero de sols
    ff = fs;
    for j = 1: t
        fFinal = str2func(fs(j));                
        fplot(fFinal, [min(x)-5,max(x)+5]);
        ylim([min(y)-2, max(y)+2]);
        legend(fs(j));
    end
    plot(x,y, 'o');
    hold off;
else
    display("No hay sol");
end
end