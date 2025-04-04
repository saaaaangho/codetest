n = int(input())
m = int(input())
card = []

for _ in range(n):
    card.append(input().strip())

visited = [False] * n
results = set()

def dfs(path, depth):
    if depth == m:
        results.add(''.join(path))
        return
    
    for i in range(n):
        if not visited[i]:
            visited[i] = True
            dfs(path + [card[i]], depth + 1)
            visited[i] = False

dfs([], 0)
print(len(results))