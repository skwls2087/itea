import time
import requests
from bs4 import BeautifulSoup
def getInfo(durl):
    r1=requests.get(durl)
    dom1=BeautifulSoup(r1.text,"html.parser")
    header = dom1.find('header', {'class': 'view'})
    if header == None:
        headers = dom1.find_all('header')
        header = headers[1]
    title = header.find('h1').text
    print(title)
    temp1=[]
    temp1.append(title)
    '{}\n'.format(temp1)
  #  drr = dom1.find('article', {'class': 'view'})
    #ps = drr.find_all('p')
    #for p in ps:
    #    t2 = p.text.strip()
    #    temp1.append(t2)
    #contents = ' '.join(temp1)
    #print(contents)
    #print('-' * 30)

    with open('data/inews24title4.txt', 'a', encoding='utf-8') as f:
          f.write('{}\n'.format(temp1))
#-------------------------------------------------------------------------
url='http://www.inews24.com/'
recvd=requests.get(url)
# print(recvd)
whole_source = ""
for page_number in range(1, 42+1):
	URL = 'http://www.inews24.com/list/it?date=202004&page=' + str(page_number)
	response = requests.get(URL)
	whole_source = whole_source + response.text
dom = BeautifulSoup(whole_source, 'html.parser')
div1=dom.select('li.list')
#print(div1)
for d in div1:
    durl = d.find('a')['href']
    durl = "http://www.inews24.com" +durl
    #print(durl)
    result=getInfo(durl)






