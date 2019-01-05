format short g;
clc;

%% Declaração de variáveis
X = input('Digite o vetor de pontos x: ');
Y = input('Digite o vetor de pontos y: ');
n = length(X);

%% Montagem de A e b
A = zeros(n, n);
b = zeros(n, 1);

plot(X,Y, '*r');
hold on

for i=1:n
    b(i) = Y(i);
    for j=1:n
       A(i, j) = X(i) ^ (n-j); 
    end 
end

%% Resolução do sistema linear

m = [A b];
mm = zeros(n, n);

gr = n-1;

for i=1:n
    if m(i, i) == 0
        maior = 0;
        
        for j=(i+1):n
            if(mat(j, i) > maior)
                maior = abs(mat(j, i));
                lin = j;
            end
        end
        
        if maior == 0
            return
        else
            m([i lin], :) = m([lin i], :);
        end
    end
    
    for x=(i+1):n
        mm(x, i) = m(x, i)/m(i, i);
        m(x, :) = m(x, :) - mm(x, i) * m(i, :);
    end
end

sol(n) = m(n, n+1) / m(n, n);
soma = 0;

for i=(n-1):-1:1
    soma = 0;
    for j=(i+1):n
         soma = soma + m(i, j) * sol(j);
    end
    sol(i)=(m(i, n+1) - soma) / m(i, i);
end

%% Construção do polinômio
res = [num2str(sol(n)) ' * x^' num2str(gr)];
for i=gr:-1:1
    res = [res ' + (' num2str(sol(i)) ') * x^' num2str(i-1)];
end

%% Amostragem de resultados
disp('Resultados finais:');
disp(res);
ezplot(res);
grid on