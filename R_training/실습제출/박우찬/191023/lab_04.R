# Q.1
L1 = list( name = "scott", sal = 3000)
L1

# Q.2
L2 =list('scott',c(100,200,300))
L2

# Q.3
L3 = list(c(3,5,7),c('A','B','C'))
L3[[2]][1] = "Alpha"
L3

# Q.4
L4 = list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] = L4[[1]] + 10
L4

# Q.5
L5 = list(math=list(95, 90),
          writing=list(90, 85),
          reading=list(85, 80))
mean(unlist(L5))

# Q.6
time = 32150

hour = time%/%3600
minute = (time%%3600)%/%60
second = time-(hour*3600+minute*60)
paste(hour,"시간",minute,"분",second,"초")

