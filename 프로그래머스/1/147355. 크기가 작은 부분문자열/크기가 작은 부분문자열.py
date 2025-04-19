def solution(t, p):    
    tl, pl = len(t), len(p)
    check = []
    cnt = 0
    for i in range(pl, tl+1):
        check.append(int(t[i-pl:i]))
    
    for c in check:
        if c <= int(p):
            cnt += 1
            
    return cnt