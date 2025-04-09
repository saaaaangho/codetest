from collections import deque

def solution(bridge_length, weight, truck_weights):
    on_bridge = deque([0 for _ in range(bridge_length)])
    truck_weights = deque(truck_weights)
    time = 0
    current_weight = 0
    
    while on_bridge:
        time += 1
        
        left = on_bridge.popleft()
        current_weight -= left
        
        if truck_weights:
            if current_weight + truck_weights[0] <= weight:
                t = truck_weights.popleft()
                on_bridge.append(t)
                current_weight += t
            else:
                on_bridge.append(0)
                
    return time

    
    
    
    
            
        
                
            
        
        
        
        
        
        
        
        
        
        