import heapq

def solution(jobs):
    new = []
    for idx, job in enumerate(jobs):
        new.append([idx, job])
    new.sort(key=lambda x: x[1][0])
        
    heap = []
    time = 0
    total_time = 0
    idx = 0
    n = len(new)
    
    while idx < n or heap:
        while idx < n and new[idx][1][0] <= time:
            job_id = new[idx][0]
            request = new[idx][1][0]
            duration = new[idx][1][1]
            heapq.heappush(heap, (duration, request, job_id))
            idx += 1
            
        if heap:
            duration, request, job_id = heapq.heappop(heap)
            time += duration
            total_time += time - request
        else:
            time = new[idx][1][0]
            
    return total_time // n
        
    