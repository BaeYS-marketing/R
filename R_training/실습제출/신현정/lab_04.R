#문제1

L1 <- list(
  name = "scott"
)
name[1]



result1 <- list(3000) 
result1[[1]]*2


#문제2

L2 <- list ( "scott", c(100, 200 ,300))

L2


#문제3

a<-list(c(3,5,7), c("A","B","C"))
a[[2]][1] <- "Alpha"
new_a <-unlist(a[2])
new_a
a

#문제4
a <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
a[[1]]+10


#문제5
a <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
new_a <- unlist(a)
mean(new_a)

#문제6
time <- 32150
time <- c(time%/%3600,"시", time%/%60%%60,"분", 
          time%%60,"초" )
time

