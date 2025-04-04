import sys
input = sys.stdin.read

data = input().split()
N = int(data[0])

T = [0] * N
P = [0] * N
for i in range(N):
    T[i] = int(data[2*i + 1])
    P[i] = int(data[2*i + 2])

dp = [0]*(N+2)

for i in range(N-1, -1, -1):
    if i + T[i] <= N:
        dp[i] = max(P[i] + dp[i + T[i]], dp[i+1])
    else:
        dp[i] = dp[i+1]

print(dp[0])