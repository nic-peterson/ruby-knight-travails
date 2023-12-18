def trace_path(end_pos, visited)
  path = []
  while end_pos
    path.unshift(end_pos)
    end_pos = visited[end_pos]
  end
  path
end

def knight_moves(start, target)
  board_size = 8
  moves = [[2, 1], [1, 2], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1]]

  # Check if the position is inside the board
  is_inside_board = ->(x, y) { x.between?(0, board_size - 1) && y.between?(0, board_size - 1) }

  # Initialize the queue and visited hash
  queue = [start]
  visited = { start => nil }

  # Breadth-first search for the shortest path
  until queue.empty?
    current = queue.shift
    print current
    return trace_path(current, visited) if current == target

    moves.each do |dx, dy|
      next_move = [current[0] + dx, current[1] + dy]
      if is_inside_board.call(*next_move) && !visited.include?(next_move)
        queue << next_move
        visited[next_move] = current
      end
    end
  end
end

# Test cases
test_cases = [[[0, 0], [1, 2]], [[0, 0], [3, 3]], [[3, 3], [0, 0]], [[0, 0], [7, 7]]]
test_cases.each do |start, target|
  puts "knight_moves(#{start}, #{target}) == #{knight_moves(start, target).inspect}"
end
