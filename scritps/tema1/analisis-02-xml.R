#install.packages("XML")
library(XML)
url <- "../../data/tema1/cd_catalog.xml"

xmldoc <- xmlParse(url)
rootnode <- xmlRoot(xmldoc)
rootnode[2]

cds_data <- xmlSApply(rootnode,function(x) xmlSApply(x, xmlValue) )
cds_catalog <- data.frame(t(cds_data),row.names = NULL) #transpone los datos
head(cds_catalog,2)
cds_catalog[1:5,] #extrae las primeras 5 registros

population_url <- "../../data/tema1/WorldPopulation-wiki.htm"
tables <- readHTMLTable(population_url)

most_populated <- tables[[6]]
head(most_populated,3)
custom_tables <- readHTMLTable(population_url, which = 6) #carga solo la tabla 6 de la pagina
