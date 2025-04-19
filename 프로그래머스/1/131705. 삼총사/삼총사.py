def solution(number):
    n = len(number)
    answer = 0
    
    def dfs(depth, idx, total):
        nonlocal answer
        if depth == 3:
            if total == 0:
                answer += 1
            return
        
        for i in range(idx, n):
            dfs(depth+1, i+1, total+number[i])
        
    dfs(0, 0, 0)
    return answer