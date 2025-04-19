from collections import deque

def solution(dirs):
    visited = set()
    queue = deque()
    answer = 0
    
    dir_maps = {
        'U': (-1, 0),
        'D': (1, 0),
        'R': (0, 1),
        'L': (0, -1)
    }
    
    queue.append((0, 0, 0))
    
    while queue:
        x, y, dist = queue.popleft()
        
        if dist == len(dirs):
            return answer
        
        d = dirs[dist]
        dx, dy = dir_maps[d]
        nx, ny = x + dx, y + dy
        
        if -5 <= nx <= 5 and -5 <= ny <= 5:
            path = ((x, y), (nx, ny))
            reverse_path = ((nx, ny), (x, y))
            
            if path not in visited:
                visited.add(path)
                visited.add(reverse_path)
                answer += 1
                
            queue.append((nx, ny, dist+1))
            
        else:
            queue.append((x, y, dist+1))
            
    return answer