import time
import requests
from bs4 import BeautifulSoup
def getInfo(durl):
    r1=requests.get(durl)
    dom1=BeautifulSoup(r1.text,"html.parser")
    title = dom1.find('h3', {'class': 'node_title default_font color_orange node_title_fh font_bold cb'})
    print(title)
    temp1=[]
    temp1.append(title)
    '{}\n'.format(temp1)
    #div = dom1.select('div.node_body.cb')
    #for p in div:
     #   t2 = p.text.strip()
      #  temp1.append(t2)
    #print(temp1)
    #print('-' * 30)

    with open('data/ciokoreatitle4.txt', 'a', encoding='utf-8') as f:
          f.write('{}\n'.format(temp1))
#-------------------------------------------------------------------------
url='http://www.ciokorea.com/'
recvd=requests.get(url)
#print(recvd)
whole_source = ""
for page_number in range(72, 97+1):
	URL = 'http://www.ciokorea.com/news?page=' + str(page_number)
	response = requests.get(URL)
	whole_source = whole_source + response.text
dom = BeautifulSoup(whole_source, 'html.parser')
h4 = dom.find_all('h4')
#print(h4)
for d in h4:
    durl=d.find('a')['href']
    durl='http://www.ciokorea.com'+durl
    #print(durl)
    result=getInfo(durl)





