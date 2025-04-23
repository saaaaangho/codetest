from collections import defaultdict

def solution(s):
    answer = []
    check = defaultdict(int)
    for idx, word in enumerate(s):
        if word not in check:
            answer.append(-1)
        else:
            answer.append(abs(check[word]-idx))
            
        check[word] = idx
        
    return answer
        

