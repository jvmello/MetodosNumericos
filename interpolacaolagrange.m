clc;

%% Declaração/Inicialização de variáveis
X = input('Digite o vetor de pontos x: ');
Y = input('Digite o vetor de pontos y: ');
n = length(X);
gr = n-1;

Li = '';
pn = '';
num = '';
dem = 1;

%% Primeira amostra
plot(X, Y,'*r');
hold on

%% Cálculo de Li
for i=1:n
    for j=1:n
        if i ~= j
            if(isempty(num))
                num = ['(x - '  num2str(X(j)) ')'];
            else
                num = [num ' * (x - '  num2str(X(j)) ')'];
            end
            dem = dem * (X(i) - X(j));
        end
    end
    
    Li = sprintf('%s / %d', num, dem);
    
%% Construção de pn(x) 
    if(isempty(pn))
        pn = [' + ' num2str(Y(i)) ' * ' Li];
    else
        pn = [pn ' + ' num2str(Y(i)) ' * ' Li];
    end
    
    % Reinicialização de variáveis
    num = [];
    dem = 1;
end

%% Amostragem de resultados
disp('Resultados finais:');
disp(pn);
grid on
fplot(pn, [min(X), max(X)]);