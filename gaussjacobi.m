clc;

%% Declara��o de vari�veis
A = input('Digite a matriz A: ');
b = input('Digite o vetor b: ');
%A = rand(10, 10);
%b = rand(10, 1);
nmax = input('Digite o n�mero m�ximo de itera��es: ');
tol = input('Digite a toler�ncia do m�todo: ');
C = A;
g = b;
it = 0;
m = size(A, 1);
n = size(b);

%for i=1:m
%    for j=1:m
%        if(i==j)
%            A(i,j) = 1000 * A(i,j);
%        end
%    end
%end

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

for i=1:m
    g(i) = b(i) / A(i,i);
end

%% Converg�ncia
if norm(C, Inf) >= 1
    if norm(C, 1) >= 1
        disp('N�o h� garantia de converg�ncia');
        return
   end
end

%% M�todo
x0 = input('Insira o vetor inicial: ');
%x0 = rand(10,1);
erro = Inf;

while it < nmax && erro > tol
    x1 = x0;
    
    x0 = C * x1 + g;
    
    erro = norm(x1-x0) / norm(x0);
    
    it = it + 1;
end

%% Resultados
if it >= nmax
    disp('O m�todo ultrapassou o limite de itera��es. Saindo...');
    return
end

disp('Resultados:');
disp(x0);