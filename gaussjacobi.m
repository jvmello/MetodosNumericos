clc;

%% Declaração de variáveis
A = input('Digite a matriz A: ');
b = input('Digite o vetor b: ');
%A = rand(10, 10);
%b = rand(10, 1);
nmax = input('Digite o número máximo de iterações: ');
tol = input('Digite a tolerância do método: ');
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

%% Construção de matrizes
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

%% Convergência
if norm(C, Inf) >= 1
    if norm(C, 1) >= 1
        disp('Não há garantia de convergência');
        return
   end
end

%% Método
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
    disp('O método ultrapassou o limite de iterações. Saindo...');
    return
end

disp('Resultados:');
disp(x0);