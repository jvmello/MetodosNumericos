clc;

%% Declaração de variáveis
X = input('Digite o vetor  de pontos x: ');
Y = input('Digite o vetor de pontos y: ');
n = length(X);
Ynovo = zeros(1, n);
m1 = zeros(2,2);
m2 = zeros(2,1);

%% Diagrama
grid on;
plot(X, Y, 'r*');
hold on;

%% Entrada de ajuste
fprintf('Informe o ajuste: \n\t1 Polinomial\n\t2 Hiperbólico\n\t3 Exponencial de base e\n\t4 Exponencial de base qualquer\n\t5 Geométrico\n');
op = input('');

%% Ajuste polinomial
switch op
    case 1
        g = input('Digite o grau desejado do polinômio: ');

        A = zeros(g+1, g+1);
        b = zeros(g+1, 1);

        for i=1:(g+1)
            aux = (2*g) - (i-1);
            for j=1:(g+1)
                A(i, j) = sum(X.^aux);
                aux = aux - 1;
            end
        end

        aux = g;
        for i=1:(g+1)
            b(i) = sum(Y.*(X.^aux)); 
            aux = aux - 1;
        end

        m = [A b];
        
%% Ajuste hiperbólico
    case 2
        for i=1:n
            Ynovo(i) = 1/Y(i);
        end

        for i=2:-1:1
            aux = 2 + (i-1);
            for j=2:-1:1
                aux = aux - 1;
                m1(i, j) = sum(X.^aux);
            end
            m2(i) = sum((X.^aux).*Ynovo);
        end

        m = [m1 m2];
        g = 1;
        n = 2;

%% Ajuste exponencial de base e ou qualquer
    case num2cell(3:4)
        n = length(Y);
        for i=1:n
            Ynovo(i) = log(Y(i));
        end

        for i=2:-1:1
            aux = 2 + (i-1);
            for j=2:-1:1
                aux = aux - 1;
                m1(i, j) = sum(X.^aux);
            end
            m2(i) = sum((X.^p).*Ynovo);
        end

        m = [m1 m2];
        g = 1;
        n = 2;    
        
%% Ajuste geométrico
    case 5
        n = length(Y);
        for i=1:n
            X(i) = log(X(i));
            Ynovo(i) = log(Y(i));
        end

        for i=2:-1:1
            aux = 2 + (i-1);
            for j=2:-1:1
                aux = aux - 1;
                m1(i, j) = sum(X.^aux);
            end
            m2(i) = sum((X.^aux).*Ynovo);
        end

        m = [m1 m2];
        g = 1;
        n = 2;
        
    otherwise
        disp('Opção inválida. Saindo...');
        return
end

%% Resolução do sistema "geral" utilizando o método de Gauss
for j=1:(g+1)
        for i=j+1:(g+1)
            ma = m(i, j) / m(j, j);
            m(i, :) = m(i, :) - ma*m(j, :);
        end
end

sol(g+1) = m(g+1, g+2) / m(g+1, g+1);
soma = 0;

for i=g:-1:1
    soma = 0;
    for j=i+1:(g+1)
         soma = soma + m(i, j) * sol(j);
    end
    sol(i)=(m(i, g+1) - soma) / m(i, i);
end

aux = 0;

%% Transformação Alfa/Beta
if op == 3
    aux = sol(1);
    sol(1) = exp(sol(2));
    sol(2) = aux;
elseif op == 4
    aux = sol(2);
    sol(2) = exp(sol(1));
    sol(1) = exp(aux);
elseif op == 5
    aux = sol(1);
    sol(1) = exp(sol(2));
    sol(2) = aux;
end

%% Transformação final em equação
res = [num2str(sol(1))];
for i=2:g+1
    if op == 3
        res = [res ' * e^(' num2str(sol(i)) ') * x^' num2str(i-1)];
    elseif op == 4
        res = [res ' * (' num2str(sol(i)) ')^x']
    elseif op == 5
        res = [res ' * x^(' num2str(sol(i)) ')'];
    else
        res = [res ' + (' num2str(sol(i)) ') * x^' num2str(i-1)];
    end
end

%% Amostragem de resultados
disp('Resultados finais:');
disp(res);
ezplot(res);
