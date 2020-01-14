url = "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text = read_html(url)

h1 = html_nodes(text, 'h1')
h1_text = html_text(h1)
h1_text

a = html_nodes(text, 'a')
a_text = html_text(a)
a_href = html_attr(a, 'href')
a_text
a_href

img = html_nodes(text, 'img')
img_src = html_attr(img, 'src')
img_src

h2_1 = html_nodes(text, 'h2:nth-of-type(1)')
h2_1_text = html_text(h2_1)
h2_1_text

ul_green = html_nodes(text, 'ul > [style$=green]')
html_text(ul_green)

h2_2 = html_nodes(text, 'h2:nth-of-type(2)')
h2_2_text = html_text(h2_2)
h2_2_text

ol_text = html_text(html_nodes(text, 'ol > *'))  # 자식
ol_text

table_text = html_text(html_nodes(text, 'table *'))  # 자손
table_text

tr_name = html_nodes(text, 'tr.name')
html_text(tr_name)

td_target = html_nodes(text, 'td#target')
html_text(td_target)
