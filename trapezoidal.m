function I=trapezoidal(funcao,a,b,N)
%A função trapezoidal calcula a integral através da regra do Trapézio
%Composta
%Variáveis de entrada:
%funcao que será integrada, string
%a limite inferior de integração
%b limite superior de integração
%N número de intervalos
%Variável de saída:
%Resultado da integração

if (N==0);
    fprintf('Erro. Divisão por zero');
elseif (N<0);
    fprintf('Intervalo Inválido');
else
    h = (b-a)/N;  %calcula a largura do intervalo
    func=str2func(['@(x)' funcao]); %transforma string numa funcao
    y = a:h:b;    %cria um vetor com as coordenadas dos subintervalos
    
    for i=1:N+1
        F(i)=func(y(i));
    end
    I=h*(F(1)+F(N+1))/2+h*sum(F(2:N)); %formula geral da regra dos trapezios composta
end