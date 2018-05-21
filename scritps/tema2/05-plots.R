auto <- read.csv("../data/tema2/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3cil","4cil","5cil","6cil","8cil"))

attach(auto)
head(cylinders)

#histograma de frecuencias
hist(acceleration, 
     col= rainbow(12), # obtiene un ramdon de colores
     xlab="Aceleracion",
     ylab = "Frecuencias",
     main = "Histograma de las aceleraciones",
     breaks = 12)

hist(mpg,breaks = 16, prob=TRUE)
lines(density(mpg))
#boxplots
plot(mpg ~ horsepower , type ="n")
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)

#agregar colores para cada cilindrada
with(subset(auto, cylinders=="8cil") , 
     points(horsepower, mpg, col = "red"))

with(subset(auto, cylinders=="6cil") , 
     points(horsepower, mpg, col = "yellow"))

with(subset(auto, cylinders=="5cil") , 
     points(horsepower, mpg, col = "green"))

with(subset(auto, cylinders=="4cil") , 
     points(horsepower, mpg, col = "blue"))

with(subset(auto, cylinders=="3cil") , 
     points(horsepower, mpg, col = "black"))

boxplot(mpg , xlab = "Millas por Galeon")

boxplot(mpg ~ model_year ,xlab = "Millas por Galeon (por año)")

boxplot(mpg ~ cylinders , xlab = "Consumo por numero de cilindros")
boxplot(auto)
#scatterplot

plot(mpg ~ horsepower)

# matriz de scatterplots

pairs(~ mpg+displacement+horsepower+weight)


#combinacion de plots con par

old.par <- par()

par(mfrow=c(1,2))

with(auto , {
  plot(mpg ~ weight , main =" peso vs consumo")
  plot (mpg ~ acceleration , main ="acceleracion vs consumo")
})

par(old.par)  # resetea los valores 
