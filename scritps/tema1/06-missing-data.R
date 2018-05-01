data <- read.csv("../data/tema1/missing-data.csv", na.strings = "") # reemplaza los string "" with na

data.cleaned <- na.omit(data)  # elimina las filas sin na

is.na(data$Income)

#limpoar na de solamente la variable income
data.income.cleaned <- data[!is.na(data$Income) ,]

#filas completas para un dataframe
complete.cases(data)

data.cleaned.2 <- data[complete.cases(data),]

#convertir los ceros de ingresos en na
data$Income[data$Income == 0] <- NA

#PROMEDIO IGNORANDO LOS VALORES NA
mean(data$Income , na.rm =TRUE )

#DESVIACION TIPICA IGNORANDO LOS VALORES NA
sd(data$Income , na.rm = TRUE)
