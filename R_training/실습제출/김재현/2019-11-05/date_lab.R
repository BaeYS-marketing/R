# 문제1
Bday <-as.Date("1990-07-02")
weekdays(Bday)

# 문제2
Sys.Date() - Bday
#10718일 되었음

# 문제3
weekdays(as.Date("2019-12-25"))
as.POSIXlt("2019-12-25")$wday

# 문제4
weekdays(as.Date("2020-01-01"))

# 문제5
today <- Sys.Date()
a <- format(today, "%Y년 %m월 %d일 %A")
cat("오늘은 ", a, "입니다.", sep = "" )

# 문제6
emp <- read.csv(file = "c:/Rstudy/data/emp.csv", stringsAsFactors = F)

c <- NULL
for(i in 1:14){
  a <- format(as.Date(emp[i,5]), "%Y")
  c <- c(c, a)
}
print(c)
