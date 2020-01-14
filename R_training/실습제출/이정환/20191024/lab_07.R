# 문제1
exam5 = function(num, cha='#') {
  if (num >= 0) {
    print(rep(cha, num))
  }
  return()
}
exam5(2)
exam5(2,%)

# 문제2
exam6 = function(vec) {
  for (i in 1:length(vec)) {
    if (is.na(vec[i])) {
      print(paste(vec[i], '는 처리불가'))
    } else if (vec[i] >= 85) {
      print(paste(vec[i], '점은 상등급입니다.'))
    } else if (vec[i] >= 70) {
      print(paste(vec[i], '점은 중등급입니다.'))
    } else {
      print(paste(vec[i], '점은 하등급입니다.'))
    }
  }
  return()
}
exam6(c(50, 75, NA, 99))

# 문제3
countEvenOdd = function(vec) {
  if (is.numeric(vec) != T) {
    return()
  }
  even = 0
  odd = 0
  for (i in vec) {
    if (i %% 2 == 0) {
      even = even + 1
    } else {
      odd = odd + 1
    }
  }
  lst = list(even = even, odd = odd)
  return(lst)
}
countEvenOdd(c(2,3,4,5,6,7,8))

# 문제4
vmSum = function(x) {
  if ((is.vector(x) != T) | (is.list(x) == T)) {
    print('벡터만 전달하숑!')
    return()
  } else {
    if (is.numeric(x) != T) {
      print('숫자 벡터를 전달하숑!')
      return(0)
    } else {
      return(sum(x))
    }
  }
}
vmSum(c(1,2,3,4))
