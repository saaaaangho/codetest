def solution(s, n):
    answer = ''
    
    for i in s:
        if 'a' <= i <= 'z':
            answer += chr((ord(i) - ord('a') + n) % 26 + ord('a'))
        elif 'A' <= i <= 'Z':
            answer += chr((ord(i) - ord('A') + n) % 26 + ord('A'))
        else:
            answer += i
    
    return answer