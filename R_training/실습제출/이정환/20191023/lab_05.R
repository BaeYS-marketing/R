# 문제1
grade = sample(1:6, 1)
if (grade <= 3) {
  cat(grade, '학년은 저학년입니다.')
} else {
  cat(grade, '학년은 고학년입니다.')
}

# 문제2
choice = sample(1:5, 1)
choice
if (choice == 1) {
  x = 300 + 50
} else if (choice == 2) {
  x = 300 - 50
} else if (choice == 3) {
  x = 300 * 50
} else if (choice == 4) {
  x = 300 / 50
} else {
  x = 300 %% 50
}
cat('결과값 :', x)

# 문제3
count = sample(3:10, 1)
deco = sample(1:3, 1)
count; deco
if (deco == 1) {
  for (i in 1:count) {
    print("*")
  }
} else if (deco == 2) {
  for (i in 1:count) {
    print("$")
  }
} else {
  for (i in 1:count) {
    print("#")
  }
}

# 문제4
score = sample(1:100, 1)
score = as.character(score)
score
s = switch(score,
       '90'=,'91'=,'92'=,'93'=,'94'=,'95'=,'96'=,'97'=,'98'=,'99'=,'100'='A',
       '80'=,'81'=,'82'=,'83'=,'84'=,'85'=,'86'=,'87'=,'88'=,'89'='B',
       '70'=,'71'=,'72'=,'73'=,'74'=,'75'=,'76'=,'77'=,'78'=,'79'='C',
       '60'=,'61'=,'62'=,'63'=,'64'=,'65'=,'66'=,'67'=,'68'=,'69'='D','F')
cat(score, '점은' , s, '등급입니다.')

# 문제5
alpha = c()
for (i in 1:26) {
  alpha[i] = paste(LETTERS[i], letters[i], sep='')
}
alpha
