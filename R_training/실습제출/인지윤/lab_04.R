#문제1
L1 <- list("scott", 3000)
names(L1) <- c("name", "sal")
L1

result1 <- L1[[2]]*2
result1

#문제2
L2 <- list("scott", c(100, 200, 300))
L2


#문제3
ex3 <- list(c(3,5,7), c("A","B","C"))
ex3[[2]][1] <- "Alpha"
ex3


#문제4
ex4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
ex4[[1]]+10


#문제5
ex5 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
ex5
mean(unlist(ex5))


#문제6
time <- 32150
paste(time%/%3600, "시", time%/%60%%60, "분", time%%60,"초",sep=" ")
