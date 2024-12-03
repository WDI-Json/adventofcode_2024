input = File.read('input_d3.txt')

instructions = input.scan(/(do\(\))|(don't\(\))|mul\((\d+),(\d+)\)/)
mul_enabled = true
total_sum = 0

instructions.each do |do_instr, dont_instr, x, y|
  if do_instr
    mul_enabled = true
  elsif dont_instr
    mul_enabled = false
  elsif mul_enabled && x && y
    total_sum += x.to_i * y.to_i
  end
end

puts "The sum of valid mul results is: #{total_sum}"
