housing.data <- read.csv("../data/tema1/housing-with-missing-value.csv",
                         header = TRUE,
                         stringsAsFactors = FALSE)


summary(housing.data)
#eliminar todas las observaciones que contengan NA
housing.data.1 <-  na.omit(housing.data)
summary(housing.data.1)

#Eliminar las NA de ciertas columnas

drop_na <- c("rad")
housing.data.2 <- housing.data[ 
  complete.cases(housing.data[,!(names(housing.data)) %in% drop_na]),]

summary(housing.data.2)
#eliminar toda una columna

housing.data$rad <- NULL

drops <- c("rad","ptratio")
housing.data.3 <- housing.data[, !(names(housing.data) %in% drops)]

#install.packages("Hmisc")
library(Hmisc)


housing.data.copy <- housing.data
housing.data.copy$ptratio <- impute(housing.data.copy$ptratio , mean)
housing.data.copy$rad <- impute(housing.data.copy$rad , mean)


summary (housing.data.copy)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary (housing.data.copy2)


#install.packages("mice")
library (mice)

md.pattern(housing.data)


#install.packages("VIM")
library(VIM)



aggr(housing.data,
     col = c('green', 'red'),
     numbers = TRUE,
     sortVars = TRUE,
     labels = names(housing.data),
     cex.axis = 0.75,
     gap = 1,
     ylab = c("histograma de NAs", "patron")
     )
