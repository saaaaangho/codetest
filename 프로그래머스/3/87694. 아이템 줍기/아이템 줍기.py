from collections import deque

def border(rectangles, board):
    for x1, y1, x2, y2 in rectangles:
        x1, y1, x2, y2 = x1*2, y1*2, x2*2, y2*2
        for x in range(x1, x2+1):
            for y in range(y1, y2+1):
                if x == x1 or x == x2 or y == y1 or y == y2:
                    if board[x][y] != 2:
                        board[x][y] = 1
                else:
                    board[x][y] = 2
                    
def bfs(board, start, end):
    q = deque()
    visited = [[False]*102 for _ in range(102)]
    q.append((*start, 0))
    visited[start[0]][start[1]] = True
    
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    
    while q:
        x, y, dist = q.popleft()
        if (x, y) == end:
            return dist // 2
        
        for i in range(4):
            nx = x+dx[i]
            ny = y+dy[i]
            
            if 0 <= nx < 102 and 0 <= ny < 102:
                if board[nx][ny] == 1 and not visited[nx][ny]:
                    visited[nx][ny] = True
                    q.append((nx, ny, dist+1))
    return -1
                    
def solution(rectangle, characterX, characterY, itemX, itemY):
    board = [[0]*102 for _ in range(102)]
    border(rectangle, board)
    
    start = (characterX*2, characterY*2)
    end = (itemX*2, itemY*2)
    return bfs(board, start, end)