# 문제1
L1 <- list(
  name = "scott",
  sal = 3000
)
result1 <- L1$sal *2

# 문제2
L2 <- list("scott", c(100, 200, 300))

# 문제3
L3 <- list(c(3, 5, 7), c("A", "B", "C"))
L3[[2]][1] <- "Alpha"

# 문제4
L4 <- list(
  alpha=0:4,
  beta=sqrt(1:5),
  gamma=log(1:5)
)
L4$alpha +10

# 문제5
L5 <- list(
  math=list(95, 90),
  writing=list(90, 85),
  reading=list(85, 80)
)

mean(unlist(L5$math)+
     unlist(L5$writing)+
     unlist(L5$reading))

# 문제6
time <- 32150

time%%60        # 50초
(time%/%60)%%60 # 55분
time%/%60^2     # 8시간

paste0(time%/%60^2,"시간 ", (time%/%60)%%60, "분 ", time%%60, "초")
