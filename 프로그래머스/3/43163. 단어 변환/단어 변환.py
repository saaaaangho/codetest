from collections import deque

def check_one(a, b):
    return sum(x!=y for x, y in zip(a, b)) == 1

def solution(begin, target, words):
    if target not in words:
        return 0
    
    visited = set()
    queue = deque()
    queue.append((begin, 0))
    
    while queue:
        current_word, cnt = queue.popleft()
        if current_word == target:
            return cnt
        
        for word in words:
            if word not in visited and check_one(current_word, word):
                visited.add(word)
                queue.append((word, cnt+1))
    
    return 0
    
    
    
        
