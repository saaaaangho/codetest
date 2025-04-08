candy = int(input())
cnt = 0

for C in range(1, candy+1):
    if C%2 != 0:
        continue

    for B in range(1, candy+1):
        for A in range(1, candy+1):
            if A+B+C != candy:
                continue
            if A < B+2:
                continue
            cnt += 1

print(cnt)