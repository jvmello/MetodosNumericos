clc;

f = input('Digite a função f(x): ', 's');
df = diff(f);
x0 = input('Digite o primeiro ponto: ');
x1 = input('Digite o segundo ponto: ');
eps = input('Digite a tolerância desejada: ');
n = input('Digite o número máximo de iterações: ');

erro = 1;
i = 0;
fx0 = erro;

fprintf('| Iteração | Valor X0 | F(x0) | Valor x1 | F(x1) | x1 | Erro |\n');

while(abs(fx0) > eps && i < n)
    fx0 = subs(f, x0);
    fx1 = subs(f, x1);
    x2 = (((x0 * fx1) - (x1 * fx0)) / (fx1 - fx0));
    i = i + 1;
    
    if(abs(fx1) < eps)
       fprintf('O método converge pela imagem e a solução é %f', x2);
       return
    end 
    
    fprintf('| %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | %.3f |\n', i, x0, fx0, x1, fx1, x2, erro);

    x0 = x1;
    x1 = x2;
end

if(i >= n)
    fprintf('Não foi possível obter a solução');
end
