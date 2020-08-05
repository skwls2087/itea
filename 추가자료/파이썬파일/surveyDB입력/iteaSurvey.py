# # https://excelsior-cjh.tistory.com/163?category=940399
import pymysql as my
import tensorflow as tf
import numpy as np

w1=np.array([[ 0.05433981, -0.09899105,  0.1792658 ],
 [ 1.1988937,   0.49014348,  0.58012885],
 [ 0.97860974,  0.99183196, -0.7749982 ],
 [-0.16324377, -0.02006133,  0.36267236],
 [-0.27489185, -0.530318,   -1.7877597 ],
 [-0.13633417,  0.2565058,  -0.99903446],
 [ 0.82750463,  0.9385459,   1.53251   ],
 [ 0.11073001,  0.05771202,  0.30695683],
 [ 0.5580178,   0.9252869,  -0.18788747],
 [-0.00598553, -0.06296637, -0.53339565]])
b1=np.array([-0.21315552, -0.32946813,  2.0024884 ])

conn=my.connect(host='203.245.44.103',user='itea2020',password='itea2020**',db='itea2020',charset='utf8')
cur=conn.cursor(my.cursors.DictCursor)

sql='insert into survey(test,result) values(%s,%s)'

for i in range(1000,1024):
    str=bin(i)
    str=str[2:]
    if len(str)!=10:
        for i in range(10-len(str)):
            str='0'+str
    print(str,"의 결과는")
    result=np.array(list(str))
    # result=[float(i) for i in result]
    x = tf.placeholder(tf.float32, [None, 10])
    y = tf.placeholder(tf.int32, [None, 1])
    w = tf.Variable(tf.random_normal([10, 3]))
    b = tf.Variable(tf.random_normal([3]))
    sess=tf.Session()
    sess.run(tf.global_variables_initializer())
    logits = tf.matmul(x, w) + b
    h = tf.nn.softmax(logits)
    sess.run(tf.assign(w, w1))
    sess.run(tf.assign(b, b1))
    r1=sess.run(tf.argmax(h, 1), feed_dict={x: [result]})
    print(r1[0])
    print("***********")
    print(type(str),type(int(r1[0])))
    cur.execute(sql, (str,int(r1[0])))

conn.commit()
conn.close()