n, m = map(int, input().split())
arr = []

def recur(number):
    if number == m:
        print(*arr)
        return
    
    for i in range(1, n+1):
        arr.append(i)
        recur(number+1)
        arr.pop()

recur(0)