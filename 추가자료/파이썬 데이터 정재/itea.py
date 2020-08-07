import nltk
import numpy as np
import pandas as pd
from collections import Counter
import matplotlib.pyplot as plt
text=open('data\\dbworkedwith.csv').read()
words=text.split(';')
# print(words)
temp=[]
for word in words:
    word=word.split('\n')
    # print(word)
    for i in word:
       i=i.split(',')
       i=str(i)
       # print(i)
       temp.append(i)
# print(temp)
cnt=Counter(temp)
del(cnt["['NA']"])
# print(type(cnt))
# print(cnt.values())
# print(cnt.keys())
# print(cnt.items())
# def f1(x):
#     return x[1]
# res=sorted(cnt.items(),key=(lambda x:x[1]))
# res=dict(res)
# print(cnt)
res=cnt

print('사용하는 DB=',res)

#------------------------------------------------------------------
text1=open('data\\dbnextyear.csv').read()
words1=text1.split(';')
# print(words)
temp1=[]
for word1 in words1:
    word1=word1.split('\n')
    # print(word)
    for j in word1:
       j=j.split(',')
       j=str(j)
       # print(i)
       temp1.append(j)
# print(temp1)
cnt1=Counter(temp1)
del(cnt1["['NA']"])
# def f2(x):
#     return x[1]
# res1=sorted(cnt1.items(),key=(lambda x:x[1]))
# res1=dict(res1)
# res1=cnt1
# print(res1)
res1=cnt1


print('배우고싶은 DB=',res1)


plt.barh(list(res.keys()),list(res.values()))
plt.barh(list(res1.keys()),list(res1.values()))
# plt.show()
#----------------------------------------------------------------
text1=open('data\\Languageworkedwith.csv').read()
words1=text1.split(';')
# print(words)
temp1=[]
for word1 in words1:
    word1=word1.split('\n')
    # print(word)
    for j in word1:
       j=j.split(',')
       j=str(j)
       # print(i)
       temp1.append(j)
# print(temp1)
cnt2=Counter(temp1)
del(cnt2["['NA']"])
print('사용하는 언어=',cnt2)

#------------------------------
text1=open('data\\Languagenextyear.csv').read()
words1=text1.split(';')
# print(words)
temp1=[]
for word1 in words1:
    word1=word1.split('\n')
    # print(word)
    for j in word1:
       j=j.split(',')
       j=str(j)
       # print(i)
       temp1.append(j)
# print(temp1)
cnt3=Counter(temp1)
del(cnt3["['NA']"])
print('배우고 싶은 언어=',cnt3)
#-----------------------------------------------
# text1=pd.read_csv('data\\age.csv')
# text1=np.loadtxt('data\\age.csv')
text1=open('data\\age.csv').read()
# print(text1)
words=text1.split('\n')
# print(words)
temp20=[]
temp30=[]
temp40=[]
temp50=[]
temp60=[]
temp70=[]
temp80=[]
for word in words:
    if word[0] == '2':
        temp20.append(word)

for word in words:
    if word[0] == '3':
        temp30.append(word)

for word in words:
    if word[0] == '4':
        temp40.append(word)

for word in words:
    if word[0] == '5':
        temp50.append(word)

for word in words:
    if word[0] == '6':
        temp60.append(word)
for word in words:
    if word[0] == '7':
        temp70.append(word)

for word in words:
    if word[0] == '8':
        temp80.append(word)
temp20=Counter(temp20)
temp30=Counter(temp30)
temp40=Counter(temp40)
temp50=Counter(temp50)
temp60=Counter(temp60)
temp70=Counter(temp70)
temp80=Counter(temp80)
print('20대=',sum(temp20.values()))
print('30대=',sum(temp30.values()))
print('40대=',sum(temp40.values()))
print('50대=',sum(temp50.values()))
print('60대=',sum(temp60.values()))
print('70대=',sum(temp70.values()))
print('80대=',sum(temp80.values()))
# cnt4=Counter(words)
# del(cnt4["NA"])
# print("나이=",cnt4)


# if (cnt4.key()==20 or cnt4.key()==21 or cnt4.key()==22 or cnt4.key()==23 or cnt4.key()==24 or cnt4.key()==25 or
#     cnt4.key()==26 or cnt4.key() == 27 or cnt4.key()==28 or cnt4.key()==29):
#     cnt4.values(20)

#-----------------------
text1=open('data\\newjobhunt.csv').read()
# print(text1)
words1=text1.split(';')
# print(words)
temp1=[]
for word1 in words1:
    word1=word1.split('\n')
    # print(word)
    for j in word1:
       j=j.split(',')
       j=str(j)
       # print(i)
       temp1.append(j)
# print(temp1)
cnt4=Counter(temp1)
del(cnt4["['NA']"])
print('퇴사사유=',cnt4)
#---------------------------------------------
text1=open('data\\gender.csv').read()
words=text1.split('\n')
# print(words)
cnt=Counter(words)
print('성별=',cnt)

