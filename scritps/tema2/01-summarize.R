data <-  read.csv("../data/tema2/auto-mpg.csv",
                  header = TRUE,
                  stringsAsFactors = FALSE)

#la funcion factor convierte valores a factores o variables categoricas
data$cylinders <- factor(data$cylinders, levels = c(3,4,5,6,8),
                         labels = c("3cil","4cil","5cil","6cil","8 cil"))


summary(data)

str(data)

summary(data$cylinders)
str(data$cylinders)


#install.packages(c("modeest", "raster", "moments"))
library(modeest)
library(raster)
library(moments)

X <- data$mpg

### medidas de centralización
mean(X)
median(X)
mfv(X) #MODA
quantile(X)

## MEDIDAS DE DISPERSIÓN

var(X) # VARIANZA
sd(X) # DESVIACION STANDAR
cv(X)  #Coeficiente de variacion

##medidas de asimetría

skewness(X)
kurtosis(X)

par(mfrow = c(1,1))
hist(X)
