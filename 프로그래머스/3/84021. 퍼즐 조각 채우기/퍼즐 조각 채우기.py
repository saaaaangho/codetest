from collections import deque

def normalize(block):
    block = sorted(block)
    min_x = block[0][0]
    min_y = block[0][1]
    return sorted([(x-min_x, y-min_y) for x, y in block])

def rotate(block):
    return normalize([(-y, x) for x, y in block])

def find_blocks(board, target):
    n = len(board)
    visited = [[False]*n for _ in range(n)]
    blocks = []

    for i in range(n):
        for j in range(n):
            if board[i][j] == target and not visited[i][j]:
                q = deque()
                q.append((i, j))
                visited[i][j] = True
                block = [(0, 0)]
                origin_x, origin_y = i, j

                while q:
                    x, y = q.popleft()
                    for dx, dy in [(-1,0), (1,0), (0,-1), (0,1)]:
                        nx, ny = x + dx, y + dy
                        if 0 <= nx < n and 0 <= ny < n:
                            if board[nx][ny] == target and not visited[nx][ny]:
                                visited[nx][ny] = True
                                q.append((nx, ny))
                                block.append((nx - origin_x, ny - origin_y))

                blocks.append(normalize(block))

    return blocks

def solution(game_board, table):
    answer = 0
    puzzle_pieces = find_blocks(table, 1)
    empty_spaces = find_blocks(game_board, 0)

    used = [False] * len(puzzle_pieces)

    for space in empty_spaces:
        for i, piece in enumerate(puzzle_pieces):
            if used[i]:
                continue
            for _ in range(4):
                if piece == space:
                    answer += len(piece)
                    used[i] = True
                    break
                piece = rotate(piece)
            if used[i]:
                break

    return answer