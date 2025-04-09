from collections import deque

def solution(priorities, location):
    first = max(priorities)
    stack = []
    for idx, pri in enumerate(priorities):
        stack.append([idx, pri])
    
    queue = deque(stack)
    order = 0
    while queue:
        current = queue.popleft()
        
        if any(current[1] < q[1] for q in queue):
            queue.append(current)
        else:
            order += 1
            if current[0] == location:
                return order
    
        
    
    
    
    
            
    
        
    
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
#     result = {}
#     answer = 0
    
#     for i, j in enumerate(priorities):
#         result[i] = j
#     print(result)
#     result = sorted(result.items(), key=lambda x: x[1], reverse=True)
#     print(result)
#     for a in result:
#         if a[0] == location:
#             answer = result.index(a) + 1
#     print(answer)


    
    