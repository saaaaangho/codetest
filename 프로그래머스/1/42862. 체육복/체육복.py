def solution(n, lost, reserve):
    check = [1 for _ in range(n)]

    for i in range(len(reserve)):
        check[reserve[i]-1] += 1
        
    for i in range(len(lost)):
        check[lost[i]-1] -= 1
    
    for i in range(n):
        if check[i] == 2:
            if i > 0 and check[i-1] == 0:
                check[i] -= 1
                check[i-1] += 1
            elif i < n-1 and check[i+1] == 0:
                check[i] -= 1
                check[i+1] += 1
            
    count = sum(1 for x in check if x != 0)
    return count
        
    
    
    
        
    