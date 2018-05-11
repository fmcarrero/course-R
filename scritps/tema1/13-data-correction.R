install.packages("tidyr")
library (tidyr)

crime.data <- read.csv("../data/tema1/USArrests.csv", stringsAsFactors = FALSE)

View(crime.data)

crime.data <- cbind(state = rownames(crime.data), crime.data)

crime.data.1 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       Murder : UrbanPop)


crime.data.2 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       -state)

crime.data.3 <- gather(crime.data,
                       key ="crime_type",
                       value = "arrest_estimate",
                       Murder,Assault)

crime.data.4 <- spread(crime.data.2,
                       key = "crime_type",
                       value ="arrest_estimate")

# unite, concatena una o varias columnas
crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault ,
                      sep = "_")

#volver a separar las columnas que antes habiamos unido
crime.data.6 <- separate(crime.data.5,
                         col = "Murder_Assault",
                         into= c("Murder","Assault"),
                         sep ="_")
