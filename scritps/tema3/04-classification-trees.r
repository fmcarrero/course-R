#install.packages(c("rpart","rpart.plot","caret"))

library(caret)
library(rpart)
library(rpart.plot)

backnote <- read.csv("../data/tema3/banknote-authentication.csv")

View(backnote)

set.seed(2018)
training.ids <- createDataPartition(backnote$class,
                                    p= 0.7,
                                    list = F)

mod <- rpart(class ~., data = backnote[training.ids,],
             method = "class",
             control = rpart.control(minsplit = 20 , cp=0.01))

prp(mod , type=2 , extra = 104 , nn= T,
    fallen.leaves = T, faclen = 4 , varlen = 8,
    shadow.col = "gray")


mod$cptable

mod.pruned <- prune(mod , mod$cptable[8,"CP"])

prp(mod.pruned , type=2 , extra = 104 , nn= T,
    fallen.leaves = T, faclen = 4 , varlen = 8,
    shadow.col = "gray")

pred.pruned <- predict(mod.pruned , backnote[- training.ids,] 
                       ,type ="class")

table(backnote[-training.ids,]$class , pred.pruned,
      dnn = c("Actual","Predicho"))
