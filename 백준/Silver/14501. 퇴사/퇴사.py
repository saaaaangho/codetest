N = int(input())
T = []
P = []

for _ in range(N):
    t, p = map(int, input().split())
    T.append(t)
    P.append(p)

dp = [-1] * (N+1)

def solve(day):
    if day >= N:
        return 0

    if dp[day] != -1:
        return dp[day]

    if day + T[day] <= N:
        take = P[day] + solve(day + T[day])
    else:
        take = 0

    skip = solve(day+1)

    dp[day] = max(take, skip)
    return dp[day]

print(solve(0))