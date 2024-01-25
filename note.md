- 这讲课老师还有其他的课程吗？（这个课程有点老了）

<!-- https://www.coursera.org/learn/programming-languages/lecture/CTpaX/functions-informally -->

- @ques ml 怎么改变 list 中的一个元素
- @ques ml 怎么排序
- @ques ml 有没有 typeOf
- @ques ml 泛型 -> `'a`

- @ques add -> int + real

## 2024-01-25 16:11:06

- gcd 是最小公约数？

```sml
fun gcd (x,y) =
    if x=y
    then x
    else if x < y
    then gcd(x,y-x)
    else gcd(y,x)

```
