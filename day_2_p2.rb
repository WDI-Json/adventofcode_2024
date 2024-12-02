input = File.read('input_d2.txt')

# Parse the input into a 2D array of integers
array = input.split("\n").map { |line| line.split.map(&:to_i) }

def count_safe_reports(matrix)
  total_safe = 0

  matrix.each do |row|
    if valid_levels?(row)
      total_safe += 1
      next
    end

    safe_after_removal = row.each_with_index.any? do |_, index|
      reduced_row = row[0...index] + row[index + 1..]
      valid_levels?(reduced_row)
    end

    total_safe += 1 if safe_after_removal
  end

  total_safe
end

def valid_levels?(row)
  return true if row.size < 2

  differences = row.each_cons(2).map { |a, b| b - a }

  all_increasing = differences.all? { |diff| diff > 0 }
  all_decreasing = differences.all? { |diff| diff < 0 }

  valid_range = differences.all? { |diff| diff.abs.between?(1, 3) }

  (all_increasing || all_decreasing) && valid_range
end

puts count_safe_reports(array)
