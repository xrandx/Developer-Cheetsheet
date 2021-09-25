[Vim 常用命令总结](https://pizn.github.io/2012/03/03/vim-commonly-used-command.html)

[ClausewitzCPU0/VimTutorial: VimTutorial / Vim入门教程](https://github.com/ClausewitzCPU0/VimTutorial)

[calon/Vim-Tutorial-for-Non-Programmers: 写给非程序员的 Vim 新手教程](https://github.com/calon/Vim-Tutorial-for-Non-Programmers)

# 普通模式

## 移动

### 前缀可加数字 N

#### 按字符移动

`h`向左移动

`j` 向下移动

`k` 向上移动

`l` 向右移动

#### 按单词移动

`b` 向前移动到第 N 个单词的开头 (begin)

`B` 向前移动到第 N 个单词的开头，忽略分割符

`w` 向后移动到第 N 个单词的开头 (word)

`W` 向后移动到第 N 个单词的开头 ，忽略分割符

`e` 向后移动到第 N 个单词的结尾 (end)

`E`向后移动到第 N 个单词的结尾 (end)，忽略分割符

#### 移动到极端位置

`0` 移动到当前行的第一个字符处 (Home key)

`^`移动到当前行的第一个非空字符处

## 复制

`y`

## 剪切

n`x` ：从光标处剪切 n 个字符。

`d`[motion] ：剪切 motion 中经过的字符

n `dd`：删除 n 行



### replace 命令：快速修改

`r` 键会用接下来键入的一个字符替换当前光标下的字符 （但仍然处在普通模式下）。按下 `r` 键后可以按 `Esc` 取消本次替换操作，使得接下来键入的字符不会替换当前光标所在字符。

`R` 一直输入一直替换

`s` 替换并进入插入模式，4`s` 删除4个字符并进入插入模式。 

`S` 整行清空并进入插入模式

`c` 删除并进入插入模式，`caw`删除当前单词并进入插入模式 change a word 。

`C` 删除整行并进入插入模式

# 进阶

