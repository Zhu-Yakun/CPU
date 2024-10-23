# Verilog编程
同济大学2022级Verilog编程代码

## 数字逻辑
无需多言，每次的作业实现，仅供借鉴，点到为止

## 计算机组成原理
主要是两次CPU设计，31条CPU做的比较详细，两次都做的单周期——因为我懒（没时间）

[一个之前学长学姐写的很不错的基础教程]: https://skyleaworlder.github.io/2020/06/18/CPU31/  

### CPU31
31条指令CPU由于没有经验，所以导致文件有点污染，所以索性把前仿真、后仿真、下板分开了  
>> CPU31 -> 前仿真  
>> CPU31_zyk -> 后仿真  
>> CPU31_Board -> 下板  
建议做之前仔细看一下我的31条CPU的报告的最后，相信你会回来感谢我一下（比如点个Star）  
时序报告修改内容感兴趣也可以看一下——是可以做到没有任何报错的  

### CPU54
54条指令CPU与之前类似，重点在于增加了中断指令，同样先去看我报告的最后  
仿真和下板的top在外面的txt里（这次做的比之前好）  

## 附：
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  
仅供借鉴，谢谢！  

以上100句  

如果你有耐心看到这里，那么恭喜你！你可以额外得到一条信息  
在CPU设计中，2022级许多人都遇到了（后）仿真失败的问题，解决方法其实很简单  
新建一个项目，在创建仿真的testbench文件时，注意文件类型一定要是simulation文件  
有的人不新建项目也可以，直接再写一个tb文件  
提醒：尽量不要和之前的tb文件同名  