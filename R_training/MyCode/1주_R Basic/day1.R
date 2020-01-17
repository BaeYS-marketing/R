v1 <- c(4,1,3,10,11)



v2<-c(10,20,30)
print('hellow')
plot(1:10)
max(1:100)


#v1변수에 저장된 데이터셋에서 최대값
max(v1)


#v1변수에 저장된 데이터셋에서 최소값
min(v1)



x3<- seq(10,5)
x3

x4 <- seq(10,0,-2)
x4

sd(x3)
AVG(x3)

unico <- function(x){
   print('hello')
}

unico(v3)

r1<-NULL
r1
r2<- TRUE
r2
r3<- 'HI'
r3
r4<-nums()
r4


################ paste #######################
#sep : 요소끼리 합할 때   
#collapse : 요소끼리 합한 걸 구분
paste(c("a", "b"), c("x", "y"), sep = " and ", collapse = " gg ")
paste(c("a", "b"), c("x", "y"), collapse = " ")
paste(c("a", "b"), c("x", "y"), sep = " and ")




paste(c('첫','두','세','네','다섯'), rep('번째',5), sep= "-", collapse = " ,, ")
paste0(c('첫','두','세','네','다섯'))










paste(c('첫','두','세','네','다섯'), rep('번째', 5), sep=" - ", collapse='g ')

paste(c('첫','두','세','네','다섯'), rep('번째', 5))

paste(c('첫','두','세','네','다섯'), rep('번째', 5), sep= " - ")





v <- 10 + TRUE
v <- c(10 ,"1")
typeof(v)

v2<- c(10, '1', TRUE)
typeof(v2)

?rep

rep(1:3 , times =5)
rep(1:3 , each =5)


letters
LETTERS
month.abb
month.name
pi


letters;LETTERS;month.name;month.abb;pi



x<- c(10,2,7,4,15)
x

print(x)
class(x)
typeof(x)
rev(x)
range(x)
sort(x)
sort(x, decreasing=TRUE)
sort(x, decreasing=T)
order(x)


v<- 1:10
v[2] <- 5

v<- 1:5

v[c(T,F,T,F)]
v>2
v[v>2]
v[v>2 & v <5]
v[ 2<v<5 ]



x2<-array(1:9 ,c(3,3))
x2

x<-1:5
names(x) <- LETTERS[1:5]
x
names(x)


c(T,T,F,F) & c(T,F,T,F)
#원소마다 연산

c(T,T,F,F) && c(T,F,T,F)
#첫번째 원소만 하고 끝남버림 [1]
