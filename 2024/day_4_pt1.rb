# Read the input file into a string# Read the input file into a string
input = File.readlines('input_d4.txt')
grid = input.map(&:chars) 

target = "XMAS"
reverse_target = target.reverse

rows = grid.length
cols = grid.first.length

count = 0

# Horizontal search (left-to-right and right-to-left)
grid.each do |row|
  row_string = row.join # Convert the row back into a string
  count += row_string.scan(/(?=#{target})/).count       
  count += row_string.scan(/(?=#{reverse_target})/).count
end

# Vertical search (top-to-bottom and bottom-to-top)
(0...cols).each do |col|
  vertical = grid.map { |row| row[col] }.join # Collect the column as a string
  count += vertical.scan(/(?=#{target})/).count        
  count += vertical.scan(/(?=#{reverse_target})/).count
end

# Diagonal search (top-left to bottom-right and reverse)
def diagonals(grid)
  diagonals = []
  rows, cols = grid.length, grid.first.length

  # Collect diagonals from top-left to bottom-right
  (0...(rows + cols - 1)).each do |d|
    diagonal = []
    (0..d).each do |i|
      j = d - i
      diagonal << grid[i][j] if i < rows && j < cols
    end
    diagonals << diagonal.join
  end

  # Collect diagonals from top-right to bottom-left
  (-(rows - 1)...cols).each do |d|
    diagonal = []
    (0...[rows, cols].min).each do |i|
      row, col = i, d + i
      diagonal << grid[row][col] if row >= 0 && row < rows && col >= 0 && col < cols
    end
    diagonals << diagonal.join
  end

  diagonals
end

# Search diagonals
diagonals(grid).each do |diag|
  count += diag.scan(/(?=#{target})/).count        # Top-left to bottom-right
  count += diag.scan(/(?=#{reverse_target})/).count # Top-right to bottom-left
end

# Print the final count
puts "Total occurrences of '#{target}': #{count}"
