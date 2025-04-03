def solution(k, dungeons):
    max_cnt = 0
    n = len(dungeons)
    visited = [False]*n
    
    def dfs(remaining, cnt):
        nonlocal max_cnt
        max_cnt = max(max_cnt, cnt)
        
        for i in range(n):
            if not visited[i]:
                min_req, cost = dungeons[i]
                if remaining >= min_req:
                    visited[i] = True
                    dfs(remaining-cost, cnt+1)
                    visited[i] = False
    
    dfs(k, 0)
    return max_cnt
        
    


    

