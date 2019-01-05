clc;
clear;
format short;

a = input('Entre com a matriz a: ');
b = input('Entre com a matriz b: ');
[n k] = size(a);
aum = [a b];

fprintf('Matriz a: \n');
disp(a);
fprintf('Matriz b: \n');
disp(b);

fprintf('A matriz aumentada é:\n');
disp(aum);

for j = 1:n-1
    if aum(j, j)==0
        l = j;
        for l = l+1:n
            if(aum(l, j)==0)
                continue
            end
        end
        
        if(l==n && aum(l, j)==0)
            printf('Deu ruim')
            return
        end
        
        w = aum(j, :);
        z = b(j); 
        aum(j, :) = aum(l, :);
        b(j) = b(l);
        aum(l, :) = w;
        b(l) = z;
    end
    for i = j+1:n
        m(i, j) = aum(i, j)/aum(j, j);
        aum(i, :) = aum(i, :) - m(i, j)*aum(j, :);
    end
end

fprintf('A matriz triangular superior é:\n');
disp(aum);
x(n) = aum(n, n+1)/aum(n,n);

for i = n-1:-1:1
    soma = 0;
    for j = i+1:n
        soma = soma + aum(i, j)* x(j);
    end
    x(i) = (aum(i, n+1) - soma)/aum(i, i);
end

fprintf('O vetor solução é:\n')
for i = 1:n
    fprintf('x(%d) = %.2f\n', i, x(i));
end