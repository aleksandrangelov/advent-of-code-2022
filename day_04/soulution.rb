input = File.open('./input.txt').readlines.map(&:chomp)
# input = '
# 2-4,6-8
# 2-3,4-5
# 5-7,7-9
# 2-8,3-7
# 6-6,4-6
# 2-6,4-8'.chomp.split

result = input.select do |pair|
    first_section, second_section = pair.split(',')
    first_section_start, first_section_end = first_section.split('-').map(&:to_i)
    second_section_start, second_section_end = second_section.split('-').map(&:to_i)
    first_section_range = (first_section_start..first_section_end).to_a
    second_section_range = (second_section_start..second_section_end).to_a

    # (first_section_range - second_section_range).empty? || (second_section_range - first_section_range).empty?
    (first_section_range & second_section_range).any? 
end.size

print result