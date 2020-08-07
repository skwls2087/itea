import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
# https://archive.ics.uci.edu/ml/machine-learning-databases/zoo/
# data=np.loadtxt('data\\zoo\\zoo.csv',delimiter=',',dtype=np.float32)
# print(data.shape) #(101, 17)
# xdata=data[:,:-1]
# ydata=data[:,[-1]]
# # print(xdata.shape) #(101,16)
# # print(ydata.shape) #(101,1)
# # #16개의 데이터를 읽어서 0~6번사이의 값으로 나와야 함.
# #식  h=w1x1+...x16+x16+b
# x=tf.placeholder(tf.float32,[None,16])
# # y=tf.placeholder(tf.float32,[None,7])
# y=tf.placeholder(tf.int32,[None,1])
# w=tf.Variable(tf.random_normal([16,7]))
# b=tf.Variable(tf.random_normal([7]))
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
# #     #one_hot으로 변경
#     onehot=tf.one_hot(y,7)
# #     print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
#     onehot=tf.reshape(onehot,[-1,7]) #형 축소
#     print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
#     logits=tf.matmul(x,w)+b
#     h=tf.nn.softmax(logits)
#     cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
#         logits=logits,labels=onehot
#     ))
#     train=tf.train.GradientDescentOptimizer(0.7).minimize(cost)
#     for i in range(2001):
#         sess.run(train,feed_dict={x:xdata,y:ydata})
#         if i%100==0:
#             print(i,sess.run(cost,feed_dict={x:xdata,y:ydata}))
#     #평가하기
#     corr=tf.equal(tf.argmax(h,1),tf.argmax(onehot,1))
#     acc=tf.reduce_mean(tf.cast(corr,tf.float32))
#     print('정확도',sess.run(acc,feed_dict={x:xdata,y:ydata}))
#     #검증하기
#     print('예측값',sess.run(tf.argmax(h,1),feed_dict={x:[[0,0,0,1,0,1,0,1,1,0,0,1,0,1,1,0]]}))
#     print('예측값', sess.run(tf.argmax(h, 1), feed_dict={x: [[0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,0]]}))

#====
# #
# data=np.loadtxt('data\\itea222222.csv',delimiter=',',dtype=np.float32,skiprows=True)
# print(data.shape) #(483, 18)
# xdata=data[:,:-1]
# ydata=data[:,[-1]]
# print(xdata.shape) #(483, 17)
# print(ydata.shape) #(483, 1)
# #17개의 데이터를 읽어서 0~4번사이의 값으로 나와야 함.
# #식  h=w1x1+...x17+x17+b
# x=tf.placeholder(tf.float32,[None,10])
# # y=tf.placeholder(tf.float32,[None,17])
# y=tf.placeholder(tf.int32,[None,1])
# w=tf.Variable(tf.random_normal([10,3]))
# b=tf.Variable(tf.random_normal([3]))
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
# #     #one_hot으로 변경
#     onehot=tf.one_hot(y,3)
#     # print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
#     onehot=tf.reshape(onehot,[-1,3]) #형 축소
#     # print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
#     logits=tf.matmul(x,w)+b
#     h=tf.nn.softmax(logits)
#     cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
#         logits=logits,labels=onehot
#     ))
#     train=tf.train.GradientDescentOptimizer(0.0095).minimize(cost)
#     for i in range(5001):
#         sess.run(train,feed_dict={x:xdata,y:ydata})
#         if i%500==0:
#             print(i,sess.run(cost,feed_dict={x:xdata,y:ydata}))
# # #     #평가하기
#     corr=tf.equal(tf.argmax(h,1),tf.argmax(onehot,1))
#     acc=tf.reduce_mean(tf.cast(corr,tf.float32))
#     print('정확도',sess.run(acc,feed_dict={x:xdata,y:ydata}))
# # # # #     #검증하기
# # # # #     print('예측값',sess.run(tf.argmax(h,1),feed_dict={x:[[0,0,0,1,0,1,0,1,1,0,0,1,0,1,1,0]]}))
# # # # #     print('예측값', sess.run(tf.argmax(h, 1), feed_dict={x: [[0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,0]]}))

#======================
# data=np.loadtxt('data\\ITEA111_FINAL.csv',delimiter=',',dtype=np.float32,skiprows=True)
# print(data.shape) #(524, 18)
# xdata=data[:,:-1]
# ydata=data[:,[-1]]
# print(xdata.shape) #(524, 17)
# print(ydata.shape) #(524, 1)
# # #10개의 데이터를 읽어서 0~2번사이의 값으로 나와야 함.
# # #식  h=w1x1+...x17+x17+b
# x=tf.placeholder(tf.float32,[None,10])
# # y=tf.placeholder(tf.float32,[None,17])
# y=tf.placeholder(tf.int32,[None,1])
# w=tf.Variable(tf.random_normal([10,3]))
# b=tf.Variable(tf.random_normal([3]))
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
# #     #one_hot으로 변경
#     onehot=tf.one_hot(y,3)
#     # print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
#     onehot=tf.reshape(onehot,[-1,3]) #형 축소
#     # print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
#     logits=tf.matmul(x,w)+b
#     h=tf.nn.softmax(logits)
#     cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
#         logits=logits,labels=onehot
#     ))
#     train=tf.train.GradientDescentOptimizer(0.0095).minimize(cost)
#     for i in range(5001):
#         sess.run(train,feed_dict={x:xdata,y:ydata})
#         if i%500==0:
#             print(i,sess.run(cost,feed_dict={x:xdata,y:ydata}))
#     print(w)
# # # # # #     #평가하기
#     corr=tf.equal(tf.argmax(h,1),tf.argmax(onehot,1))
#     acc=tf.reduce_mean(tf.cast(corr,tf.float32))
#     print('정확도',sess.run(acc,feed_dict={x:xdata,y:ydata}))
# # # # # # #     #검증하기
#     print('예측값',sess.run(tf.argmax(h,1),feed_dict={x:[[0,0,0,1,1,1,0,1,0,0]]}))
# # # # # #     print('예측값', sess.run(tf.argmax(h, 1), feed_dict={x: [[0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,0]]}))


#==
# data=np.loadtxt('data\\ITEA111_FINAL.csv',delimiter=',',dtype=np.float32,skiprows=True)
# print(data.shape) #(524, 18)
# xdata=data[:,:-1]
# ydata=data[:,[-1]]
# print(xdata.shape) #(524, 17)
# print(ydata.shape) #(524, 1)
# # #10개의 데이터를 읽어서 0~2번사이의 값으로 나와야 함.
# # #식  h=w1x1+...x17+x17+b
# x=tf.placeholder(tf.float32,[None,10])
# # y=tf.placeholder(tf.float32,[None,17])
# y=tf.placeholder(tf.int32,[None,1])
# w=tf.Variable(tf.random_normal([10,3]))
# b=tf.Variable(tf.random_normal([3]))
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     #one_hot으로 변경
#     onehot=tf.one_hot(y,3)
#     # print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
#     onehot=tf.reshape(onehot,[-1,3]) #형 축소
#     # print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
#     logits=tf.matmul(x,w)+b
#     h=tf.nn.softmax(logits)
#     cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
#         logits=logits,labels=onehot
#     ))
#     train=tf.train.GradientDescentOptimizer(0.0095).minimize(cost)
#     for i in range(50001):
#         sess.run(train,feed_dict={x:xdata,y:ydata})
#         if i%5000==0:
#             print(i,sess.run(cost,feed_dict={x:xdata,y:ydata}))
#     # print(w)
# # # # # #     #평가하기
#     corr=tf.equal(tf.argmax(h,1),tf.argmax(onehot,1))
#     acc=tf.reduce_mean(tf.cast(corr,tf.float32))
#     print('정확도',sess.run(acc,feed_dict={x:xdata,y:ydata}))
# # # # # # #     #검증하기
#     print('예측값',sess.run(tf.argmax(h,1),feed_dict={x:[[0,1,0,1,1,1,1,1,1,1]]}))
# # # # # #     print('예측값', sess.run(tf.argmax(h, 1), feed_dict={x: [[0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,0]]}))

#=====
# # https://excelsior-cjh.tistory.com/163?category=940399
import tensorflow as tf
import matplotlib.pyplot as plt
import random

data=np.loadtxt('data\\ITEA111_FINAL.csv',delimiter=',',dtype=np.float32,skiprows=True)
print(data.shape) #(524, 18)
xdata=data[:,:-1]
ydata=data[:,[-1]]
print(xdata.shape) #(524, 17)
print(ydata.shape) #(524, 1)
# #10개의 데이터를 읽어서 0~2번사이의 값으로 나와야 함.
# #식  h=w1x1+...x17+x17+b
x=tf.placeholder(tf.float32,[None,10])
# y=tf.placeholder(tf.float32,[None,17])
y=tf.placeholder(tf.int32,[None,1])
w=tf.Variable(tf.random_normal([10,3]))
b=tf.Variable(tf.random_normal([3]))

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    #one_hot으로 변경
    onehot=tf.one_hot(y,3)
    # print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
    onehot=tf.reshape(onehot,[-1,3]) #형 축소
    # print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
    logits=tf.matmul(x,w)+b
    h=tf.nn.softmax(logits)
    cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
        logits=logits,labels=onehot
    ))
    train=tf.train.GradientDescentOptimizer(0.0095).minimize(cost)
    for i in range(1000):
        sess.run(train,feed_dict={x:xdata,y:ydata})
        if i%500==0:
            print(i,sess.run(cost,feed_dict={x:xdata,y:ydata}))
    print('기울기',sess.run(w))
    print('절편',sess.run(b))
    corr = tf.equal(tf.argmax(h, 1), tf.argmax(onehot, 1))
    acc=tf.reduce_mean(tf.cast(corr,tf.float32))
    print('정확도',sess.run(acc,feed_dict={x:xdata,y:ydata}))
#     # # # # # # #     #검증하기
    print('예측값',sess.run(tf.argmax(h,1),feed_dict={x:[[1,1,1,1,1,1,1,1,1,1]]}))
# # # # # # ---------------------------------
#     w1=sess.run(w)
#     b1=sess.run(b)
#     print('최적화')
#     np.savez('m1\\test',w=w1,b=b1)

# ---------------------------------
# import numpy as np
# wb=np.load('m1\\test.npz')
# # print(wb.files)
# # print(wb['w'].shape)
# # print(wb['w'])
# # print('-'*30)
# # print(wb['b'])
# data = np.loadtxt('data\\ITEA111_FINAL.csv', delimiter=',', dtype=np.float32, skiprows=True)
# xdata=data[:,:-1]
# ydata=data[:,[-1]]
# #10개의 데이터를 읽어서 0~2번사이의 값으로 나와야 함.
# #식  h=w1x1+...x17+x17+b
# x=tf.placeholder(tf.float32,[None,10])
# # # y=tf.placeholder(tf.float32,[None,17])
# y=tf.placeholder(tf.int32,[None,1])
# w=tf.Variable(tf.random_normal([10,3]))
# b=tf.Variable(tf.random_normal([3]))
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     #one_hot으로 변경
#     onehot=tf.one_hot(y,3)
#     # print('onehot변경',sess.run(onehot,feed_dict={y:ydata}))
#     onehot=tf.reshape(onehot,[-1,3]) #형 축소
#     # print('onehot 차원변경', sess.run(onehot, feed_dict={y: ydata}))
#     logits=tf.matmul(x,w)+b
#     h=tf.nn.softmax(logits)
#     cost=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(
#         logits=logits,labels=onehot
#     ))
#     train=tf.train.GradientDescentOptimizer(0.0095).minimize(cost)
#     sess.run(tf.assign(w,wb['w']))
#     sess.run(tf.assign(b,wb['b']))
#     sess.run(cost, feed_dict={x: xdata, y: ydata})
#  # #     #평가하기
#     corr=tf.equal(tf.argmax(h,1),tf.argmax(onehot,1))
#     acc=tf.reduce_mean(tf.cast(corr,tf.float32))
#     print('정확도', sess.run(acc, feed_dict={x: xdata, y: ydata}))
#  # #     #검증하기
#     print(sess.run(tf.argmax(h,1),feed_dict={x:[[0,0,0,0,0,0,0,0,0,0]]}))

##==
# https://excelsior-cjh.tistory.com/163?category=940399
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
import matplotlib.pyplot as plt
import random
#
# #   세션 생성
# sess = tf.Session()
#
# #   데이터 불러오기
# mnist = input_data.read_data_sets("../mnist/data/", one_hot=True)
# data = np.loadtxt('data\\ITEA111_FINAL.csv', delimiter=',', dtype=np.float32, skiprows=True)
# #   변수 생성
# x = tf.placeholder(tf.float32, [None, 784])
# Y = tf.placeholder(tf.float32, [None, 10])
# W = tf.Variable(tf.random_normal([784, 10]))
# b = tf.Variable(tf.random_normal([10]))
#
# #   모델 생성
# model = tf.nn.softmax(tf.matmul(x, W) + b)
#
# #   손실함수 지정
# loss = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(model), axis=1))
#
# #   알고리즘 최적화
# optimizer = tf.train.GradientDescentOptimizer(0.5)
# train = optimizer.minimize(loss)
#
# #   변수 초기화
# init = tf.global_variables_initializer()
# sess.run(init)
#
# #   학습
# for i in range(1000):
#   batch_xs, batch_ys = mnist.train.next_batch(100)
#   sess.run(train, feed_dict={x: batch_xs, Y : batch_ys})
# # ---------------------------------
# import numpy as np
# w1=sess.run(W)
# b1=sess.run(b)
# print('최적화')
# np.savez('m1\\test',w=w1,b=b1)

# ---------------------------------
# import numpy as np
# wb=np.load('m1\\test.npz')
# print(wb.files)
# print(wb['w'].shape)
# print(wb['w'])
# print('-'*30)
# print(wb['b'])
# # mnist = input_data.read_data_sets("../mnist/data/", one_hot=True)
# # #
# # # #   변수 생성
# # x = tf.placeholder(tf.float32, [None, 784])
# # Y = tf.placeholder(tf.float32, [None, 10])
# # W = tf.Variable(tf.random_normal([784, 10]))
# # b = tf.Variable(tf.random_normal([10]))
# # # #
# # # # #   모델 생성
# # model = tf.nn.softmax(tf.matmul(x, W) + b)
# # # #
# # # #   손실함수 지정
# # loss = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(model), axis=1))
# # #
# # # #   알고리즘 최적화
# # optimizer = tf.train.GradientDescentOptimizer(0.5)
# # train = optimizer.minimize(loss)
# # # #   세션 생성
# # sess = tf.Session()
# # #   변수 초기화
# # init = tf.global_variables_initializer()
# # sess.run(init)
# # sess.run(tf.assign(W,wb['w']))
# # sess.run(tf.assign(b,wb['b']))
# # # # #   평가하기
# # correct_prediction = tf.equal(tf.argmax(model,1), tf.argmax(Y, 1))
# # accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
# # print(sess.run(accuracy, feed_dict={x: mnist.test.images, Y : mnist.test.labels}))
# # #
# # # #   검증하기
# # r = random.randint(0, mnist.test.num_examples - 1)
# # print("실제값: ", sess.run(tf.argmax(mnist.test.labels[r:r + 1], 1)))
# # print("예측값: ", sess.run(tf.argmax(model, 1), feed_dict={x: mnist.test.images[r:r + 1]}))
# # plt.imshow(mnist.test.images[r:r + 1].reshape(28, 28), cmap='Greys', interpolation='nearest')
# # plt.show()
# #
# # # https://excelsior-cjh.tistory.com/179