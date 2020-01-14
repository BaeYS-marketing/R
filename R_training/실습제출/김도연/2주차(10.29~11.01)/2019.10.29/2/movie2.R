site = "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
grade.review = NULL
for(i in 1:20){
  url = paste(site, i, sep = "")
  text = read_html(url, encoding = "utf-8")
  # 고객평점
  nodes = html_nodes(text, ".emph_grade")
  grade = html_text(nodes)
  grade
  
  #리뷰
  nodes = html_nodes(text, ".desc_review")
  review = html_text(nodes)
  review
  review = gsub("\t","",review) 
  review = gsub("\r\n","",review)
  review = gsub("\n","",review)
  review = gsub("신고","",review)
  
  page = data.frame(grade, review)
  grade.review = rbind(grade.review, page)
}  
  write.csv(grade.review, "daummovie2.csv")
  


