n, m = map(int, input().split())
nums = sorted(list(map(int, input().split())))
arr = []


def recur(number):
    if number == m:
        print(*arr)
        return
    
    for i in range(n):
        if nums[i] in arr:
            continue
        arr.append(nums[i])
        recur(number+1)
        arr.pop()

recur(0)