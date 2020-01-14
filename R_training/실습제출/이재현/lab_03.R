#문제 1

L1 <- list(name= "scott", sar= 3000)
resultl <- L1[[2]]*2

#문제 2

L2 <- list("scott", c(100,200,300))

#문제 3

L3 <- list(c(3, 5, 7), c("a", "b", "c"))
L3[[2]][1] <- "Alpha"

#문제 4

L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]]+10

#문제 5

L5 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mathscore <- mean(unlist(L5[1]))
writingscore <- mean(unlist(L5[2]))
readingscore <- mean(unlist(L5[3]))
totalscore <- mean((mathscore+writingscore+readingscore)/3)
print(totalscore)
  
#문제 6
time <- 32150
a <- time%%60
b <- (time%/%60)%%60
c <- (time%/%60)%/%60
paste(c, "시간", b, "분", a, "초")
  



