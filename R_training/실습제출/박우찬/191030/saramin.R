library(rvest)
library(httr)
http.standard = GET('http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST')

tech_name = html_nodes(read_html(http.standard), 'li> label > span.txt')
tech_name = html_text(tech_name)
tech_name = gsub('#',"",tech_name)
tech_name = gsub('다른 필터항목 보기',"",tech_name)
tech_name = tech_name[nchar(tech_name)>0]
tech_name


info_count = html_nodes(read_html(http.standard), 'label > span.count')
info_count = html_text(info_count)
info_count = gsub('[()]',"",info_count)
info_count

result = data.frame(tech_name, info_count)

write.csv(result, 'saramin.csv')
