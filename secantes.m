clc;

f = input('Digite a fun��o f(x): ', 's');
df = diff(f);
x0 = input('Digite o primeiro ponto: ');
x1 = input('Digite o segundo ponto: ');
eps = input('Digite a toler�ncia desejada: ');
n = input('Digite o n�mero m�ximo de itera��es: ');

erro = 1;
i = 0;
fx0 = erro;

fprintf('| Itera��o | Valor X0 | F(x0) | Valor x1 | F(x1) | x1 | Erro |\n');

while(abs(fx0) > eps && i < n)
    fx0 = subs(f, x0);
    fx1 = subs(f, x1);
    x2 = (((x0 * fx1) - (x1 * fx0)) / (fx1 - fx0));
    i = i + 1;
    
    if(abs(fx1) < eps)
       fprintf('O m�todo converge pela imagem e a solu��o � %f', x2);
       return
    end 
    
    fprintf('| %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | %.3f |\n', i, x0, fx0, x1, fx1, x2, erro);

    x0 = x1;
    x1 = x2;
end

if(i >= n)
    fprintf('N�o foi poss�vel obter a solu��o');
end
