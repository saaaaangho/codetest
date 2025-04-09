from itertools import permutations

def is_prime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True
    
def solution(numbers):
    numbers = list(numbers)
    nums_set = set()
    
    for r in range(1, len(numbers)+1):
        for perm in permutations(numbers, r):
            num = int(''.join(perm))
            nums_set.add(num)
            
    count = 0
    for num in nums_set:
        if is_prime(num):
            count += 1
    return count
        
    