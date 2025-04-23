def solution(s):
    words = list(map(str, s.split(' ')))
    answer = ''
    
    for word in words:
        new_word = ''
        for i, char in enumerate(word):
            if i % 2 == 0:
                new_word += char.upper()
            else:
                new_word += char.lower()
        
        answer += new_word + ' '
        
    return answer[:-1]
        
    
    
                
    