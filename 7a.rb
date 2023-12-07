hs = Array.new
def hand_type(h)
	return 6 if /(\S)\1\1\1\1/.match(h)
	return 5 if /(\S)\1\1\1/.match(h)
	return 4 if /(\S)\1\1(\S)\2/.match(h) || /(\S)\1(\S)\2\2/.match(h)
	return 3 if /(\S)\1\1/.match(h)
	return 2 if /(\S)\1\S?(\S)\2/.match(h)
	return 1 if /(\S)\1/.match(h)
	return 0
end
File.foreach(ARGV[0]) { |line|
	d = line.split(/\s+/)
	hs.push([
		hand_type(d[0].split(//).sort.join),
		("0x" + d[0].gsub(/\D/, {'T'=>'a','J'=>'b','Q'=>'c','K'=>'d','A'=>'e'})).to_i(16),
		d[1].to_i
	])
}
i = 1
s = 0
hs.sort.each do |h|
	s += h.last * i
	i += 1
end
puts s
