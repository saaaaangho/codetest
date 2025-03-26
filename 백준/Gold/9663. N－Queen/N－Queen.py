n = int(input())

cnt = 0

cols = [False] * n
diag1 = [False] * (2*n -1)
diag2 = [False] * (2*n -1)

def n_queen(row):
    global cnt
    if row == n:
        cnt += 1
        return
    
    for col in range(n):
        if cols[col] or diag1[row + col] or diag2[row - col + n - 1]:
            continue

        cols[col] = diag1[row + col] = diag2[row - col + n - 1] = True

        n_queen(row+1)
        cols[col] = diag1[row + col] = diag2[row - col + n - 1] = False

n_queen(0)

print(cnt)