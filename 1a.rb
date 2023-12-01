t = 0
File.foreach(ARGV[0]) { |line|
	m = line.scan(/\d/)
	t += m.first.to_i * 10 + m.last.to_i
}
puts t
