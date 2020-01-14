#문제1
L1 <- list(a="scott", b=c(100,200,300))
names(L1) <- c("name", "sal");L1

#문제2
L2 <- list(a="scott", b=c(100,200,300))
names(L2)=NULL;L1

#문제3
L3 <- list(c(3,5,7), c("A", "B", "C"));L3
L3[[2]][1]<-"Alpha";L3

#문제4
L4 <- list(alpha=0.4, beta=sqrt(1:5), gamma=log(1:5))
L4
L4[[1]][1]+10;L4

#문제5
L5 <- list(math=list(95,90), writing=list(90,85),
           reading=list(85,80));L5
unlist(L5)
mean(95,90,90,85,85,80)

#문제6-1
time <- 32150
time <- NULL
time

#문제6-2

time <- Sys.time()
time <- strptime("time", "%Y%m%d") #?
