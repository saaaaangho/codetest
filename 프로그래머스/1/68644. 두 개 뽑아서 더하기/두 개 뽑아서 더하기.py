def solution(numbers):
    check = []
    idx = 1
    
    for i in numbers:
        for j in range(idx, len(numbers)):
            num = i + numbers[j]
            if num not in check:
                check.append(num)
            else:
                continue
        idx += 1
        
        
    return sorted(check)