input = File.readlines('input_d4.txt', chomp: true) 
grid = input.map(&:chars)

rows = grid.length
cols = grid.first.length

# Define the X-MAS patterns
patterns = [
  ["M", "A", "S"],
  ["S", "A", "M"]  
]

count = 0

def is_x_mas?(grid, row, col, patterns)
  # Check bounds for the diagonals
  if row < 1 || row > grid.length - 2 || col < 1 || col > grid.first.length - 2
    puts "  Out of bounds!"
    return false
  end

  top_left = grid[row - 1][col - 1]
  top_right = grid[row - 1][col + 1]
  bottom_left = grid[row + 1][col - 1]
  bottom_right = grid[row + 1][col + 1]

  diag1 = [top_left, grid[row][col], bottom_right]
  diag2 = [bottom_left, grid[row][col], top_right] 

  patterns.include?(diag1) && patterns.include?(diag2)
end

# Search the grid for all X-MAS shapes
(1...(rows - 1)).each do |row|
  (1...(cols - 1)).each do |col|
    if grid[row][col] == "A" && is_x_mas?(grid, row, col, patterns)
      count += 1
    end
  end
end

puts "Total X-MAS shapes: #{count}"
