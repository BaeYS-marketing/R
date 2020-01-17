# 히스토그램
'barplot과 다른 점은 막대그래프는 각각의 항목마다 할당되는 값을 막대로 표현하는 것 

각 항목의 구간을 나눠서 거기에 속하는 데이터가 몇개냐를 그래프로 표현
주로 연속형 데이터의 구간을 나눠서 그래프를 그린다. '
dev.off()
                                                  #구간 5개 : 근데 프로그램 판단하에 달라질 수 이다.
                                                  #break 디폴트 : 알고리즘에 따라 자동으로 계산
hist(성적$국어, main="성적분포-국어", xlab="점수", breaks=5, col = "lightblue", border = "pink")
hist(성적$수학, main="성적분포-수학", xlab="점수", col = "lightblue", border = "pink")
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col(x = x)=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
hist(nums)
hist(nums, breaks=c(0,10,20,30,40,50,60,70,80,90,100))
hist(nums, breaks=c(0,50,100))     # probability =F 아규먼트 _ frequnecy  f: density
hist(nums, breaks=c(0,33,66,100))  #균등하게 break 되지 않으면 상대도수(density)로 출력된다.


(score <- sample(0:100, 30))
barplot(score)
hist(score)
hist(score, breaks=10)
hist(score, breaks=2) #?
hist(score, breaks=3) #? 
hist(score, breaks=4) #? 
hist(score, breaks=5) #?
hist(score, breaks=6) #? 
hist(score, breaks=7) #? 
hist(score, breaks=8) #? 
hist(score, breaks=9) #?   구간을 정하는 것
hist(score, breaks=c(0,20,30,40,50,100))    #나누는 구분을 지정하는 것 : 이건 프로그램도 군말없다. 


# 추세선 추가
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="학생수", col=rainbow(12), border = "pink")
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col=rainbow(12), border = "pink",prob=T)
lines(density(성적$국어, bw=0.5), col="red", lwd=3)   #lines를 통한 추세선 그리기 
lines(density(성적$국어, bw=1.0), col="blue", lwd=3)






# 박스플롯  : summary의 시각화 
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적")
summary(성적$수학)
summary(성적$국어)

성적2 <- 성적[,3:5]  
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")  #칼럼이 3개니까 박스플롯도 3개

data <- read.table("온도.txt", header=TRUE, sep=",")  #sep = ','로 해서 read.csv를 안써도 읽을 수 있었다. 
head(data, n=5); 
boxplot(data)
boxplot(data, las = 2)  #세로로 출력 !  las 아규먼트 기억!
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))

#색 반복 되게 알고리즘 
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)

#그리드 함수
grid(col="gray", lty=2, lwd=1)   #lwd : 두께

rainbow()
heat.colors()
terrain.colors()
topo.colors()
cm.colors()
gray.colors()