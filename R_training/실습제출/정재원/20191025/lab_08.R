#문제1
mySum<-function(...){
  mySumData<-c(...)
  if(is.null(mySumData))stop()
  if(!is.vector(mySumData) | is.list(mySumData)){
      stop("벡터만 처리 가능!!")
      return()
    } 
  if (!is.numeric(mySumData)) {
        stop("숫자 벡터를 전달하숑!")
        return()
      }
  oddSum<-0
  evenSum<-0
  mySumData_min <- min(mySumData,na.rm = T)
  if(any(is.na(mySumData))){
    warning("NA를 최저값으로 변경하여 처리함.")
  }
    for(item in mySumData){
      if(is.na(item))item<-mySumData_min
      if(item%%2 == 0){
        evenSum<-evenSum+item
      } else {
        oddSum<-oddSum+item
        }
    }
    result<-list(evenSum=evenSum,oddSum=oddSum)
    return(result)
  }
  
mySum()
mySum(NULL)
mySum("1","2")
mySum(1,2,NA)
mySum(2,3,5,6,NA,8,9,NA,NA)
mySum(1,2,3,1,5,6,8,9)
mySum(2,3,5,6,NA,8,9,NA,NA)

#문제2
myExpr<-function(f1){
  if(!is.function(f1))stop("수행 안할거임!!")
  randomNumber1<-sample(1:45,6)
  return(f1(randomNumber1))
}
myExpr(mySum)
myExpr(v1)

#문제3
createVector<-function(...){
  x<-c(...)
  if(any(is.na(x)))return(NA)
  result<-x
  return(result)
}
createVector()
createVector(1,2,3,4)
createVector(1,2,3,4,NA)
#문제4
ioTest1<-scan(file = "c:/rstudy/data/iotest1.txt")
print(sort(ioTest1))
print(sort(ioTest1,decreasing = T))
sum(ioTest1)
mean(ioTest1)
#문제5
ioTest2<-scan(file = "c:/rstudy/data/iotest2.txt",what = "")
uniqueName<-unique(ioTest2)
c1<-rep(0,length(uniqueName))
for(i in 1:length(uniqueName)){
c1[i]<-(sum(uniqueName[i]==ioTest2))
}
uniMrt<-rbind(uniqueName,c1)
print(uniMrt)
x<-uniMrt[1,order(-c1)[1]]
cat("가장 많이 등장하는 단어는",x,"입니다.\n")

#uniMrtC<-cbind(uniqueName,c1)
#print(uniMrtC)
#y<-uniMrtC[order(-c1)[1],1]
#cat("가장 많이 등장하는 단어는",y,"입니다.\n")

#uniMrtC_order<-uniMrtC[order(-c1,uniqueName),]
#uniMrtC_order
#cat("가장 많이 등장하는 단어는",uniMrtC_order[1,1],"입니다.\n")
#uniMrt_order<-uniMrt[,order(-c1,uniqueName)]
#uniMrt_order
#cat("가장 많이 등장하는 단어는",uniMrt_order[1,1],"입니다.\n")
