clientes <- c("juan gabriel","ricado", "pedro")
fechas <- as.Date(c("2017-12-27","2017-11-1","2018-1-1"))
pago <- c(315,192.55,40.11)
pedidos <- data.frame(clientes , fechas , pago)

clientes_vip <- c("juan gabriel", "ricado")

save(pedidos,clientes_vip, file = "../data/tema1/pedidos.Rdata")
saveRDS(pedidos, file = "../data/tema1/pedidos.rds")
remove(pedidos)

load("../data/tema1/pedidos.Rdata")
orders <- readRDS("../data/tema1/pedidos.rds")

data(iris)
data(cars)

save.image(file = "../data/tema1/alldata.Rdata")  # guarda todos los objetos de la session

primes <- c(2,3,5,7,11,13)
pow2 <-  c(2,4,8,16,32,64,128)

save( list = c("primes", "pow2"), file = "../data/tema1/prime_and_pow2.Rdata")

attach("../data/tema1/prime_and_pow2.Rdata") # valida que si los objetos ya estan cargados en memory


