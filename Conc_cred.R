getwd()
setwd('C:/Users/victo/OneDrive/BCH - BCE/TRATAMENTO DE S�RIES')
install.packages('XLConnect', lib="C:/Users/victo/Documents/R/win-library/3.5")
install.packages('gdata')
#XLConnect e gdata s�o pacotes para leitura de dados excel (xlsx e xls, respectivamente)##
library(XLConnect)
Cred=readWorksheet(loadWorkbook("Conc_Cred.xlsx"), sheet=1)
#Aparecem uns avisos aleat�rios, mas deu certo com o XLConnect, ent�o n�o tentei com o gdata ainda, optando por deixa-lo para ocasi�o em que o primeiro n�o funcione###
Credito=(Cred$Conc_MM)
Data=(Cred$Data)
plot(Data, Credito, type='line', col="black")
##plot (x, y, tipo de gr�fico [de linha, neste caso], cor [preta, neste caso])##
install.packages('ggplot2')
##(finalmente utilizando o famigerado ggplot) como o ggplot '1' n�o � compat�vel com a vers�o 3.5.0 do R, utilizei o ggplot2##
d=data.frame(Data=Data, Credito=Credito)
##Fun��o que cria um frame(quadro) de dados; grosso modo, frame � uma forma de organiza��o de dados que est� acima do vetor em termos de complexidade##
library(ggplot2)
ggplot(d, aes(x=Data, y=Credito)) + stat_smooth(se = FALSE) + ggtitle('Concess�es de Cr�dito - Brasil: 2011 - 2018') 
## � bom reparar aqui que o sinal de adi��o (+) inclui um plot diferente de gr�fico, o que d� maravilhoso efeito na visualiza��o##
