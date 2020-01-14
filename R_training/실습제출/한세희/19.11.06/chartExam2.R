

# chartExam2.R
# 문제1
mpg <- ggplot2::mpg
mpgdata <- mpg %>% select(cty, hwy)
str(mpgdata)

plot(mpgdata, xlab="도시연비", ylab="고속도로연비", pch=3)

# 문제2 --------왜 가로 레이블 이렇게 나옴?
mpgdata2 <- mpg %>% group_by(drv) %>% summarise(num=n())
str(mpgdata2)
par(mar=c(7,7,7,7), mfrow=c(1,1))
barplot(as.matrix(mpgdata2$num), xlab=mpgdata2$drv, beside=T,
        col=c("red", "green", "blue"))


# 문제3
mpgdata3 <- mpg %>% group_by(manufacturer) %>% select(manufacturer,hwy)
str(mpgdata3)
as.data.frame(mpgdata3)

hist(as.matrix(mpgdata3$hwy))


hist(성적$국어, main="성적분포-국어", xlab="점수",
       breaks=5, col = "lightblue", border = "pink")
# breaks=5: 5개 구간으로 나눠서 보여줘
hist(성적$수학, main="성적분포-수학", xlab="점수", 
       col = "lightblue", border = "pink")
# breaks: 따로 안 주면 알아서 정해진 계산법에 의해 알아서 계산.
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", 
       col=rainbow(12), border = "pink")
