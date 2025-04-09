def solution(s):
    stack = []
    for i in s:
        if i == '(':
            stack.append(i)
        else:
            if not stack:
                return False
            stack.pop()
            
    return len(stack) == 0
        
















# def solution(s):
#     check = 0
#     for i in s:
#         if i == '(':
#             check += 1
#         else:
#             check -= 1
#         if check < 0:
#             return False
        
#     if check == 0:
#         return True
#     else:
#         return False
            
        