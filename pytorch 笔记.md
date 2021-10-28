## 维度维数

https://blog.csdn.net/qq_41375609/article/details/106078474

```python
out = torch.ones(2, 3, 4)

print(out)
print(out.size())
print(out.size(0))
print(out.size(1))
print(out.size(2))

# tensor([[[1., 1., 1., 1.],
#          [1., 1., 1., 1.],
#          [1., 1., 1., 1.]],
# 
#         [[1., 1., 1., 1.],
#          [1., 1., 1., 1.],
#          [1., 1., 1., 1.]]])
# torch.Size([2, 3, 4])
# 2
# 3
# 4
```



也就是

```python
[
    [
         [1., 1., 1., 1.],
         [1., 1., 1., 1.],
         [1., 1., 1., 1.]
    ],
 
    [
         [1., 1., 1., 1.],
         [1., 1., 1., 1.],
         [1., 1., 1., 1.]
    ]
]
```



维数：

零维：2，又可以看出，最外层括号包住的括号有 2 对。

1 维：3，次外层包住的括号有 3 对。

2 维：4，最内层元素有 4 个。



嵌套的括号有 3 对，说明维度为 3.

```python
out = torch.ones(2, 3, 4)
sum = out.sum(0)
print(sum)
print(sum.size())

# tensor([[2., 2., 2., 2.],
#         [2., 2., 2., 2.],
#         [2., 2., 2., 2.]])
# torch.Size([3, 4])
```

对 0 维度求和，意味着遍历 i, j, k 里面的 i。





## zero_grad

1. zero_grad() 函数的应用：

根据pytorch中的backward()函数的计算，当网络参量进行反馈时，梯度是被积累的而不是被替换掉；但是在每一个batch时毫无疑问并不需要将两个batch的梯度混合起来累积，因此这里就需要每个batch设置一遍zero_grad 了。

其实这里还可以补充的一点是，如果不是每一个batch就清除掉原有的梯度，而是比如说两个batch再清除掉梯度，这是一种变相提高batch_size的方法，对于计算机硬件不行，但是batch_size可能需要设高的领域比较适合，比如目标检测模型的训练。

  在pytorch中做随机梯度下降时往往会用到zero_grad() 函数，相关代码如下。

```python
optimizer.zero_grad()                       # 将模型的参数梯度初始化为0

outputs=model（inputs）              # 前向传播计算预测值

loss = cost(outputs, y_train)           # 计算当前损失

loss.backward()                               # 反向传播计算梯度

optimizer.step()                               # 更新所有参数   
```

2. zero_grad() 函数的作用： 

根据pytorch中backward() 函数的计算，当网络参量进行反馈时，梯度是累积计算而不是被替换，但在处理每一个batch时并不需要与其他batch的梯度混合起来累积计算，因此需要对每个batch调用一遍zero_grad() 将参数梯度置0.

另外，如果不是处理每个batch清除一次梯度，而是两次或多次再清除一次，相当于提高了batch_size，对硬件要求更高，更适用于需要更高batch_size的情况。



## train

model.eval()，pytorch会自动把BN和DropOut固定住，不会取平均，而是用训练好的值。不然的话，一旦test的batch_size过小，很容易就会被BN层导致生成图片颜色失真极大；在模型测试阶段使用

model.train() 让model变成训练模式，此时 dropout和batch normalization的操作在训练q起到防止网络过拟合的问题

总结： model.train() 和 model.eval() 一般在模型训练和评价的时候会加上这两句，主要是针对由于model 在训练时和评价时 Batch Normalization 和 Dropout 方法模式不同；**因此，在使用PyTorch进行训练和测试时一定注意要把实例化的model指定train/eval；**



[pytorch中的embedding词向量的使用_david0611的博客-CSDN博客_pytorch 词向量](https://blog.csdn.net/david0611/article/details/81090371)



## squeeze & unsqueeze

```python
x = torch.tensor([[[1, 2, 3, 4], [5, 5, 5, 5]]])

#	unsqueeze 在指定位置增加一个维度，其维数为 1（扩充）
#	squeeze 删除某个维数为 1 的维度（压缩）

print(x.size())
#	torch.Size([1, 2, 4])

print(torch.unsqueeze(x, dim=2).size())
#	torch.Size([1, 2, 1, 4])

print(torch.unsqueeze(x, dim=3).size())
#	torch.Size([1, 2, 4, 1])


print(torch.squeeze(x, dim=0).size())
#	torch.Size([2, 4])

```



view

  **print**(x.size())

  **print**(x.view(-1, 1, 2, 4))



## gather

torch.gather(input, dim, index, *, sparse_grad=False, out=None) → Tensor

```python

src = torch.tensor([[1, 2], [3, 4]], dtype=torch.int64)

mask_index = torch.tensor([[1, 1], [1, 0]])

out = torch.gather(src, 0, mask_index)

print(out)

#	tensor([[3, 4], [3, 2]])
```

mask_index 里面的数字用于代替 dim 指定的维度啊

mask_index 的 [[1, 1], [1, 0]]

分别代表索引 [1, 0], [1, 1], [1, 0], [0, 1] 也就索引到 src 的 3, 4, 3, 2

`out[i][j][k] = src[ mask_index[i][j][k] ][j][k]`

也就是说用 mask_index 的数字代替 src 里面相应的维度，得到 src 的值。

遍历 out 的位置，把对应位置的 mask_index 的值 换成 dim 对应的维度，就能计算出 src 要得到的位置，用 src 对应位置去替换 out。

## scatter_

Tensor.scatter_(dim, index, src, reduce=None) → Tensor

```python
src = torch.tensor([[1, 2], [3, 4]], dtype=torch.int64)

out = torch.zeros(2, 2).type(torch.int64)

mask_index = torch.tensor([[1, 1], [1, 0]])

out.scatter_(0, mask_index, src)

print(out)
```

`out[ mask_index[i][j][k] ][j][k] = src[i][j][k]`

遍历 src 的值，把对应位置的 mask_index 的值 换成 dim 对应的维度，得出一个 out 要替换的位置，替换。





https://discuss.pytorch.org/t/repeat-examples-along-batch-dimension/36217



https://pytorch.org/docs/stable/generated/torch.Tensor.repeat.html

https://www.cnblogs.com/massquantity/p/8908859.html





[Deeplizard《Pytorch神经网络高效入门教程》中文字幕版_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1UE411N7pD?p=4)

[从零开始的机器学习实践笔记 - 知乎](https://www.zhihu.com/column/c_1213762851279802368)



作者：zach
链接：https://www.zhihu.com/question/55720139/answer/528426511
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



最近在学习用pytorch写NLP方面的模型，向Lab里一个大佬请教了一下经验，结合自己最近找的资源进行了汇总，也顺便在知乎share一下：

- Deep Learning with PyTorch [http://deeplizard.com/learn/playlist/PLZbbT5o_s2xrfNyHZsM6ufI0iZENK9xgG](https://link.zhihu.com/?target=http%3A//deeplizard.com/learn/playlist/PLZbbT5o_s2xrfNyHZsM6ufI0iZENK9xgG)
- ML for everyone with PyTorch HKUST（PPT+Video+Code）[https://github.com/hunkim/PyTorchZeroToAll](https://link.zhihu.com/?target=https%3A//github.com/hunkim/PyTorchZeroToAll)
- 官网的教程示例 [60min tutorial] [https://pytorch.org/tutorials/beginner/deep_learning_60min_blitz.html](https://link.zhihu.com/?target=https%3A//pytorch.org/tutorials/beginner/deep_learning_60min_blitz.html)
- Harvard的transformer源码 [http://nlp.seas.harvard.edu/2018/04/03/attention.html](https://link.zhihu.com/?target=http%3A//nlp.seas.harvard.edu/2018/04/03/attention.html)
- 莫烦 [https://www.bilibili.com/watchlater/#/av15997678/p15](https://link.zhihu.com/?target=https%3A//www.bilibili.com/watchlater/%23/av15997678/p15)
- Udacity: [https://www.udacity.com/course/deep](https://link.zhihu.com/?target=https%3A//www.udacity.com/course/deep-learning-pytorch--ud188)





```python
# fc1 = torch.arange(0, 12).reshape(1, 3, 4)
# fc2 = torch.arange(0, 4).reshape(1, 1, 4)

# print(fc1)
# print(fc2)
# print(fc1 + fc2)
```
