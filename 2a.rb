c = {'r' => 12, 'g' => 13, 'b' => 14}
t = 0
File.foreach(ARGV[0]) { |line|
	lt = 0
	line.scan(/(\d+)\D(\D)/).each { |m|
		if m.last.eql? " "
			lt = m.first.to_i
		else
			if m.first.to_i > c[m.last]
				lt = 0
				break;
			end
		end
	}
	t += lt
}
puts t
