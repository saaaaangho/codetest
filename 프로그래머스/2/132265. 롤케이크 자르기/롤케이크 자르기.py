from collections import defaultdict

def solution(topping):
    left = defaultdict(int)
    right = defaultdict(int)
    cnt = 0
    
    for t in topping:
        right[t] += 1
        
    left_kind = 0
    right_kind = len(right)
    
    for i in range(len(topping)):
        t = topping[i]
        
        if left[t] == 0:
            left_kind += 1
        left[t] += 1
        
        right[t] -= 1
        
        if right[t] == 0:
            right_kind -= 1
        
        if left_kind == right_kind:
            cnt += 1
            
    return cnt
