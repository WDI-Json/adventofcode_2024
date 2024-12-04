input = File.read('input_d2.txt')

array = input.split("\n").map do |line|
    line.split.map(&:to_i)
  end

  def count_valid_levels(matrix)
    total_valid = 0
  
    matrix.each do |row|
      # Step 1: Calculate differences
      differences = row.each_cons(2).map { |a, b| b - a }
  
      # Step 2: Check for all increasing or all decreasing
      all_increasing = differences.all? { |diff| diff > 0 }
      all_decreasing = differences.all? { |diff| diff < 0 }
  
      # Step 3: Check if all differences are between 1 and 3
      valid_range = differences.all? { |diff| diff.abs.between?(1, 3) }
  
      # Step 4: Increment total if conditions are met
      total_valid += 1 if (all_increasing || all_decreasing) && valid_range
    end
  
    total_valid
  end

  puts count_valid_levels(array)
