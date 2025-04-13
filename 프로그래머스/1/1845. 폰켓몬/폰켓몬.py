from collections import Counter

def solution(nums):
    n_counter = Counter(nums)
    l = len(nums)
    if len(n_counter) >= l/2:
        return l/2
    else:
        return len(n_counter)