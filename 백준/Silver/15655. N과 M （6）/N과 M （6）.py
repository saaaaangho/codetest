n, m = map(int, input().split())
nums = sorted(list(map(int, input().split())))

arr = []

def recur(number, start):
    if number == m:
        print(*arr)
        return
    
    for i in range(start, n):
        arr.append(nums[i])
        recur(number+1, i+1)
        arr.pop()

recur(0, 0)