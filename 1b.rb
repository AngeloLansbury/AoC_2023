w = {'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}
wk = w.keys.join("|")
w = w.merge({'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9})

t = 0
File.foreach(ARGV[0]) { |line|
	m = line.scan(/(?=(\d|#{wk}))/).flatten
	t += w[m.first] * 10 + w[m.last]
}
puts t
