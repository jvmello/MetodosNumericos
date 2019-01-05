clc;
format short g

%% Entradas
f = input('Digite a funcao desejada: ', 's');
if f(1) == 'e'
    f = 'exp(x)';
end

a = input('Digite o limite inferior a: ');
b = input('Digite o limite superior b: ');

n = input('Digite o número par de subintervalos: ');
while ((mod(n, 2)) ~= 0)
    n = input('Digite um número PAR de subintervalos: ');
end

h = (b-a)/n;

k = 1;
x = zeros(n+1, 1);
y = zeros(n+1, 1);

%% Montagem de X e Y
for i=a:h:b
    x(k) = i;
    k = k + 1;
end

for i=1:(n+1)
    y(i) = subs(f, 'x', x(i));
end

%% Amostra inicial
plot(x, y, 'r*');
grid on;
hold on;

%% Método
soma = 0;

for i=1:(n+1)
    if (i == 1) || (i == (n+1))
       soma = soma + y(i);
    elseif (mod (i,2)) == 0
       soma = soma + 4 * y(i);
    elseif (mod (i,2)) ~= 0
       soma = soma + 2 * y(i);
    end
end

I = (h/3) * soma;

%% Amostra de resultados
disp(I);
fplot(f, [a, b]);