from konlpy.tag import Komoran,Okt
from wordcloud import WordCloud
import matplotlib.pyplot as plt
from PIL import Image
import numpy as np
with open('data\\iteanewstitle4.txt','r',encoding='utf-8') as f:
     itea=f.read()
#print(itea)
#====워드클라우드==========================
# img=Image.open('img//alice.jpg')
# mask=np.array(img)
#komoran=Komoran()
#okt=Okt()
#nouns=okt.nouns(itea)
#nouns=komoran.nouns(itea)
#print(len(nouns))
#stopwords=['을','는','외','출시','공개']
#nouns = [n for n in nouns if n not in stopwords]
#print(len(nouns))
#print(nouns)
#data={}
#for n in nouns:
#    if n not in data:
#        data[n]=0
#    data[n]=data[n]+1
#d1=sorted(data.items(),key=lambda x:x[1],reverse=True)
#dic=dict(d1)
#wc=WordCloud(font_path='DoHyeon-Regular.ttf',background_color='white')
#word=wc.generate_from_frequencies(dic)
#plt.imshow(word.recolor(color_func=grey_color_func,random_state=3),interpolation='bilinear')
#plt.axis('off')
#plt.show()
#===단어 빈도수 찾기============================
from konlpy.tag import Okt
from collections import Counter
komoran=Komoran()
okt=Okt()
nouns=okt.nouns(itea)
count = Counter(nouns)
noun_list = count.most_common(50)
for v in noun_list:
    print(v)