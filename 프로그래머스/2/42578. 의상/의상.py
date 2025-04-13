def solution(clothes):
    answer = 1
    dict = {}
    for element in clothes:
        key = element[1]
        value = element[0]
        dict.setdefault(key, []).append(value)
    
    for key in dict.keys():
        answer = answer*(len(dict[key])+1)
    
    return answer-1
            
