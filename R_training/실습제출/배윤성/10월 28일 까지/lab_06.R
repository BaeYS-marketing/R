

#문제1
exam1 <- function(){
        return(paste(LETTERS[1:26],letters[1:26], sep=''))}

exam1()



# return() <- paste(LETTERS[1:26],letters[1:26], sep='')  오류




#문제2
exam2 <- function(x){
        sum <- 0
        for(i in 1:x){                     # for i in x ?
                sum <- sum+i}
        return(sum)
        }
        
        
exam2(10)
        



#문제3
exam3 <- function(x,y){
        if(x==y){
                result <- 0             #result <- print(0)
        }
        else {
                result <- abs(x-y)
        }
        return(result)
        
}

exam3(10,5)



#문제3-2

exam3 <- function(x,y){
        if(x==y){
                return(0)             #result <- print(0)
        }
        else {
                return(abs(x-y))
        }
                                     #알아둘 것 return() 만나면 함수종료
}

exam3(10,5)







#문제4
exam4 <- function(x,y,z){
        if (y == '+'){
        return(x+z)
        }
        if (y == '-'){
                return(x-z)
        }
        if (y == '*'){
                return(x*z)
        }
        
        if (y == '%/%'){
                if(x==0){
                        print('오류1')
                }
                else return(x%/%z)
        }
        
        if (y == '%%'){
                if(y==0){
                        print('오류2')
                }
                else return(x%%z)
        }
        

}
 
exam4(10,'+',7)           
        

