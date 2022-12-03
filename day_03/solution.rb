input = File.open('./input.txt').readlines.map(&:chomp)
# input = 'vJrwpWtwJgWrhcsFMMfFFhFp
# jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
# PmmdzqPrVvPwwTWBwg
# wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
# ttgJtRGJQctTZtZT
# CrZsJsPPZsGzwwsLwLmpwMDw'.chomp.split()

@char_weights = ['_'] + ('a'..'z').to_a + ('A'..'Z').to_a

groups = Array.new(50) { [] }

input.each_with_index do |string, index|
  sub_group_index = (index % 6) / 3
  group = groups[index / 6]

  if group[sub_group_index].nil?
    group.push([string])
  else
    group[sub_group_index].push(string)
  end
end

def find_common_chars(string1, string2)
  (string1.split('') & string2.split('')).join('')
end

def calc_priorities(groups)
  first_group, second_group = groups

  common_char_first_group = first_group.reduce { |a, b| find_common_chars(a, b) }
  common_char_second_group = second_group.reduce { |a, b| find_common_chars(a, b) }

  @char_weights.find_index(common_char_first_group) + @char_weights.find_index(common_char_second_group)
end

result = groups.reduce(0) { |a, b| a + calc_priorities(b) }
p result