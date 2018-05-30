getwd()
setwd('C:/Users/victo/OneDrive/BCH - BCE/TRATAMENTO DE SÉRIES')
install.packages('XLConnect', lib="C:/Users/victo/Documents/R/win-library/3.5")
install.packages('gdata')
#XLConnect e gdata são pacotes para leitura de dados excel (xlsx e xls, respectivamente)##
library(XLConnect)
Cred=readWorksheet(loadWorkbook("Conc_Cred.xlsx"), sheet=1)
#Aparecem uns avisos aleatórios, mas deu certo com o XLConnect, então não tentei com o gdata ainda, optando por deixa-lo para ocasião em que o primeiro não funcione###
Credito=(Cred$Conc_MM)
Data=(Cred$Data)
plot(Data, Credito, type='line', col="black")
##plot (x, y, tipo de gráfico [de linha, neste caso], cor [preta, neste caso])##
install.packages('ggplot2')
##(finalmente utilizando o famigerado ggplot) como o ggplot '1' não é compatível com a versão 3.5.0 do R, utilizei o ggplot2##
d=data.frame(Data=Data, Credito=Credito)
##Função que cria um frame(quadro) de dados; grosso modo, frame é uma forma de organização de dados que está acima do vetor em termos de complexidade##
library(ggplot2)
ggplot(d, aes(x=Data, y=Credito)) + stat_smooth(se = FALSE) + ggtitle('Concessões de Crédito - Brasil: 2011 - 2018') 
## é bom reparar aqui que o sinal de adição (+) inclui um plot diferente de gráfico, o que dá maravilhoso efeito na visualização##
