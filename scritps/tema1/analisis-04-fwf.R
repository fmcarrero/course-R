students_data <- read.fwf("../data/tema1/student-fwf.txt",
                          widths = c(4,15,20,15,4), #defne las posiciones
                          col.names = c("id","nombre","email","carrera","año") # coloca nombre a las columnas
                          )


stedents_Data_header <- read.fwf("../data/tema1/student-fwf-header.txt",
                                 widths = c(4,15,20,15,4), #defne las posiciones
                                 header = TRUE , sep = "\t" ,
                                 skip = 2)

students_data_no_email <- read.fwf("../data/tema1/student-fwf.txt",
                          widths = c(4,15,-20,15,4), #defne las posiciones
                          col.names = c("id","nombre","carrera","año") 
                          )

