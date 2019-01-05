clc;

%% Declara��o de vari�veis
A = input('Digite a matriz A: ');
b = input('Digite o vetor b: ');
nmax = input('Digite o n�mero m�ximo de itera��es: ');
tol = input('Digite a toler�ncia do m�todo: ');
C = A;
g = b;
it = 0;
m = size(A, 1);
n = size(b, 1);

%% Constru��o de matrizes
for i=1:m
    for j=1:m
        if(i==j)
            C(i,j) = 0;
        else
            C(i,j) = (-A(i,j)) / A(i,i);
        end
    end
end

D = diag(diag(C));
L = tril(C);
U = triu(C);

for i=1:m
    g(i) = b(i) / A(i,i);
end

%% Converg�ncia
somas = (n);

for i=1:n
    somas(i) = 0;
end

for j=2:n
    somas(1) = somas(1) + abs(C(1,j));
end
for i=2:n
    for j=1:(i-1)
        somas(i) = somas(i) + (somas(j) * abs(C(i,j)));
    end
    
    for j=(i+1):n
        somas(i) = somas(i) + abs(C(i,j));
    end
end

if max(somas) >= 1
    disp('N�o h� garantia de converg�ncia');
    return
end

%% M�todo
xnew = input('Insira o vetor inicial: ');
erro = Inf;

while it < nmax && erro > tol
    xold = xnew;
    soma = zeros(3, 1);
    
    for i=1:n
        soma = 0;
        for j=1:n
            if i <= j
                soma = soma + C(i,j) * xold;
            else
                soma = soma + C(i,j) * xnew;
            end
        end
        xnew = soma + g;
    end
    
    erro = norm(xnew-xold) / norm(xold);
    
    it = it + 1;
end

%% Resultados
if it >= nmax
    disp('O m�todo ultrapassou o limite de itera��es. Saindo...');
    return
end

disp('Resultados:');
disp(xold);