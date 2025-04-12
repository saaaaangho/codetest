from collections import defaultdict

def solution(tickets):
    graph = defaultdict(list)
    start = 'ICN'
    for a, b in tickets:
        graph[a].append(b)
        
    for a in graph:
        graph[a].sort(reverse=True)
        
    route = []
    
    def dfs(recur):
        while graph[recur]:
            next_dest = graph[recur].pop()
            dfs(next_dest)
        route.append(recur)
    
    dfs(start)
    
    return route[::-1]
        
        
        
    
    
    