def solution(name):
    updown = 0
    for u in name:
        updown += min(ord(u) - ord('A'), ord('Z') - ord(u)+1)
        
    move = len(name)-1
    for i in range(len(name)):
        next_idx = i+1
        while next_idx < len(name) and name[next_idx] == 'A':
            next_idx += 1
            
        move = min(move, i + i + len(name)-next_idx)
        move = min(move, i + 2 * (len(name) - next_idx))
                
    return updown + move
            
    
    