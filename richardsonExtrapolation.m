function I = richardsonExtrapolation(funcao,a,b,tipoRegra,N)

%A função richardsonExtrapolation calcula uma integral definida de forma aproximada,
%buscando obter uma estimativa mais precisa a partir de duas estimativas menos precisas desta mesma integral.
%No caso dessa implementação, existem duas opções de métodos para a resolução da integral: 
%Regra Trapezoidal Composta e Regra 1/3 de Simpson Composta
%Essa função é baseada no caso especial em que h2=h1/2, isto é, quando o
%intervalo de uma aproximação é a metade do intervalo da outra.
%Variáveis de entrada:
%funcao que será integrada, string
%a limite inferior de integração
%b limite superior de integração
%tipoRegra a regra para encontrar as duas estimativas da integral, sendo a entrada 1
%para escolher a regra trapezoidal e 2 para escolher a regra 1/3 de simpson
%N número de segmentos (nível de precisão) da integração para gerar uma das estimativas utilizadas
%Variável de saída:
%Resultado da integração

 if (tipoRegra == 1) %trapezoidal composta
     In=trapezoidal(funcao,a,b,N);       %Estimativa com N intervalos
     I2n=trapezoidal(funcao,a,b,2*N);    %Estimativa com 2N intervalos
     
 elseif (tipoRegra == 2) %1/3 de simpson
     In=umtercoSimpson(funcao,a,b,N);       %Estimativa com N intervalos
     I2n=umtercoSimpson(funcao,a,b,2*N);    %Estimativa com 2N intervalos
 else
     fprintf('Entrada do tipo de regra de integração inválida');
 end
 
I=(2^2*I2n - In)/(2^2 -1);     %Fórmula geral para duas estimativas com erro de mesma ordem e h2=h1/2
