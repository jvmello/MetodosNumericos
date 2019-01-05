clc;

f = input('Digite a função f(x): ', 's');
df = diff(f);
x0 = input('Digite o ponto inicial: ');
eps = input('Digite a tolerância desejada: ');
n = input('Digite o número máximo de iterações: ');

i = 0;
x1 = x0;
dfx0 = subs(df, x0);
divisor = dfx0;

if(abs(dfx0) == 0)
    fprintf('A derivada no ponto %f iguala zero. Saindo...\n', x0);
    return
end

fprintf('| Iteração | Valor X0 | F(x0) | dF(x0) | Valor x1 | F(x1) | dF(x1) | Erro |\n');

while(erro > eps && i < n)
    fx0 = subs(f, x0);
    dfx0 = subs(df, x0);
    if(abs(dfx0) < eps)
        x1 = x0 - ((fx0)/(divisor));
    else
        x1 = x0 - ((fx0)/(dfx0));
        divisor = dfx0;
    end
    
    fx1 = subs(f, x1);
    dfx1 = subs(df, x1);
    i = i + 1;
    
    if(abs(fx1) < eps)
       fprintf('O método converge pela imagem e a solução é %f\n', x1);
       return
    end
    
    erro = abs(x1 - x0) / abs(x1);
    fprintf('| %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | \n', i, x0, fx0, dfx0, x1, fx1, dfx1, erro);
    
    x0 = x1;
end

if(i >= n)
    fprintf('Não foi possível obter a solução\n');
end
