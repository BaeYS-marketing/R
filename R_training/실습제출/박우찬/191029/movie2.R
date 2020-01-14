library(rvest)

site = "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page="
movie.review = NULL
for(i in  1:20){
  url = paste(site,i,sep="")
  text = read_html(url)
  nodes = html_nodes(text, 'div.raking_grade > em')
  title = html_text(nodes)
  nodes = html_nodes(text, 'div > p')
  review = html_text(nodes, trim = TRUE)
  review = gsub('\t',"",review)
  review = gsub('[\r\n]',"",review)
  review = gsub('\n',"",review)
  review = gsub('신고',"",review)
  page = data.frame('고객평점' = rating, '리뷰' = review)
  movie.review = rbind(movie.review, page)
}
write.csv(movie.review, 'daummovie2.csv')
