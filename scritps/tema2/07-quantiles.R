s <- seq(0.01, 0.99, 0.01)

qn <- qnorm(s)

df <-  data.frame(p = s , q = qn)

sample <- rnorm(200)
quantile(sample , probs = s)


#qqnorm

trees
qqnorm(trees$Height)
qqnorm(randu$x)

#qqplot
randu
n <-  length(randu$x)

y <-  qunif(ppoints(n))
y
qqplot(y , randu$x)


chi3 <-  qchisp(ppoints(30), df =3)

plor(x, pnorm)
couckycautchy <- quanti
