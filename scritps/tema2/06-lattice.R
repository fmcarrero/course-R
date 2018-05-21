auto <-  read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3c","4c","5c","6c","8c"))

#install.packages("lattice")
library(lattice)

bwplot(~ auto$mpg | auto$cylinders,
       main = "mpg segun cilindrada",
       xlab = "Millas por galeon",
       layout = c(2,3), aspect = 1)

xyplot(mpg~weight | cylinders , data = auto,
       main = "Peso vs Consumo vs Cilindrada",
       xlab ="Peso(kg)",
       ylab ="Consumo (mpg)")

# tambien podes usar densityplot, splom


trellis.par.set(theme = col.whitebg())
