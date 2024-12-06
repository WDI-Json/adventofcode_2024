input = File.read('input_d4.txt')

lines = input.split("\n")
draw_numbers = lines.shift.split(",").map(&:to_i)

# Parse the boards
boards = []
current_board = []

lines.each do |line|
  if line.strip.empty?
    boards << current_board unless current_board.empty?
    current_board = []
  else
    current_board << line.split.map(&:to_i)
  end
end

boards << current_board unless current_board.empty?

def bingo?(board, drawn_numbers)
  board.any? { |row| row.all? { |num| drawn_numbers.include?(num) } } ||
  board.transpose.any? { |col| col.all? { |num| drawn_numbers.include?(num) } }
end

def calculate_score(board, drawn_numbers, last_number)
  unmarked_sum = board.flatten.reject { |num| drawn_numbers.include?(num) }.sum
  unmarked_sum * last_number
end

# Draw numbers until there's a bingo
def play_bingo(draw_numbers, boards)
  drawn_numbers = []

  draw_numbers.each do |number|
    drawn_numbers << number

    boards.each do |board|
      if bingo?(board, drawn_numbers)
        score = calculate_score(board, drawn_numbers, number)
        return { board: board, score: score, last_number: number }
      end
    end
  end

  nil # No bingo found (unlikely with valid inputs)
end


result = play_bingo(draw_numbers, boards)

# Output the results
if result
  puts "Bingo on board:"
  result[:board].each { |row| puts row.join(" ") }
  puts "Last Number: #{result[:last_number]}"
  puts "Score: #{result[:score]}"
else
  puts "No bingo occurred."
end