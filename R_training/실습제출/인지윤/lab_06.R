#1
exam1 <- function() {
  result <- paste(LETTERS[],sep="", letters[])
  return(result)
}
exam1()


#2
exam2 <- function(ex2) {
  sum=0
  for (i in 1:ex2) {
    sum=sum+i
    i=i+1
  }
  return(sum)
}
exam2(4)


#3
exam3 <- function(ex3_1, ex3_2) {
  if (ex3_1 > ex3_2) {
    result3 = ex3_1 - ex3_2
  } else if (ex3_1 < ex3_2) {
    result3 = ex3_2 - ex3_1
  } else {
    result3 = 0 
  }
  return(result3)
}
exam3(3,5)
exam3(5,3)
exam3(5,5)


#4
exam4 <- function(ex4_num1, ex4_op, ex4_num2) {
  if (ex4_op=="+") {
    result4 = ex4_num1 + ex4_num2 
  } else if(ex4_op=="-") {
    result4 = ex4_num1 - ex4_num2
  } else if(ex4_op=="*") {
    result4 = ex4_num1 * ex4_num2
  } else if(ex4_op=="%/%") {
    if (ex4_num1==0) {
      result4 = "오류1"
    } else if(ex4_num2==0) {
      result4 = "오류2"
    } else {
      result4 = ex4_num1 %/% ex4_num2
    }
  } else if(ex4_op=="%%") {
    if (ex4_num1==0) {
      result4 = "오류1"
    } else if(ex4_num2==0) {
      result4 = "오류2"
    } else {
      result4 = ex4_num1 %% ex4_num2
    }
  } else {
    result4 ="규격의 연산자만 전달하세요"
  }
  return(result4)
}
exam4(3,"*",5)  
exam4(3, "%%", 0)
exam4(0, "%/%", 3)
exam4(5,"=",3)
