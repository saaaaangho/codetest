def solution(arr):
    check = []
    check.append(arr[0])
            
    for i in range(1, len(arr)):
        if check[-1] != arr[i]:
            check.append(arr[i])
        else:
            continue
    return check
            
            