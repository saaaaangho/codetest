from collections import deque

def bfs(start, graph, visited):
    queue = deque([start])
    visited[start] = True
    count = 1
    
    while queue:
        node = queue.popleft()
        for neighbor in graph[node]:
            if not visited[neighbor]:
                visited[neighbor] = True
                queue.append(neighbor)
                count += 1
    return count

def solution(n, wires):
    min_diff = n
    
    for i in range(len(wires)):
        temp = wires[:i] + wires[i+1:]
        
        graph = [[] for i in range(n+1)]
        for a,b in temp:
            graph[a].append(b)
            graph[b].append(a)
            
        visited = [False]*(n+1)
        
        count = bfs(1, graph, visited)
        diff = abs(count-(n-count))
        min_diff = min(min_diff, diff)
        
    return min_diff
                 
                 
                 

