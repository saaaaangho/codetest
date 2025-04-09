def solution(progresses, speeds):
    answer = []
    stack = []
    for i in range(len(progresses)):
        day = 0
        while True:
            if progresses[i] >= 100:
                break
            progresses[i] = progresses[i] + speeds[i]
            day += 1
        stack.append(day)
        
    cnt = 1
    prev_day = stack[0]
    
    for i in range(1, len(stack)):
        if stack[i] <= prev_day:
            cnt += 1
        else:
            answer.append(cnt)
            cnt = 1
            prev_day = stack[i]
            
    answer.append(cnt)
    return answer
    
        
        
        
        
                       
        
            
        