n, m = map(int, input().split())
arr = []


def recur(number, start):
    if number == m:
        print(*arr)
        return
    
    for i in range(start, n+1):
        arr.append(i)
        recur(number+1, i)
        arr.pop()

recur(0, 1)