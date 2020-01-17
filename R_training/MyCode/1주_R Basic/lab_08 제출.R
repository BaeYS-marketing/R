#문제1

mySum <- function(vec){
        if(!is.vector(vec)) {
                stop('백터만 처리가능!')
        }
        if(is.null(vec)) {
                return()
        }
        if(any(is.na(vec))) {
                warning('NA를 최저값으로 변경하여 처리함')
                vec[is.na(vec)] <- min(vec,na.rm =T)
        }
        evenSum <- 0; oddSum<-0
        for(i in vec){
                if(i%%2 == 0){
                        evenSum <- evenSum + i
                }else {
                        oddSum <- oddSum +i 
                }
        }
        final <- list(oddSum = oddSum , evenSum = evenSum)
        return(final)
}





#문제2
myExpr <- function(x){ x+100 
}

myExpr(10)

myExpr2 <- function(myExpr){
        if(!is.function(myExpr)){
                stop('아규먼트가 함수 아니면 실행 안할꺼임!')
        }else{
                arg = sample(1:45, 6)
                for (i in arg){
                        print(myExpr(i))
                }
        }
        return("완성")
}

#이런걸 알려주고 싶었다.  대표적으로 apply
myExpr2(myExpr)


'> sum()
[1] 0
> sum
function (..., na.rm = FALSE)  .Primitive("sum")
> '
print(myExpr)


#myExpr(20)





#문제3
#...
createVector <- function(...) {
        data = list(...)
        
        if(is.null(data)){
                return('NULL')
        }
        if(any(is.na(data))){
                return('NA')
        }
        a1 <- unlist(data)
        return(c(a1))
}

createVector(3,'#')




# 문제4

