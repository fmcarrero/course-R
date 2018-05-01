data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")

#reemplaza los datos de ingresos na con el valor promedio de los ingresos
data$Income.mean <- ifelse(is.na(data$Income) ,
                           mean(data$Income , na.rm = TRUE ), 
                           data$Income)




rand.impute <-  function(x){ # X ES UN vector de datos que puede contener NA
  missing <- is.na(x) # CONTIENE UN VECTOR DE VALORES TRUE O FALSE DEPENDIENDO DEL NA DE X
  #N.MISSING contiene cuando valores son NA
  n.missing <- sum(missing)
  #x.obs son los valores que tiene dato diferente  de NA en x
  x.obs <- x[!missing]
  # por defecto devolvere lo mismo que habia entado por parametro
  imputed <- x
  #en los valores que faltaban los reemplazamos por una muestra
  #de los que si conocemos (muestra aleatoria simpre con reemplazo)
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return(imputed)
}

random.inpute.data.frame <-  function(dataFrame,cols){
  names <- names(dataFrame)
  for(col in cols){
    name <- paste(names[col] , ".imputed" , sep = "")
    dataFrame[name] = rand.impute(dataFrame[, col])
  }
  dataFrame
}

data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income==0] <-NA
data <- random.inpute.data.frame(data , c(1,2))
