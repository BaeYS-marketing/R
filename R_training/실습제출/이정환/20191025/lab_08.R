# 문제1
mySum = function(vec) {
  if (is.null(vec) == T) {
    return()
  } else if ((is.vector(vec) != T) | (is.list(vec) == T)) {
    stop('벡터만 처리 가능!!')
  } else {
    odd = 0
    even = 0
    if (any(is.na(vec)) == T) {
      vec[is.na(vec)] = min(vec, na.rm = T)
    }
    for (i in 1:length(vec)) {
      if (i %% 2 == 0) {
        even = even + vec[i]
      } else {
        odd = odd + vec[i]
      }
    }
    lst = list(oddSum = odd, evenSum = even)
    return(lst)
  }
}
mySum(NULL)

# 문제2
myExpr = function(func) {
  if (is.function(func) != T) {
    stop("수행 안할꺼임둥!!")
  } else {
    v1 = sample(1:45, 6)
    return(func(v1))
  }
}
myExpr(mean)

# 문제3
createVector = function(...) {
  if (is.null(c(...))) {
    return()
  } else if (any(is.na(c(...))) == T) {
    return(NA)
  } else {
    v1 = c(...)
    return(v1)
  }
}
createVector('asd', 111, T)

# 문제4
iotest1 = scan('data/iotest1.txt')
cat('오름차순 :', sort(iotest1))
cat('내림차순 :', sort(iotest1, decreasing = T))
cat('합 :', sum(iotest1))
cat('평균 :', mean(iotest1))

# 문제5
iotest2 = scan('data/iotest2.txt', what=' ')
iotable = table(iotest2)
maxi = iotable[iotable == max(iotable)]
max_word = names(maxi)
cat('가장 많이 등장한 단어는', max_word, '입니다.')
