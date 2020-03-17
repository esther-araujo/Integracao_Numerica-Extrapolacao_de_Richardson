function I = umtercoSimpson(funcao,a,b,N)
%A função umtercpSimpson calcula a integral através da regra 1/3 de Simpson
%Composta
%Variáveis de entrada:
%funcao que será integrada, string
%a limite inferior de integração
%b limite superior de integração
%N número de intervalos
%Variável de saída:
%Resultado da integração

if (N==0)
    fprintf('Erro. Divisão por zero');
elseif (N<0)
    fprintf('Intervalo Inválido');
else
    h = (b-a)/N;  %calcula a largura do intervalo
    func=str2func(['@(x)' funcao]); %transforma string numa funcao
    y = a:h:b;    %cria um vetor com as coordenadas dos subintervalos
    
    for i=1:N+1
        F(i)=func(y(i));
    end
    sumPares=0;
    sumImpares=0;
    for i=2:N
        if (mod(i,2)==0)
            sumPares = sumPares + F(i);
        else
            sumImpares = sumImpares + F(i);
        end 
    end 
    I=h*(F(1)+F(N+1)+2*sumImpares+4*sumPares)/3; %formula geral da regra 1/3 de simpson composta
end
     