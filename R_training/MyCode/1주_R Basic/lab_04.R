#문제1
#a
L1 <- list( name = 'scott' , 
            sal = 3000 )
L1

#b
result1 <- L1[[2]]*2
result1



#문제2
L2 <- list( 'scott' , 
            c(100,200,300) )

L2



#문제3
L3 <- list(c(3,5,7), c('A',"B",'C'))
L3[[2]][1]<- 'Alpha'
L3



#문제4
L4<-list(alpha = 0:4 , beta = sqrt(1:5), gamma=log(1:5))
L4

L4[[1]]+10



#문제5
L5 <- list(math = list(90,50), writing = list(90,85), reading = list(85,80))

mean(unlist(L5))



#문제6
time <- 32150

h<-time %/% 3600
m<- (time %% 3600) %/% 60 
s<- (time %% 3600) %% 60


paste(h,'시간 ',m,'분 ',s,'초', sep='' )
