# Open the URL and read the contents
input = File.read('input_d1.txt')

# Split the input into lines and separate the left and right numbers
left_numbers = []
right_numbers = []

input.split("\n").each do |line|
  left, right = line.split.map(&:to_i) # Split each line into two numbers and convert to integers
  left_numbers << left  # Add the left number to the left_numbers array
  right_numbers << right  # Add the right number to the right_numbers array
end

def count_occurence_in(num, array)
    return nil if array.empty?
    array.count { |x| num == x }
end

occurence_list = []
left_numbers.each do |num|
  occurence_list << (count_occurence_in(num, right_numbers) * num)
end

puts occurence_list.sum