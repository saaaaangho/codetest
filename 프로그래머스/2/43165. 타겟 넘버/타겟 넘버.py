def solution(numbers, target):
    count = 0
    
    def dfs(check, idx):
        nonlocal count
        
        if idx == len(numbers):
            if check == target:
                count += 1
            return
        
        dfs(check+numbers[idx], idx+1)
        dfs(check-numbers[idx], idx+1)
    
    dfs(0, 0)
    return count

        
    
    