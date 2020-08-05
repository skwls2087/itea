import time
import requests
from bs4 import BeautifulSoup
def getInfo(durl):
    r1=requests.get(durl)
    dom1=BeautifulSoup(r1.text,"html.parser")
    header = dom1.find('header', {'class': 'article_header'})
    if header == None:
        headers = dom1.find_all('header')
        header = headers[1]
    title = header.find('h2').text
    print(title)
    temp1=[]
    temp1.append(title)
    '{}\n'.format(temp1)
    drr = dom1.find('section', {'class': 'article_body'})
    h3 = drr.find('h3')
    temp1.append(h3)
    '{}\n'.format(temp1)
    #ps = drr.find_all('p')
    #for p in ps:
    #    t2 = p.text.strip()
    #    temp1.append(t2)
    # print(temp1)
    # print('-' * 30)
    with open('data/etnewstitle.txt', 'a', encoding='utf-8') as f:
          f.write('{}\n'.format(temp1))
#-------------------------------------------------------------------------
url='https://www.etnews.com/'
recvd=requests.get(url)
#print(recvd)
whole_source = ""
for page_number in range(1, 10+1):
	URL = 'https://www.etnews.com/news/hot_content_list.html?page=' + str(page_number)
	response = requests.get(URL)
	whole_source = whole_source + response.text
dom = BeautifulSoup(whole_source, 'html.parser')
div1=dom.select('dl.clearfix')
#print(div1)
for d in div1:
    durl = d.find('a')['href']
    durl=durl.replace('//','')
    durl = "https://"+durl
    #print(durl)
    result=getInfo(durl)




