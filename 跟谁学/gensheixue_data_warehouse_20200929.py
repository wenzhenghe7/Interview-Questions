# TODO 请在这里编写代码
# 有序的整数数组[2,2,3,5,7,9,10,10,11,12,13,14]，
# 寻找满足[]+[]=K条件的值。如果 K=12，则输出(2,10)(2,10)(2,10)(2,10)(3,9)(5,7)组合的对
def solution(array, target):
    d = {}
    for i,num in enumerate(array):
        if d.get(target-num) is not None:
            times = d.get(target-num)
            for _ in range(times):
                print([num, target - num])
        if d.get(num) is None:
            d[num] = 1
        else:
            d[num] += 1