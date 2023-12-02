p = 0
File.foreach(ARGV[0]) { |line|
	l = {'r' => 0, 'g' => 0, 'b' => 0}
	line.scan(/(\d+)\D(\w)/).each { |m|
		l[m.last] = m.first.to_i if l[m.last] < m.first.to_i
	}
	p += l['r'] * l['g'] * l['b']
}
puts p
