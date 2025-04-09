from itertools import product
    
def solution(word):
    dic = ['A', 'E', 'I', 'O', 'U']
    check = []
    
    for r in range(1, len(dic)+1):
        for pro in product(dic, repeat=r):
            check.append(''.join(pro))
            
    check.sort()
    
    idx = check.index(word)
    return idx + 1
        
            
    
    
    
            
    
    
    