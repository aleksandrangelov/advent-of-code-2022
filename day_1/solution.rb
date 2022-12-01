data = File.open('./input.txt').readlines.map(&:chomp)
data = data.map { _1 == '' ? 'n' : _1 }.join(',').split('n').map { _1.split(',').map(&:to_i).reduce(&:+) }.sort.last(3).reduce(&:+)

print data
