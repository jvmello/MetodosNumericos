clear;
clc;

f = input('Digite a função desejada: ', 's');
a = input('Digite o valor a: ');
b = input('Digite o valor b: ');
t = input('Digite a tolerância: ');

fa = subs(f,a);
fb = subs(f,b);
int = abs(b-a);
it = 0;

fprintf('| Iteração | Valor a | F(a) | Valor b | F(b) | PM | F(pm) |\n');

while int > t
    pm = ((a*fb)-(b*fa))/((fb)-(fa));
    fpm = subs(f,pm);
    pause
    
    if(abs(subs(f,pm)) <= t)
        break;
    end
    
    if((fa * fb) > 0)
        disp('Solução não encontrada');
        return;
    end
    
    grid on;
    plot(fa:fb);
    pause
    
    if(fa * fpm) < 0
        b = pm;
        fb = fpm;
    else
        a = pm;
        fa = fpm;
    end
    int = abs(b-a);
    it = it+1;
    fprintf('| %.3f | %.3f | %.3f | %.3f | %.3f | %.3f | %.3f |\n', it, a, fa, b, fb, pm, fpm);
end

disp('Solução encontrada');
disp(pm);