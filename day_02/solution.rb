input = File.open('./input.txt').readlines.map(&:chomp)

sign_beats_sign_map = {
  'A' => 'C',
  'B' => 'A',
  'C' => 'B'
}
sign_beats_sign_map_inverted = sign_beats_sign_map.invert

# mapping = {
#   'X' => ['A', 1],
#   'Y' => ['B', 2],
#   'Z' => ['C', 3]
# }

result = input.reduce(0) do |sum, pair|
  elf_sign, sign = pair.split(' ')
  # sign, score = mapping[my_sign]

  if sign == 'Y'
    sign = elf_sign
    score = 3
  elsif sign == 'X'
    sign = sign_beats_sign_map[elf_sign]
    score = 0
  else
    sign = sign_beats_sign_map_inverted[elf_sign]
    score = 6
  end
  # print sign, score
  score += (sign_beats_sign_map.find_index { |key, _| key == sign } + 1)
  # if elf_sign == my_sign
  #   score += 3
  # elsif sign_beats_sign_map[my_sign] == elf_sign
  #   score += 6
  # end

  sum + score
end

print result