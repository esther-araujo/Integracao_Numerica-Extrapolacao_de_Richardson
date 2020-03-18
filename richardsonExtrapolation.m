%Exemplo: funcao = log(2^x)+ cos(x); a=1; b=4 -> valor exato = 3.60033...

function I = richardsonExtrapolation(funcao,a,b,tipoRegra,N)

%A função richardsonExtrapolation calcula uma integral definida de forma aproximada,
%buscando obter uma estimativa mais precisa a partir de duas estimativas menos precisas desta mesma integral.
%No caso dessa implementação, existem duas opções de métodos para a resolução da integral: 
%Regra Trapezoidal Composta e Regra 1/3 de Simpson Composta
%A função richardsonExtrapolation é baseada no caso especial em que h2=h1/2, isto é, quando o
%intervalo de uma aproximação é a metade do intervalo da outra.
%Variáveis de entrada:
%funcao que será integrada, string
%a limite inferior de integração
%b limite superior de integração
%tipoRegra a regra para encontrar as duas estimativas da integral, sendo a entrada 1
%para escolher a regra trapezoidal e 2 para escolher a regra 1/3 de simpson
%N número de segmentos (nível de precisão) da integração para gerar uma das estimativas utilizadas
%Saídas:
%Resultado da integração

 if (tipoRegra == 1) %trapezoidal composta
     Ih1=trapezoidal(funcao,a,b,N);       %Estimativa com N intervalos
     Ih2=trapezoidal(funcao,a,b,N/2);    %Estimativa com N/2 intervalos
     disp('Regra Trapezoidal Composta');
     disp(['Resultado da estimativa h1: ' num2str(Ih1)]);
     disp(['Resultado da estimativa h2: ' num2str(Ih2)]);
     I=((2^2)*Ih1 - Ih2)/(2^2 -1);     %Fórmula geral para duas estimativas com erro de O(h^2) e h2=h1/2
 elseif (tipoRegra == 2) %1/3 de simpson
     Ih1=umtercoSimpson(funcao ,a,b,N);       %Estimativa com N intervalos
     Ih2=umtercoSimpson(funcao,a,b,N/2);    %Estimativa com N/2 intervalos
     disp('Regra 1/3 de Simpson Composta');
     disp(['Resultado da estimativa h1: ' num2str(Ih1)]);
     disp(['Resultado da estimativa h2: ' num2str(Ih2)]);
     I=((2^4)*Ih1 - Ih2)/(2^4 -1);     %Fórmula geral para duas estimativas com erro de O(h^4) e h2=h1/2
 else
     fprintf('Entrada referente ao tipo de regra de integração inválida');
 end
 
disp('-----------------------------------------------------------------');
disp(['Resultado da integral pela Extrapolação de Richardson: ' num2str(I)]);