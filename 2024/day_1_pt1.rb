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

def remove_min_value(array)
    return nil if array.empty?
    min_value = array.min
    array.delete_at(array.index(min_value))
    min_value
end

distance_list = []
while !(left_numbers.empty?) do
    min_l = remove_min_value(left_numbers)
    min_r = remove_min_value(right_numbers)

    distance_list << (min_l - min_r).abs
end

puts distance_list.sum