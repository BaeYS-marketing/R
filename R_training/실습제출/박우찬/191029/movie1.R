library(rvest)

ur3 = 'https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen'
text = read_html(ur3)

#평점
rating = html_text(html_nodes(text,' div.raking_grade > em'))

#리뷰
nodes = html_nodes(text, 'div > p')
review = html_text(nodes, trim = TRUE)
review = gsub('\t',"",review)
review = gsub('[\r\n]',"",review)
review = gsub('\n',"",review)
review = gsub('신고',"",review)

page = data.frame('고객평점' = rating, '리뷰' = review)
write.csv(page, 'daummovie1.csv')



