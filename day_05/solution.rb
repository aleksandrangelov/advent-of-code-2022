stacks = [
  nil,
  %w(J H P M S F N V),
  %w(S R L M J D Q),
  %w(N Q D H C S W B),
  %w(R S C L),
  %w(M V T P F B),
  %w(T R Q N C),
  %w(G V R),
  %w(C Z S P D L R),
  %w(D S J V G P B F)
]

# instructions = 'move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2'

instructions = File.open('./input.txt').readlines.map(&:chomp)

instructions.each do |instruction|
  _, quantity, _, from, _, to = instruction.split(' ')

  stacks[to.to_i] = stacks[to.to_i] + stacks[from.to_i].pop(quantity.to_i)
  # print stacks
end

print stacks.compact.map { _1.pop }.join('')