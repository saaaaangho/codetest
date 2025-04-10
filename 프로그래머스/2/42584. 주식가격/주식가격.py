from collections import deque

def solution(prices):
    answer = []
    prices = deque(prices)
    
    while prices:
        cnt = 0     
        now = prices.popleft()
        
        for price in prices:
            cnt += 1
            if now > price:
                break
                
        answer.append(cnt)
        
    return answer
        
            
            
