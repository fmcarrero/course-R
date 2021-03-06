data <-  read.csv("../data/tema2/auto-mpg.csv", 
                  stringsAsFactors = FALSE)

# index by position

data[1:5 , c(8,9)]

#Index by name

data [1:5 , c("model_year","car_name")]

## min / max of mpg

data[data$mpg == max(data$mpg) |  data$mpg == min(data$mpg),]

#filter with conditions

data [data$mpg > 30 & data$cylinders==6,c("car_name", "mpg")]

data[data$mpg>30 & data$cyl == 6 , c("car_name","mpg")]

#subset

subset(data,mpg>30 & cylinders == 6,
       select = c("car_name","mpg"))


data[1:5 , !names(data) %in% c("No","car_name")]
data [data$mpg %in% c(15,20) , c("car_name","mpg")]
