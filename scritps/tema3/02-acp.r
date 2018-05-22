#acp == analisis de componentes principales


usarrests <-  read.csv("../data/tema3/USArrests.csv" , stringsAsFactors = F)
rownames(usarrests)  <- usarrests$X
usarrests$X = NULL  # PARA ELIMINAR COLUMNAS

head(usarrests)

apply(usarrests,2, var)

acp <- prcomp(usarrests , center = TRUE , scale= T)

plot(acp , type ="l")

summary(acp)

biplot(acp , scale =0)

pc1 <-apply(acp$rotation[,1]* usarrests ,1, sum)
pc2 <- apply(acp$rotation[,2]* usarrests,1,sum)


usarrests$pc1 <- pc1
usarrests$pc2 <- pc2


usarrests[,1:4] = NULL
