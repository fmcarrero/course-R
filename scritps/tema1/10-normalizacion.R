housing <-  read.csv("../data/tema1/BostonHousing.csv")
housing.z <- scale(housing)

housing.none <- scale(housing , center = FALSE, scale = FALSE)
housing.mean <- scale(housing , center = TRUE, scale = FALSE)

housing.sd <- scale(housing , center = FALSE, scale = TRUE)


scale.many <- function (dataframe , cols){
  names <- names (dataframe)
  for(col in cols){
    name <- paste(names [col] , "z" ,sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat (paste("hemos normalizado " , length(cols) , " variable(s)"))
  dataframe
}

housing <- scale.many(housing , c(1,3,5:8))
