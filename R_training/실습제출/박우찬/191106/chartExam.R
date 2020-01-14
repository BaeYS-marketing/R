log = read.table('C:/Rstudy/product_click.log')
names(log) = c('시간','제품')
table(log$제품)

par(mar=c(5,5,5,5), mfrow=c(2,2))
png(filename="chartExam1.png", height=400, width=700, bg="white")
# Q.1

barplot(table(log$제품), main="세로바그래프실습", xlab="상품ID", ylab="출력수", col=terrain.colors(10))
dev.off()
# Q.2
png(filename="chartExam2.png", height=400, width=700, bg="white")
log$시간 = as.character(log$시간)
log$시간 = strptime(log$시간,"%Y%m%d%H%M")
log_date = format(log$시간, '%H')
log_date = as.numeric(unlist(log_date))
log_legend = as.data.frame(table(log_date))$log_date
log_legend = as.numeric((levels(log_legend)))

  
pie(table(log_data),main="파이그래프 실습", label = paste(log_legend,'~',log_legend+1), col=rainbow(10),radius = 1)
dev.off()
