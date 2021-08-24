1.zero_grad（）函数的应用：

根据pytorch中的backward()函数的计算，当网络参量进行反馈时，梯度是被积累的而不是被替换掉；但是在每一个batch时毫无疑问并不需要将两个batch的梯度混合起来累积，因此这里就需要每个batch设置一遍zero_grad 了。

其实这里还可以补充的一点是，如果不是每一个batch就清除掉原有的梯度，而是比如说两个batch再清除掉梯度，这是一种变相提高batch_size的方法，对于计算机硬件不行，但是batch_size可能需要设高的领域比较适合，比如目标检测模型的训练。

  在pytorch中做随机梯度下降时往往会用到zero_grad（）函数，相关代码如下。

```python
optimizer.zero_grad()                       # 将模型的参数梯度初始化为0

outputs=model（inputs）              # 前向传播计算预测值

loss = cost(outputs, y_train)           # 计算当前损失

loss.backward()                               # 反向传播计算梯度

optimizer.step()                               # 更新所有参数   
```

2.zero_grad（）函数的作用： 

根据pytorch中backward（）函数的计算，当网络参量进行反馈时，梯度是累积计算而不是被替换，但在处理每一个batch时并不需要与其他batch的梯度混合起来累积计算，因此需要对每个batch调用一遍zero_grad（）将参数梯度置0.

另外，如果不是处理每个batch清除一次梯度，而是两次或多次再清除一次，相当于提高了batch_size，对硬件要求更高，更适用于需要更高batch_size的情况。

