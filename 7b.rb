hs = Array.new
def hand_type(h)
	j = h.count("J")
	c = {}
	h.gsub("J", "").split(//).each do |i|
		c[i] = c[i].nil? ? 1 : c[i] + 1
	end
	v = c.values.sort
	return 6 if j == 5 || v.last + j == 5
	return 5 if v.last + j == 4
	return 4 if v.first + v.last + j == 5
	return 3 if v.last + j == 3
	return 2 if v.length == 3
	return 1 if v.length == 4
	return 0
end
File.foreach(ARGV[0]) { |line|
	d = line.split(/\s+/)
	hs.push([
		hand_type(d[0]),
		("0x" + d[0].gsub(/\D/, {'T'=>'a','J'=>'1','Q'=>'c','K'=>'d','A'=>'e'})).to_i(16),
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
