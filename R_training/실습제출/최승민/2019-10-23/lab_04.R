#문제1
L1 <- list(name = "scott", sal = 3000)

result <- L1[[2]] *2 

#문제2 
L2 <- list("scott", seq(100, 300, 100))
  
#문제3
L3 <- list(c(3,5,7), c("A", "B", "C"))
L3[[2]][1] <- "alpha"
  
#문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma(1:5))
L4[[1]] + 10  

#문제5
L5 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
nmath <- unlist(L5[1])  
nwriting <- unlist(L5[2])
nreading <- unlist(L5[3])

mid_av <- c(nmath[1], nwriting[1], nreading[1])
mid_rst <- mean(mid_av)
end_av <- c(nmath[2], nwriting[2], nreading[2])
end_rst <- mean(end_av)
ttl_av <- mean(mid_rst, end_rst)

#문제6
time <- 32150
hour <- (time %/% 60) %/% 60 
min <- (time %/% 60) %% 60
sec <- time %% (time%/%60)

paste( "Time=", hour,"시간",  min,"분",  sec,"초" )

