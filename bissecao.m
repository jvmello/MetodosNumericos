f = input('Digite a fun��o: ', 's');
a = input('Digite o limite inferior: ');
b = input('Digite o limite superior: ');
e = input('Digite o erro: ');

int = abs(b-a);
fa = subs(f,a);
fb = subs(f,b);

while int > e
    pm = (a+b)/2;
    fpm = subs(f,pm);
    
    if((fa * fb) > 0)
        disp('Solu��o n�o encontrada');
        return;
    end
    
    if abs(fpm) < e 
        break
    end
    
    if(fa * fpm) < 0
        b = pm;
        fb = fpm;
    else
        a = pm;
        fa = fpm;
    end
    
    int = abs(b-a);
end

disp('Solu��o encontrada');
disp(pm);