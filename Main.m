%Esse é o arquivo principal e contém alguns exemplos de integrações para a comparação dos
%seus valores exatos e o valor encontrado com a extrapolação

%Exemplo1 -> valor exato = 3.60033... 
funcao = 'log(2^x) + cos(x)'; a=1; b=4; tipoRegra=1; N=8; %(utilizando regra dos trapézios composta)


%Exemplo2 -> valor exato = 1.640533
%funcao = '0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5' ; a=0; b=0.8; tipoRegra=2; N=8; %(utilizando regra 1/3 de simpson composta)




richardsonExtrapolation(funcao,a,b,tipoRegra,N)
%Variáveis de entrada:
%funcao função que será integrada, string 
%a limite inferior de integração
%b limite superior de integração
%tipoRegra a regra para encontrar as duas estimativas da integral, sendo a entrada 1
%para escolher a regra trapezoidal e 2 para escolher a regra 1/3 de simpson
%N número de segmentos (nível de precisão) da integração para gerar uma das estimativas utilizadas
