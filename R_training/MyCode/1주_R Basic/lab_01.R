

#문제1

v1 <- 1:10
v1
v2 <- v1*2
v2

max_v<-max(v2)
min_v<-min(v2)
avg_v<-mean(v2)
sum_v<-sum(v2)

v3<-v2[-5]

v1;v2;v3; max_v; min_v; avg_v; sum_v



#문제3
a<-seq(1,10,2)
a

b<-rep(1,5)
b

c<-rep(c(1,2,3), time=3)
c

d<-rep(c(1,2,3,4), each=2)
d



#문제4
v3<-seq(1,10,3)
v3
names(v3)<-LETTERS[1:4]
v3



#문제5
count<- sample(1:100,7)   #smaple(?,?, replace=T __중복허용)

week.name<-c('월요일','화요일',"수요일","목요일",
             "금요일","토요일","일요일")

names(count)<-week.name
count

which.max(count)

names(which.max(count))
names(which.min(count))

names(count[which(count>50)])   


a<- c(5,6,7)
names(a)  <-c('q','w','e')
a
a[1]
a['q']
names(a[1])   #names(백터 주소) 즉 ,,, names(인덱싱)


##짝꿍
week.name[which.max(count)]


#심화 문제
which.max(count)
#paste함수
paste(week.name,count, sep = " : ")

paste(week.name[which(count>50)],count[count>50], sep = " : ")


paste(week.name[which(count>50)],count[count>50], sep = " : ",
      collapse = " / ")



paste(names(count[count>50]), count[count>50], sep = ' : ', 
      collapse = ' / ')

#collapse : 모든 것을 하나의 문장으로 (붕괴)




#문제6 sort
aa<-sample(1:100,5)
aa
sort(aa)
order(aa)
aa[order(aa)]

sort(aa, decreasing = T)



#문제7
t<-c(10,'자동형변환',T)
class(t)
typeof(t)

t2<-10.2
class(t2)
typeof(t2)



#문제8  인덱싱 주소와 값 
p<- sample(1:100,5)
p
p[p>14]
p>14
which(p>14)
which.min(p)
p[which.min(p)]


'해설'
#백터[ ] _ 인덱싱  : 안에 조건식 -> 조건식에 맞는 값 출력
#백터[  ]  _  인덱싱 :  안에 주소 -> 주소 해당 값 출력
#names(백터) : 백터 값에 해당되는 이름 출력
#백터 + 연산조건 : T / F 논리형으로 출력
# order(), which() 함수는 주소 출력 ( != 값 출력)




#문제9  NULL , NA
print('NULL은 객체 없다, 데이터셋이 없다.
      ex _ max(p) ...NULL  _  p정의 안되있음')
print('NA은 객체 안 결측치 존재, 데이터셋 안에 결측치 존재')



#문제10  vector, matrix, array  vs data.frame
print("모두 서로 같은 데이터타입 vs 칼럼 단위 동일한 데이터타입")



#문제11  반복   주의) 논리형일 때
m<- sample(1:100,6)
m
m[c(1,3,4,6)]
m[c(T,F,F,T)]


m[m>5 & m<18]
m[5<m<18]



