
unico = POST('http://unico2013.dothome.co.kr/crawling/post.php'
             ,encode='form', body=list(name='승현', age = '27'))
a = html_nodes(read_html(unico), 'h1')
b = html_text(a)
b

