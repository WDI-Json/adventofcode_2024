input = File.read('input_d3.txt')

valid_instructions = input.scan(/mul\((\d+),(\d+)\)/)
results = valid_instructions.map do |x, y|
  x.to_i * y.to_i 
end

puts results.sum