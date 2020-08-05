from konlpy.tag import Okt
text=open('data\\iteanewstitle1.txt',encoding='utf-8').read()
text=text.split('\n')
# print(len(text))
okt=Okt()
# temp = []
# for line in text:
#       malist=okt.pos(line,norm=True,stem=True)
#       print(malist)
      # for word in malist:
      #    if word[1] not in ['Josa','Suffix','Foreign','Modifier','Alpha','Punctuation','KoreanParticle','URL','Hashtag']:
      #        temp.append(word[0])
# print(len(temp),temp)
# print(' '.join(temp))
# with open('data\\iteanewstitle1.gubun','w',encoding='utf-8') as f:
#          f.write(' '.join(temp))
# 모델생성==============
from gensim.models import word2vec
# # # # # 파일 읽기
# text=word2vec.Text8Corpus('data\\iteanewstitle1.gubun')
# # # # # 모델생성
# model=word2vec.Word2Vec(text,window=5,sg=1,size=100)
# # # # # 모델저장
# model.save('data\\iteanewstitle1.model')
# # #============================
model=word2vec.Word2Vec.load('data\\iteanewstitle1.model')
# # 유사어
result=model.wv.most_similar(positive=['보안'])
for r in result:
  print(r)