t = 0
File.foreach(ARGV[0]) { |line|
	v = (line[10..38] + line[41..115]).split(/\s+/).sort
	h = 0
	v.reduce { |c, i| h += 1 if c.eql? i; c = i }
	t += h == 0 ? 0 : 2**(h - 1)
}
puts t
