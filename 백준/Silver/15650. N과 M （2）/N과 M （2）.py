n, m = map(int, input().split())
arr = []
used = set()

def recur(number):
    if number == m:
        sorted_tuple = tuple(sorted(arr))
        if sorted_tuple in used:
            return
        used.add(sorted_tuple)
        print(*arr)
        return
    
    for i in range(1, n+1):
        if i in arr:
            continue
        arr.append(i)
        recur(number+1)

        arr.pop()

recur(0)