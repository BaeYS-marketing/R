# 문제1
exam1 <- function() {
  s1 = c()
  for (i in 1:26) {
    s1[i] = paste(LETTERS[i], letters[i], sep='')
  }
  return(s1)
}
exam = exam1()
exam

# 문제2
exam2 <- function(x) {
  y = 0
  for (i in 1:x) {
    y = y + i
  }
  return(y)
}
exam = exam2(10)
exam

# 문제3
exam3 <- function(x, y) {
  if (x > y) {
    z = x - y
  } else if (x < y) {
    z = y - x
  } else {
    z = 0
  }
  return(z)
}
exam = exam3(3, 3)
exam

# 문제4
exam4 <- function(x, y, z) {
  if (y == '+') {
    a = x + z
  } else if (y == '-') {
    a = x - z
  } else if (y == '*') {
    a = x * z
  } else if (y == '%/%') {
    if ((x == 0) & (z == 0)) {
      a = '둘 다 오류'
    } else if (x == 0) {
      a = '오류1'
    } else if (z == 0) {
      a = '오류2'
    } else {
      a = x %/% z
    }
  } else if (y == '%%') {
    if ((x == 0) & (z == 0)) {
      a = '둘 다 오류'
    } else if (x == 0) {
      a = '오류1'
    } else if (z == 0) {
      a = '오류2'
    } else {
      a = x %% z
    }
  } else {
    a = '규격의 연산자만 전달하세요'
  }
  return(a)
}
exam = exam4(1, '%%', 0)
exam
