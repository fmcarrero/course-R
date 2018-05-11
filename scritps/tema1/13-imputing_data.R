library (mice)

housing.data <- read.csv("../data/tema1/housing-with-missing-value.csv", 
                         header = TRUE,
                         stringsAsFactors = FALSE)

columnas <- c("ptratio","rad")

## pmm - comparacion predictiva de medias
## logreg - regresion logistica
## polyreg - regresion logistica politomica
## polr - modelo de probabilidades proporcionales

## con la funcion mice contruimos el modelo

imputed_data <- mice(housing.data [, names(housing.data) %in% columnas],
                     m = 5,
                     maxit = 50,
                     method ="pmm",
                     seed =2018
                     )

summary(imputed_data)

complete.data <- mice::complete(imputed_data)

housing.data$ptratio <-  complete.data$ptratio
housing.data$rad <-  complete.data$rad

anyNA(housing.data)


impute.arg <- aregImpute(~ptratio + rad , data = housing.data 
                         , n.impute = 5
                         )

impute.arg$imputed$ptratio
