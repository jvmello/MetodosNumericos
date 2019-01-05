clc;

%% Declaração/Inicialização de variáveis
f = input('Digite a função f(x): ', 's');
if f(1) == 'e'
    f = 'exp(x)';
end

a = input('Digite o limite inferior a: ');
b = input('Digite o limite superior b: ');
n = input('Digite o número de subintervalos: ');

h = (b-a)/n;

%% Vetor X
k = 1;
x = zeros(n+1, 1);

for i=a:h:b
    x(k) = i;
    k = k+1;
end

%% Vetor Y
y = zeros(n, 1);

for i=1:(n+1)
    y(i) = subs(f, 'x', x(i));
end

%% Regra
soma = 0;

for i=1:(n+1)
    if(i ~= 1 && i ~= (n+1))
        soma = soma + 2 * y(i);
    else
        soma = soma + y(i);
    end
end

I = (h/2) * soma;

%% Amostragem de resultados
disp('Resultado final:');
disp(I);